import 'dart:io';
import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/ui/auth/Login/login_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Adddirectorpartnerautoregisterscreen extends ConsumerStatefulWidget {
  Adddirectorpartnerautoregisterscreen(
      {super.key, required this.isLastIndex, required this.data});
  bool isLastIndex = false;

  List<Map<String, dynamic>> data;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdddirectorpartnerscreenState();
}

class _AdddirectorpartnerscreenState
    extends ConsumerState<Adddirectorpartnerautoregisterscreen> {
  final validationKey = GlobalKey<FormState>();

  final profilePicProvider = StateProvider<File?>((ref) => null);
  final directorPartnerCountProvider = StateProvider((ref) => 0);

  final isOtpSent = StateProvider((ref) => false);
  PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(loginInfoProvider.future).then(
          (value) => ref.watch(sharedUtilityProvider).setUser(value.data));
      ref.watch(directorPartnerCountProvider.notifier).state =
          widget.data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((ref
                        .watch(sharedUtilityProvider)
                        .getMongoDbUser()
                        ?.constitution)
                    .toString() ==
                "3"
            ? "Add Partner"
            : (ref.watch(sharedUtilityProvider).getMongoDbUser()?.constitution)
                        .toString() ==
                    "4"
                ? "Add Director"
                : ""),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: Pad(all: 10),
        child: PageView.builder(
            itemCount: widget.data.length,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            padEnds: true,
            itemBuilder: (context, index) => addDirectorLayout(
                context,
                widget.data[index]['name'] ?? "",
                widget.data[index]['pancard_no'] ?? "",
                widget.data[index]['phone'] ?? "",
                widget.data[index]['aadhar_no'] ?? "",
                widget.data[index]['profile_photo'] ?? "",
                index,
                ref,
                index == widget.data.length - 1)),
      ),
    );
  }

  Widget addDirectorLayout(
      BuildContext context,
      String name,
      String pancard,
      String phone,
      String aadhar,
      String image,
      int index,
      WidgetRef ref,
      bool isLastPage) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final panController = TextEditingController();
    final aadharController = TextEditingController();
    nameController.text = name ?? "";
    phoneController.text = phone ?? "";
    panController.text = pancard ?? "";
    aadharController.text = aadhar ?? "";
    String positionType = ref
                .watch(sharedUtilityProvider)
                .getMongoDbUser()
                ?.constitution
                .toString() ==
            "3"
        ? "Partner"
        : (ref.watch(sharedUtilityProvider).getMongoDbUser()?.constitution)
                    .toString() ==
                "4"
            ? "Director"
            : "";
    return Form(
        key: validationKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                readOnly: name.isNotEmpty,
                controller: nameController,
                validator: (value) =>
                    value == null || value.isEmpty ? "Please input name" : null,
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
                readOnly: phone.isNotEmpty,
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
                readOnly: pancard.isNotEmpty,
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
                    hintText: "Pancard number",
                    label: const Text("Pancard number"),
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
                readOnly: aadhar.isNotEmpty,
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
              CupertinoButton(
                  child: Text(
                    "${positionType} Image",
                    style: TextStyle(
                        color: ColorsConstant.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(17)),
                  ),
                  onPressed: () {}),
              InkWell(
                onTap: () async {
                  var result =
                      await ImagePicker().pickImage(source: ImageSource.camera);

                  if (result != null) {
                    File file = File(result.path);
                    ref.watch(profilePicProvider.notifier).state = file;
                  } else {}
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [6, 6, 6, 6],
                    color: ColorsConstant.primaryColor,
                    child: Padding(
                      padding: const Pad(all: 20),
                      child: image != null
                          ? Image.network(
                              "https://apnagodam.com/resources/frontend_assets/uploads/" +
                                  image)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  const Icon(LucideIcons.file),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text('Select Self Picture',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(14))),
                                  )
                                ]),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (validationKey.currentState!.validate()) {
                      if (image != null ||
                          ref.watch(profilePicProvider) != null) {
                        showloader(context);
                        ref
                            .watch(sendDirectorOtpProvider(
                                    phoneNumber: phoneController.text)
                                .future)
                            .then((value) {
                          hideLoader(context);

                          if (value['status'].toString() == "1") {
                            ref.watch(isOtpSent.notifier).state = true;
                            setState(() {});
                            successToast(context, value['message'].toString());
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
              if (ref.watch(isOtpSent) == true)
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
                              color:
                                  ColorsConstant.primaryColor.withOpacity(0.1),
                              border: Border.all(
                                  color: ColorsConstant.primaryColor
                                      .withOpacity(0.1)))),
                      focusedPinTheme: PinTheme(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:
                                  ColorsConstant.primaryColor.withOpacity(0.1),
                              border: Border.all(
                                  color: ColorsConstant.secondColorDark))),
                      onCompleted: (pin) {
                        if (pin.length == 6) {
                          Debouncer(delay: const Duration(milliseconds: 500))
                              .call(() {
                            showloader(context);
                            ref
                                .watch(submitDirectorDetailsProvider(
                                        aadharNo: aadharController.text,
                                        personName: nameController.text,
                                        panNo: panController.text,
                                        phoneNumber:
                                            phoneController.text.toString(),
                                        otp: pin,
                                        profilePhoto: image != null &&
                                                ref.watch(profilePicProvider) ==
                                                    null
                                            ? "https://apnagodam.com/resources/frontend_assets/uploads/" +
                                                image
                                            : ref.watch(profilePicProvider) ??
                                                File(""))
                                    .future)
                                .then((value) {
                              hideLoader(context);
                              if (value['status'].toString() == "1") {
                                widget.data.removeAt(index);
                                setState(() {});

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
                                if (isLastPage == true) {
                                  ref
                                      .watch(loginInfoProvider.future)
                                      .then((data) {
                                    ref
                                        .watch(sharedUtilityProvider)
                                        .setUser(data.data);
                                    successToast(context, value['message']);
                                    context.go(
                                      RoutesStrings.dashboard,
                                    );
                                  });
                                }
                                ref.invalidate(isOtpSent);
                                ref.invalidate(profilePicProvider);
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
        ));
  }
}
