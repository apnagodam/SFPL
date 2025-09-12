import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/ListOfDirectorsModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/Domain/PartnersDIrectorsService/PartnersDirectorsService.dart';
import 'package:swfl/ui/auth/Login/login_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Adddirectorpartnerscreen extends ConsumerStatefulWidget {
  const Adddirectorpartnerscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdddirectorpartnerscreenState();
}

class _AdddirectorpartnerscreenState
    extends ConsumerState<Adddirectorpartnerscreen> {
  final validationKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final panController = TextEditingController();
  final aadharController = TextEditingController();
  final profilePicProvider = StateProvider<File?>((ref) => null);

  final isOtpSent = StateProvider((ref) => false);
  var directorPartnerData = StateProvider<Map<String, dynamic>?>((ref) => null);
  var directorPartnerList = StateProvider<List<DirectorDatum>?>((ref) => null);

  final isLoading = StateProvider((ref) => false);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAllData();
    });
  }

  void _fetchAllData() {
    ref
        .watch(loginInfoProvider.future)
        .then((value) => ref.watch(sharedUtilityProvider).setUser(value.data));
    _fetchAddedPartnersData();
  }

  void _fetchAddedPartnersData() {
    ref.read(isLoading.notifier).state = true;
    ref.read(directorsPartnersListProvider.future).then((list) {
      ref.read(directorPartnerList.notifier).state = list.data;
    });
    if (ref.watch(isLoading)) {
      nameController.text = 'Loading ';
      phoneController.text = 'Loading ';
      panController.text = 'Loading ';
      aadharController.text = 'Loading ';
    } else {
      nameController.clear();
      phoneController.clear();
      panController.clear();
      aadharController.clear();
    }
    ref
        .read(fetchAddedDirectorsProvider(
                panCardNo:
                    "${ref.watch(sharedUtilityProvider).getUser()?.pancardNo}",
                phone: "${ref.watch(sharedUtilityProvider).getUser()?.phone}")
            .future)
        .then((value) {
      ref.read(isLoading.notifier).state = false;

      if (value['status'] == "1") {
        if (ref.watch(directorPartnerList) != null) {
          if (ref.watch(directorPartnerList)!.isEmpty) {
            ref.read(directorPartnerData.notifier).state =
                value['data']['partner_director_data'][0];
          } else {
            for (var element in ref.watch(directorPartnerList)!) {
              ref.read(directorPartnerData.notifier).state =
                  (value['data']['partner_director_data'] as List).firstWhere(
                      (datum) =>
                          datum['pancard_no'].toString().toLowerCase() !=
                          element.pancardNo.toString().toLowerCase());
            }
          }
          if (ref.watch(directorPartnerData) != null) {
            nameController.text = ref.read(directorPartnerData)!['name'];
            phoneController.text = ref.read(directorPartnerData)!['phone'];
            panController.text = ref.read(directorPartnerData)!['pancard_no'];
            aadharController.text = ref.read(directorPartnerData)!['aadhar_no'];
          }
        }
      }
    });
    // ref.watch(directorPartnerData.notifier).state = value['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((ref.read(sharedUtilityProvider).getUser()?.constitution)
                    .toString() ==
                "3"
            ? "Add Partner"
            : (ref.read(sharedUtilityProvider).getUser()?.constitution)
                        .toString() ==
                    "4"
                ? "Add Director"
                : ""),
      ),
      body: Form(
          key: validationKey,
          child: SingleChildScrollView(
            padding: Pad(all: 10),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please input name"
                      : null,
                  decoration: InputDecoration(
                      hintText: "Name",
                      label: const Text("Name"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: phoneController,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please input phone no."
                      : value.toString().length != 10
                          ? 'input valid phone no'
                          : null,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      label: const Text("Phone"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: panController,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.isValidAadharNumber()) {
                      return 'Please input Valid Pan Card Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Pan Card number",
                      label: const Text("Pan Card number"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: aadharController,
                  validator: (value) => value == null || value.isEmpty
                      ? "Please input aadhar no."
                      : value.toString().isValidAadharNumber()
                          ? 'input valid aadhar no'
                          : null,
                  decoration: InputDecoration(
                      hintText: "Aadhar Card number",
                      label: const Text("Aadhar Card number"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ref.watch(profilePicProvider) == null
                    ? ElevarmInputFileCard(
                        onTap: () {
                          showImageSourceFilePickerDialog(context, (result) {
                            ref.read(profilePicProvider.notifier).state =
                                File(result.path);
                          });
                        },
                        clickToUploadLabel: 'Select Self Picture',
                        orDragAndDropLabel: ', Tap to Upload Image',
                        subtitle: 'PNG, JPG, JPEG (max. 800x400px)',
                        textColor: ColorsConstant.primaryColor,
                      )
                    : ElevarmFileUploadCard(
                        title: ref.watch(profilePicProvider)?.name ?? "Image",
                        subtitle:
                            ref.watch(profilePicProvider)?.name ?? "Image",
                        actionIconAssetName: Icons.remove_red_eye,
                        iconColor: ColorsConstant.primaryColor,
                        iconBackgroundColor:
                            ColorsConstant.primaryColor.withOpacity(0.1),
                        onTap: () {
                          showImageSourceFilePickerDialog(context, (result) {
                            ref.read(profilePicProvider.notifier).state =
                                File(result.path);
                          });
                        },
                        onTapAction: () {
                          showImagePopup(context, ref.watch(profilePicProvider));
                        },
                      ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (validationKey.currentState!.validate()) {
                        if (ref.watch(profilePicProvider) != null) {
                          showloader(context);
                          ref
                              .read(sendDirectorOtpProvider(
                                      aadharNo: aadharController.text,
                                      personName: nameController.text,
                                      panNo: panController.text,
                                      phoneNumber:
                                          phoneController.text.toString(),
                                      otp: '',
                                      profilePhoto:
                                          ref.watch(profilePicProvider) ??
                                              File(""))
                                  .future)
                              .then((value) {
                            hideLoader(context);

                            if (value['status'].toString() == "1") {
                              ref.read(isOtpSent.notifier).state = true;
                              successToast(
                                  context, value['message'].toString());
                            } else {
                              errorToast(context, value['message'].toString());
                            }
                          }).onError((e, s) {
                            hideLoader(context);
                          });
                        } else {
                          errorToast(context, "Please select profile picture");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsConstant.secondColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Send Otp",
                      style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            const Shadow(color: Colors.white, blurRadius: 0.3)
                          ],
                          fontWeight: FontWeight.w700,
                          fontSize: Adaptive.sp(16)),
                    ),
                  ),
                ),
                if (ref.watch(isOtpSent))
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Pinput(
                        autofocus: true,
                        length: 6,
                        defaultPinTheme: PinTheme(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorsConstant.primaryColor
                                    .withOpacity(0.1),
                                border: Border.all(
                                    color: ColorsConstant.primaryColor
                                        .withOpacity(0.1)))),
                        focusedPinTheme: PinTheme(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorsConstant.primaryColor
                                    .withOpacity(0.1),
                                border: Border.all(
                                    color: ColorsConstant.secondColorDark))),
                        onCompleted: (pin) {
                          if (pin.length == 6) {
                            Debouncer(delay: const Duration(milliseconds: 500))
                                .call(() {
                              showloader(context);
                              ref
                                  .read(submitDirectorDetailsProvider(
                                          aadharNo: aadharController.text,
                                          personName: nameController.text,
                                          panNo: panController.text,
                                          phoneNumber:
                                              phoneController.text.toString(),
                                          otp: pin,
                                          profilePhoto:
                                              ref.read(profilePicProvider) ??
                                                  File(""))
                                      .future)
                                  .then((value) {
                                hideLoader(context);
                                if (value['status'].toString() == "1") {
                                  ref.invalidate(directorsPartnersListProvider);
                                  if ((ref
                                              .watch(sharedUtilityProvider)
                                              .getUser()
                                              ?.constitution)
                                          .toString() ==
                                      "3") {
                                    successToast(
                                        context, "Partner added successfully");
                                  } else if (ref
                                          .watch(sharedUtilityProvider)
                                          .getUser()
                                          ?.constitution
                                          .toString() ==
                                      "4") {
                                    successToast(
                                        context, "Director added successfully");
                                  }
                                  context.go(RoutesStrings.dashboard);
                                } else {
                                  errorToast(
                                      context, value['message'].toString());
                                }
                              }).onError((e, s) {
                                hideLoader(context);
                              });
                            });
                          }
                        },
                      ),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
