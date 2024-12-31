import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((ref.watch(sharedUtilityProvider).getUser()?.constitution)
                    .toString() ==
                "3"
            ? "Add Partner"
            : (ref.watch(sharedUtilityProvider).getUser()?.constitution)
                        .toString() ==
                    "4"
                ? "Add Director"
                : ""),
      ),
      body: Form(
          key: validationKey,
          child: ListView(
            padding: Pad(all: 10),
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
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
              Expanded(
                  child: InkWell(
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
                      child: Center(
                        child: ref.watch(profilePicProvider) != null
                            ? ColumnSuper(
                                alignment: Alignment.center,
                                children: [
                                    const Icon(
                                      LucideIcons.file,
                                      color: ColorsConstant.primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        "${basename(ref.watch(profilePicProvider)?.path ?? "")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(14)),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    )
                                  ])
                            : ColumnSuper(children: [
                                const Icon(LucideIcons.file),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Select Self Picture',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14)))
                              ]),
                      ),
                    )),
              )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (validationKey.currentState!.validate()) {
                      if (ref.watch(profilePicProvider) != null) {
                        ref
                            .watch(sendDirectorOtpProvider(
                                    phoneNumber: phoneController.text)
                                .future)
                            .then((value) {
                          if (value['status'].toString() == "1") {
                            ref.watch(isOtpSent.notifier).state = true;
                            successToast(context, value['message'].toString());
                          } else {
                            errorToast(context, value['message'].toString());
                          }
                        });
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
                            ref
                                .watch(submitDirectorDetailsProvider(
                                        aadharNo: aadharController.text,
                                        personName: nameController.text,
                                        panNo: panController.text,
                                        phoneNumber:
                                            phoneController.text.toString(),
                                        otp: pin,
                                        profilePhoto:
                                            ref.watch(profilePicProvider) ??
                                                File(""))
                                    .future)
                                .then((value) {
                              if (value['status'].toString() == "1") {
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
                            });
                          });
                        }
                      },
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
