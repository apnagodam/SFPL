import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart' as dottedBorder;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../Data/Model/DistrictsResponseModel.dart';
import '../../Data/Model/StatesResponseModel.dart';
import '../../Domain/AuthenticationService/AuthenticationService.dart';
import '../../Domain/StateService/StateService.dart';
import '../utils/colors.dart';
import 'RegistrationScreen.dart';

class Individualregistration extends ConsumerStatefulWidget {
  const Individualregistration({super.key});

  @override
  ConsumerState<Individualregistration> createState() =>
      _IndividualregistrationState();
}

class _IndividualregistrationState
    extends ConsumerState<Individualregistration> {
  var propProvider = StateProvider((ref) => 0);
  var propNameProvider = StateProvider((ref) => "Select Constitution");
  var propDocProvider =
      StateProvider((ref) => "Select Proprietorship Document Type");
  var panImageProvider = StateProvider<File?>((ref) => null);
  var propDocImageProvider = StateProvider<File?>((ref) => null);

  var chequeImageProvider = StateProvider<File?>((ref) => null);

  var adharImageProvider = StateProvider<File?>((ref) => null);
  var adhaBackImageProvider = StateProvider<File?>((ref) => null);

  var isRegisteringProvider = StateProvider((ref) => false);

  final imagePicker = ImagePicker();

  TextEditingController panController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController firmController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final identificationKey = GlobalKey<FormState>();
  final bankDetailsKey = GlobalKey<FormState>();
  final personalDetailsKey = GlobalKey<FormState>();
  var activeStepProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context) {
    var widgetList = [
      identificationLayout(context, ref),
      bankLayout(context, ref),
      personalDetailsLayout(context, ref),
    ];
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(
              height: Adaptive.h(5),
            ),
            Center(
              child: Image.asset(
                'assets/swfl.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Individual Registration",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(20)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            EasyStepper(
              activeStep: ref.watch(activeStepProvider),
              stepShape: StepShape.rRectangle,
              stepBorderRadius: 15,
              borderThickness: 2,
              padding: Pad(all: 10),
              stepRadius: 35,
              finishedStepIconColor: ColorsConstant.primaryColor,
              finishedStepBorderColor: ColorsConstant.primaryColor,
              finishedStepTextColor: ColorsConstant.primaryColor,
              finishedStepBackgroundColor: Colors.white,
              unreachedStepBackgroundColor: Colors.grey.withOpacity(0.1),
              activeStepIconColor: ColorsConstant.primaryColor,
              showLoadingAnimation: false,
              showStepBorder: true,
              steps: [
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: ref.watch(activeStepProvider) >= 0 ? 1 : 0.3,
                      child: Icon(LucideIcons.credit_card),
                    ),
                  ),
                  customTitle: const Text(
                    'Identification',
                    textAlign: TextAlign.center,
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: ref.watch(activeStepProvider) >= 1 ? 1 : 0.3,
                      child: Icon(LucideIcons.banknote),
                    ),
                  ),
                  customTitle: const Text(
                    'Bank Details',
                    textAlign: TextAlign.center,
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: ref.watch(activeStepProvider) >= 2 ? 1 : 0.3,
                      child: Icon(LucideIcons.user),
                    ),
                  ),
                  customTitle: const Text(
                    'Personal Details',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              onStepReached: (index) => setState(
                  () => ref.watch(activeStepProvider.notifier).state = index),
            ),
            widgetList[ref.watch(activeStepProvider)],
            ref.watch(isRegisteringProvider) == true
                ? const CupertinoActivityIndicator()
                : ref.watch(activeStepProvider) < 2
                    ? ElevatedButton(
                        onPressed: () async {
                          if (ref.watch(activeStepProvider) == 0) {
                            if (identificationKey.currentState!.validate()) {
                            } else {
                              if (ref.watch(panImageProvider) == null) {
                                errorToast(
                                    context, 'Please select PAN card Image');
                              }
                              if (ref.watch(adharImageProvider) == null) {
                                errorToast(
                                    context, 'Please select aadhar card Image');
                              }
                              if (ref.watch(adhaBackImageProvider) == null) {
                                errorToast(
                                    context, 'Please select adhar back Image');
                              } else {
                                ref.watch(activeStepProvider.notifier).state +=
                                    1;
                              }
                            }
                          } else if (ref.watch(activeStepProvider) == 1) {
                            if (bankDetailsKey.currentState!.validate()) {
                              if (ref.watch(chequeImageProvider) == null) {
                                errorToast(
                                    context, 'Please select cheque Image');
                              } else {
                                ref.watch(activeStepProvider.notifier).state +=
                                    1;
                              }
                            } else {}
                          } else if (ref.watch(activeStepProvider) == 2) {
                            if (personalDetailsKey.currentState!.validate()) {
                              ref.watch(activeStepProvider.notifier).state += 1;
                            } else {}
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: ColorsConstant.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              shadows: const [
                                Shadow(color: Colors.white, blurRadius: 0.3)
                              ],
                              fontWeight: FontWeight.w700,
                              fontSize: Adaptive.sp(16)),
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              ref.watch(isRegisteringProvider.notifier).state =
                                  true;
                              ref
                                  .watch(registerUserProvider(
                                          panCard: panController.text,
                                          phone:
                                              phoneController.text.toString(),
                                          userName:
                                              nameController.text.toString(),
                                          constitution: "1",
                                          email:
                                              emailController.text.toString(),
                                          adharNo:
                                              adharController.text.toString(),
                                          address:
                                              addressController.text.toString(),
                                          locationState: ref
                                              .watch(statesProvider)
                                              ?.code
                                              .toString(),
                                          district: ref
                                              .watch(districtProvider)
                                              ?.districtCode
                                              .toString(),
                                          pincode:
                                              pinController.text.toString(),
                                          bankName: bankNameController.text
                                              .toString(),
                                          bankBranch:
                                              branchController.text.toString(),
                                          bankAccount:
                                              accountController.text.toString(),
                                          ifscCode:
                                              ifscController.text.toString(),
                                          propDocType: ref
                                              .watch(propDocProvider)
                                              .toString(),
                                          propDocNumber:
                                              gstController.text.toString(),
                                          firmName:
                                              firmController.text.toString(),
                                          panCardImage:
                                              ref.watch(panImageProvider),
                                          profileImage:
                                              ref.watch(panImageProvider),
                                          adharBackImage:
                                              ref.watch(adhaBackImageProvider),
                                          aadharImage:
                                              ref.watch(adharImageProvider),
                                          chequeImage:
                                              ref.watch(chequeImageProvider),
                                          proprietorProof:
                                              ref.watch(propDocImageProvider))
                                      .future)
                                  .then((value) {
                                ref
                                    .watch(isRegisteringProvider.notifier)
                                    .state = false;

                                if (value['status'].toString() == "1") {
                                  context.goNamed(RoutesStrings.registrationOtp,
                                      extra: {
                                        "panCard": panController.text.toString()
                                      });
                                } else {
                                  errorToast(
                                      context, value['message'].toString());
                                }
                              }).onError((e, s) {
                                ref
                                    .watch(isRegisteringProvider.notifier)
                                    .state = false;
                                //toastification.show(title: Text(e.toString()));
                              });
                            } else {
                              if (ref.watch(panImageProvider) == null) {
                                errorToast(context, 'Please select Pan Image');
                              } else if (ref.watch(adharImageProvider) ==
                                  null) {
                                errorToast(
                                    context, 'Please select aadhar Image');
                              } else if (ref.watch(adhaBackImageProvider) ==
                                  null) {
                                errorToast(
                                    context, 'Please select aadhar back Image');
                              } else if (ref.watch(chequeImageProvider) ==
                                  null) {
                                errorToast(
                                    context, 'Please select cheque Image');
                              } else if (ref.watch(statesProvider) == null) {
                                errorToast(context, 'Please select state');
                              } else if (ref.watch(districtProvider) == null) {
                                errorToast(context, 'Please select District');
                              } else {
                                errorToast(
                                    context, 'Please Fill all the details');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              backgroundColor: ColorsConstant.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                shadows: const [
                                  Shadow(color: Colors.white, blurRadius: 0.3)
                                ],
                                fontWeight: FontWeight.w700,
                                fontSize: Adaptive.sp(16)),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    ));
  }

  personalDetailsLayout(BuildContext context, WidgetRef ref) => Form(
      key: personalDetailsKey,
      child: ColumnSuper(
        children: [
          CupertinoButton(
              child: Text(
                "Personal Details",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(17)),
              ),
              onPressed: () {}),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input valid name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Full Name",
                label: const Text("Enter Full Name"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input valid email';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Email",
                label: const Text("Enter Email"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 10,
            controller: phoneController,
            validator: (value) {
              if (value == null || value.isEmpty && value.length != 10) {
                return 'Please input valid phone';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Phone Number",
                label: const Text("Enter Phone Number"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          addressLayout(context, ref),
        ],
      ));

  identificationLayout(BuildContext context, WidgetRef ref) => Form(
      key: identificationKey,
      child: ColumnSuper(children: [
        CupertinoButton(
            child: Text(
              "Identification Details",
              style: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(17)),
            ),
            onPressed: () {}),
        TextFormField(
          controller: panController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty || !value.isValidPanCardNo()) {
              return 'Please input Valid Pan Number';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter PAN Number",
              label: const Text("Enter PAN Number"),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              imagePicker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  ref.watch(panImageProvider.notifier).state = File(value.path);
                }
              });
            },
            child: dottedBorder.DottedBorder(
                borderType: dottedBorder.BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorsConstant.primaryColor,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(panImageProvider) != null
                        ? Stack(
                            children: [
                              Image.file(
                                  ref.watch(panImageProvider) ?? File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(panImageProvider);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorsConstant.primaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Select Pan Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: adharController,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !value.isValidAadharNumber()) {
              return 'Please input Valid Aadhar Number';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter Aadhar Number",
              label: const Text("Enter Aadhar Number"),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              imagePicker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  ref.watch(adharImageProvider.notifier).state =
                      File(value.path);
                }
              });
            },
            child: dottedBorder.DottedBorder(
                borderType: dottedBorder.BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorsConstant.primaryColor,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(adharImageProvider) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(adharImageProvider) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(adharImageProvider);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorsConstant.primaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Select Aadhar Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              imagePicker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  ref.watch(adhaBackImageProvider.notifier).state =
                      File(value.path);
                }
              });
            },
            child: dottedBorder.DottedBorder(
                borderType: dottedBorder.BorderType.RRect,
                dashPattern: const [5, 5, 5, 5],
                color: ColorsConstant.primaryColor,
                child: Padding(
                  padding: const Pad(all: 20),
                  child: Center(
                    child: ref.watch(adhaBackImageProvider) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(adhaBackImageProvider) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(adhaBackImageProvider);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        : ColumnSuper(children: [
                            Icon(
                              LucideIcons.cloud_upload,
                              color: ColorsConstant.primaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Select Aadhar Back Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(13)),
                            )
                          ]),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]));

  addressLayout(BuildContext context, WidgetRef ref) => ColumnSuper(children: [
        ref.watch(stateListProvider).when(
            data: (states) => DropdownSearch<Datum?>(
                  popupProps: PopupProps.menu(
                      searchFieldProps: const TextFieldProps(
                          autofocus: true,
                          cursorColor: ColorsConstant.primaryColor,
                          padding: Pad(left: 10, right: 10),
                          decoration: InputDecoration(
                            contentPadding: Pad(left: 10, right: 10),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorsConstant.primaryColor)),
                          )),
                      menuProps: MenuProps(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: ColorsConstant.primaryColor),
                              borderRadius: BorderRadius.circular(8))),
                      itemBuilder: (context, terminal, isVisible) =>
                          ColumnSuper(
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(
                                  padding: const Pad(all: 10),
                                  child: Text(
                                    "${terminal?.name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ]),
                      isFilterOnline: true,
                      title: Padding(
                        padding: const Pad(all: 10),
                        child: Text(
                          'Select State',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      showSearchBox: true,
                      searchDelay: const Duration(microseconds: 500)),
                  filterFn: (user, filter) =>
                      user?.stateFilterByName(filter) ?? false,
                  // asyncItems: (String filter) => getData(filter),

                  items: states.data ?? [],
                  itemAsString: (Datum? u) => u?.name ?? "",
                  onChanged: (Datum? data) =>
                      ref.watch(statesProvider.notifier).state = data,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        contentPadding: Pad(left: 10, bottom: 5, top: 5),
                        hintText: "Select State",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: ColorsConstant.secondColorUltraDark))),
                  ),
                ),
            error: (e, s) => Container(),
            loading: () => const CupertinoActivityIndicator()),
        const SizedBox(
          height: 10,
        ),
        ref.watch(statesProvider) == null
            ? const SizedBox()
            : ref
                .watch(
                    districtListProvider(code: ref.watch(statesProvider)?.code))
                .when(
                    data: (states) => DropdownSearch<StateDatum?>(
                          popupProps: PopupProps.menu(
                              searchFieldProps: const TextFieldProps(
                                  autofocus: true,
                                  cursorColor: ColorsConstant.primaryColor,
                                  padding: Pad(left: 10, right: 10),
                                  decoration: InputDecoration(
                                    contentPadding: Pad(left: 10, right: 10),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                  )),
                              menuProps: MenuProps(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorsConstant.primaryColor),
                                      borderRadius: BorderRadius.circular(8))),
                              itemBuilder: (context, terminal, isVisible) =>
                                  ColumnSuper(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Padding(
                                          padding: const Pad(all: 10),
                                          child: Text(
                                            "${terminal?.name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(16)),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                      ]),
                              isFilterOnline: true,
                              title: Padding(
                                padding: const Pad(all: 10),
                                child: Text(
                                  'Select District',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              showSearchBox: true,
                              searchDelay: const Duration(microseconds: 500)),
                          filterFn: (user, filter) =>
                              user?.districtFilterByName(filter) ?? false,
                          // asyncItems: (String filter) => getData(filter),

                          items: states.data ?? [],
                          itemAsString: (StateDatum? u) => u?.name ?? "",
                          onChanged: (StateDatum? data) =>
                              ref.watch(districtProvider.notifier).state = data,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding:
                                    Pad(left: 10, bottom: 5, top: 5),
                                hintText: "Select District",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: ColorsConstant
                                            .secondColorUltraDark))),
                          ),
                        ),
                    error: (e, s) => Container(),
                    loading: () => const CupertinoActivityIndicator()),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: pinController,
          validator: (value) {
            if (value == null || value.isEmpty || value.length != 10) {
              return 'Please input Pincode';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter Pincode",
              label: const Text("Enter Pincode"),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: addressController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please input Valid address';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter Address",
              label: const Text("Enter Address"),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
      ]);

  bankLayout(BuildContext context, WidgetRef ref) => Form(
      key: bankDetailsKey,
      child: ColumnSuper(
        children: [
          CupertinoButton(
              child: Text(
                "Bank Details",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(17)),
              ),
              onPressed: () {}),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: bankNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input valid bank name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Bank Name",
                label: const Text("Enter Bank Name"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: branchController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input valid branch name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Bank Branch",
                label: const Text("Enter Bank Branch"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: accountController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.isValidBankAccount()) {
                return 'Please input valid account Number';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Bank Account Number",
                label: const Text("Enter Bank Account Number"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: ifscController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input valid ifsc code';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Bank IFSC Code",
                label: const Text("Enter Bank IFSC Code"),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () async {
                imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  if (value != null) {
                    ref.watch(chequeImageProvider.notifier).state =
                        File(value.path);
                  }
                });
              },
              child: dottedBorder.DottedBorder(
                  borderType: dottedBorder.BorderType.RRect,
                  dashPattern: const [5, 5, 5, 5],
                  color: ColorsConstant.primaryColor,
                  child: Padding(
                    padding: const Pad(all: 20),
                    child: Center(
                      child: ref.watch(chequeImageProvider) != null
                          ? Stack(
                              children: [
                                Image.file(ref.watch(chequeImageProvider) ??
                                    File('path')),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {
                                        ref.invalidate(chequeImageProvider);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            )
                          : ColumnSuper(children: [
                              Icon(
                                LucideIcons.cloud_upload,
                                color: ColorsConstant.primaryColor,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Select Cheque Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(16)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Adaptive.sp(13)),
                              )
                            ]),
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ));

  firmLayout(BuildContext context, WidgetRef ref) => ColumnSuper(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                        title: Text(
                          "Select Constitution",
                          style: TextStyle(
                              color: ColorsConstant.secondColorUltraDark,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(16)),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              ref.watch(propNameProvider.notifier).state =
                                  "Individual Firm";
                              ref.watch(propProvider.notifier).state = 1;
                              Navigator.pop(context);
                            },
                            isDefaultAction: true,
                            child: Text("Individual Firm",
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(16))),
                          ),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                ref.watch(propNameProvider.notifier).state =
                                    "Proprietorship Firm";
                                ref.watch(propProvider.notifier).state = 2;
                                Navigator.pop(context);
                              },
                              isDefaultAction: true,
                              child: Text("Proprietorship Firm",
                                  style: TextStyle(
                                      color: ColorsConstant.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Adaptive.sp(16))))
                        ],
                      ));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConstant.secondColorDark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              ref.watch(propNameProvider),
              style: TextStyle(
                  color: Colors.white,
                  shadows: [const Shadow(color: Colors.white, blurRadius: 0.3)],
                  fontWeight: FontWeight.w700,
                  fontSize: Adaptive.sp(16)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ref.watch(propNameProvider) == "Individual Firm"
            ? SizedBox()
            : ColumnSuper(children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: firmController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: "Enter Firm Name",
                      label: Text("Enter Firm Name"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                                title: Text(
                                  "Select Proprietorship Document Type",
                                  style: TextStyle(
                                      color:
                                          ColorsConstant.secondColorUltraDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Adaptive.sp(16)),
                                ),
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      ref
                                          .watch(propDocProvider.notifier)
                                          .state = "GST";
                                      Navigator.pop(context);
                                    },
                                    isDefaultAction: true,
                                    child: Text("GST",
                                        style: TextStyle(
                                            color: ColorsConstant.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(16))),
                                  ),
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      ref
                                          .watch(propDocProvider.notifier)
                                          .state = "License";
                                      Navigator.pop(context);
                                    },
                                    isDefaultAction: true,
                                    child: Text("License",
                                        style: TextStyle(
                                            color: ColorsConstant.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(16))),
                                  ),
                                  CupertinoActionSheetAction(
                                      onPressed: () {
                                        ref
                                            .watch(propDocProvider.notifier)
                                            .state = "MSME";
                                        Navigator.pop(context);
                                      },
                                      isDefaultAction: true,
                                      child: Text("MSME",
                                          style: TextStyle(
                                              color:
                                                  ColorsConstant.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(16))))
                                ],
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsConstant.secondColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      ref.watch(propDocProvider),
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: gstController,
                  decoration: InputDecoration(
                      hintText: "Enter ${ref.watch(propDocProvider)} Number",
                      label: Text("Enter ${ref.watch(propDocProvider)} Number"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      imagePicker
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        if (value != null) {
                          ref.watch(propDocImageProvider.notifier).state =
                              File(value.path);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsConstant.secondColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Select Document Image",
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
                ref.watch(propDocImageProvider) != null
                    ? Stack(
                        children: [
                          Image.file(
                              ref.watch(propDocImageProvider) ?? File('path')),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () {
                                  ref.invalidate(propDocImageProvider);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
              ]),
      ]);
}
