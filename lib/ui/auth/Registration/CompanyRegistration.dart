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
import 'package:swfl/ui/utils/enums.dart';
import 'package:swfl/ui/utils/extensions.dart';

import '../../../Data/Model/BankListModel.dart';
import '../../../Data/Model/DistrictsResponseModel.dart';
import '../../../Data/Model/StatesResponseModel.dart';
import '../../../Domain/AuthenticationService/AuthenticationService.dart';
import '../../../Domain/StateService/StateService.dart';
import '../../utils/colors.dart';
import '../../utils/routes_strings.dart';
import '../../utils/widgets.dart';
import '../Login/login_screen.dart';

class Companyregistration extends ConsumerStatefulWidget {
  const Companyregistration({super.key});

  @override
  ConsumerState<Companyregistration> createState() =>
      _CompanyregistrationState();
}

class _CompanyregistrationState extends ConsumerState<Companyregistration> {
  final formKey = GlobalKey<FormState>();

  var propProvider = StateProvider((ref) => 0);
  var propNameProvider = StateProvider((ref) => "Select Constitution");
  var propDocProvider =
      StateProvider((ref) => "Select Proprietorship Document Type");
  var panImageProvider = StateProvider<File?>((ref) => null);

  var moaAoaImageProvider = StateProvider<File?>((ref) => null);

  var boardResolutionImage = StateProvider<File?>((ref) => null);

  var directorProofImage = StateProvider<File?>((ref) => null);

  var propDocImageProvider = StateProvider<File?>((ref) => null);

  var chequeImageProvider = StateProvider<File?>((ref) => null);

  var authorisedImageProvider = StateProvider<File?>((ref) => null);

  var isRegisteringProvider = StateProvider((ref) => false);

  final imagePicker = ImagePicker();

  TextEditingController panController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController authNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController firmController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  var propTypeList = ['GST', 'License', 'MSME'];
  var propTypeProvider = StateProvider((ref) => '');
  var activeStepProvider = StateProvider((ref) => 0);
  final firmKey = GlobalKey<FormState>();
  final identificationKey = GlobalKey<FormState>();
  final bankDetailsKey = GlobalKey<FormState>();
  final personalDetailsKey = GlobalKey<FormState>();
  var bankProvider = StateProvider<BankDatum?>((ref) => null);
  var statesProvider = StateProvider<Datum?>((ref) => null);

  var districtProvider = StateProvider<StateDatum?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    var widgetList = [
      firmLayout(context, ref),
      //identificationLayout(context, ref),
      bankLayout(context, ref),
      // personalDetailsLayout(context, ref),
    ];
    return Scaffold(
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
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
                        "Company Registration",
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
                      unreachedStepBackgroundColor:
                          Colors.grey.withOpacity(0.1),
                      activeStepIconColor: ColorsConstant.primaryColor,
                      showLoadingAnimation: false,
                      showStepBorder: true,
                      steps: [
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity:
                                  ref.watch(activeStepProvider) >= 0 ? 1 : 0.3,
                              child: Icon(LucideIcons.building_2),
                            ),
                          ),
                          customTitle: const Text(
                            'Company Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // EasyStep(
                        //   customStep: ClipRRect(
                        //     borderRadius: BorderRadius.circular(15),
                        //     child: Opacity(
                        //       opacity:
                        //           ref.watch(activeStepProvider) >= 0 ? 1 : 0.3,
                        //       child: Icon(LucideIcons.credit_card),
                        //     ),
                        //   ),
                        //   customTitle: const Text(
                        //     'Authorized Signatory',
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity:
                                  ref.watch(activeStepProvider) >= 1 ? 1 : 0.3,
                              child: Icon(LucideIcons.banknote),
                            ),
                          ),
                          customTitle: const Text(
                            'Bank Details',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // EasyStep(
                        //   customStep: ClipRRect(
                        //     borderRadius: BorderRadius.circular(15),
                        //     child: Opacity(
                        //       opacity:
                        //           ref.watch(activeStepProvider) >= 2 ? 1 : 0.3,
                        //       child: Icon(LucideIcons.user),
                        //     ),
                        //   ),
                        //   customTitle: const Text(
                        //     'Personal Details',
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                      ],
                      onStepReached: (index) => setState(() =>
                          ref.watch(activeStepProvider.notifier).state = index),
                    ),
                    widgetList[ref.watch(activeStepProvider)],

                    // firmLayout(context, ref),
                    // identificationLayout(context, ref),
                    // bankLayout(context, ref),
                    // personalDetailsLayout(context, ref),
                    //
                    SizedBox(
                      height: 10,
                    ),
                    ref.watch(isRegisteringProvider) == true
                        ? defaultLoader()
                        : ref.watch(activeStepProvider) < 1
                            ? ElevatedButton(
                                onPressed: () async {
                                  if (ref.watch(activeStepProvider) == 0) {
                                    if (firmKey.currentState!.validate()) {
                                      ref
                                          .watch(activeStepProvider.notifier)
                                          .state += 1;
                                    } else {
                                      if (ref.watch(panImageProvider) == null) {
                                        errorToast(context,
                                            'Please select PAN card Image');
                                      } else if (ref
                                              .watch(moaAoaImageProvider) ==
                                          null) {
                                        errorToast(context,
                                            'Please select MOA/AOA  Image');
                                      } else if (ref
                                              .watch(boardResolutionImage) ==
                                          null) {
                                        errorToast(context,
                                            'Please select Board Resolution  Image');
                                      } else if (ref
                                              .watch(directorProofImage) ==
                                          null) {
                                        errorToast(context,
                                            'Please select Director Proof  Image');
                                      }
                                      // if (ref.watch(propDocImageProvider) ==
                                      //     null) {
                                      //   errorToast(context,
                                      //       'Please select document Image');
                                      // }
                                    }
                                  }

                                  // else if (ref.watch(activeStepProvider) ==
                                  //     1) {
                                  //   if (identificationKey.currentState!
                                  //       .validate()) {
                                  //     ref
                                  //         .watch(activeStepProvider.notifier)
                                  //         .state += 1;
                                  //   } else {
                                  //     if (ref.watch(panImageProvider) == null) {
                                  //       errorToast(context,
                                  //           'Please select PAN card Image');
                                  //     }
                                  //     if (ref.watch(authorisedImageProvider) ==
                                  //         null) {
                                  //       errorToast(context,
                                  //           'Please select authorized  Image');
                                  //     }
                                  //      else {}
                                  //   }
                                  // }
                                  else if (ref.watch(activeStepProvider) == 2) {
                                    if (bankDetailsKey.currentState!
                                        .validate()) {
                                      if (ref.watch(chequeImageProvider) ==
                                          null) {
                                        errorToast(context,
                                            'Please select cheque Image');
                                      } else {
                                        ref
                                            .watch(activeStepProvider.notifier)
                                            .state += 1;
                                      }
                                    } else {}
                                  }
                                  //
                                  // else if (ref.watch(activeStepProvider) ==
                                  //     2) {
                                  //   if (personalDetailsKey.currentState!
                                  //       .validate()) {
                                  //     ref
                                  //         .watch(activeStepProvider.notifier)
                                  //         .state += 1;
                                  //   } else {}
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(15),
                                    backgroundColor:
                                        ColorsConstant.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white,
                                            blurRadius: 0.3)
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
                                      ref
                                          .watch(isRegisteringProvider.notifier)
                                          .state = true;
                                      ref
                                          .watch(registerUserProvider(
                                                  panCard: panController.text,
                                                  phone: phoneController.text
                                                      .toString(),
                                                  // userName: nameController.text
                                                  //     .toString(),
                                                  constitution: "${ConstitutionType.company.type}",
                                                  email: emailController.text
                                                      .toString(),
                                                  adharNo: adharController.text
                                                      .toString(),
                                                  address: addressController.text
                                                      .toString(),
                                                  locationState: ref
                                                      .watch(statesProvider)
                                                      ?.name
                                                      .toString(),
                                                  district: ref
                                                      .watch(districtProvider)
                                                      ?.name
                                                      .toString(),
                                                  pincode: pinController.text
                                                      .toString(),
                                                  bankName: ref
                                                      .watch(bankProvider)
                                                      ?.bankName,
                                                  bankBranch: branchController.text
                                                      .toString(),
                                                  bankAccount: accountController
                                                      .text
                                                      .toString(),
                                                  ifscCode: ifscController.text
                                                      .toString(),
                                                  propDocType: ref
                                                      .watch(propTypeProvider)
                                                      .toString(),
                                                  propDocNumber: gstController.text
                                                      .toString(),
                                                  firmName: firmController.text
                                                      .toString(),
                                                  panCardImage: ref
                                                      .watch(panImageProvider),
                                                  profileImage: ref
                                                      .watch(panImageProvider),
                                                  aadharImage: ref.watch(
                                                      authorisedImageProvider),
                                                  chequeImage: ref.watch(
                                                      chequeImageProvider),
                                                  proprietorProof: ref.watch(
                                                    propDocImageProvider,
                                                  ),
                                                  moaAoa: ref.watch(
                                                      moaAoaImageProvider),
                                                  boardResolution: ref.watch(
                                                      boardResolutionImage),
                                                  directorProof:
                                                      ref.watch(directorProofImage),
                                                  partnerDirectorCount: directorController.text.toString())
                                              .future)
                                          .then((value) {
                                        ref
                                            .watch(
                                                isRegisteringProvider.notifier)
                                            .state = false;
                                        if (value['status'].toString() == "1") {
                                          context.goNamed(
                                              RoutesStrings.registrationOtp,
                                              extra: {
                                                "panCard": phoneController.text
                                                    .toString()
                                              });
                                        } else {
                                          errorToast(context,
                                              value['message'].toString());
                                        }
                                      }).onError((e, s) {
                                        ref
                                            .watch(
                                                isRegisteringProvider.notifier)
                                            .state = false;
                                        //toastification.show(title: Text(e.toString()));
                                      });
                                    } else {
                                      if (ref.watch(panImageProvider) == null) {
                                        errorToast(
                                            context, 'Please select Pan Image');
                                      } else if (ref
                                              .watch(authorisedImageProvider) ==
                                          null) {
                                        errorToast(context,
                                            'Please select authorised Image');
                                      } else if (ref
                                              .watch(chequeImageProvider) ==
                                          null) {
                                        errorToast(context,
                                            'Please select cheque Image');
                                      }
                                      // else if (ref.watch(propDocProvider) ==
                                      //     'Select Proprietorship Document Type') {
                                      //   errorToast(context,
                                      //       'Please select document type');
                                      // } else if (ref
                                      //         .watch(propDocImageProvider) ==
                                      //     null) {
                                      //   errorToast(context,
                                      //       'Please select document Image');
                                      // }
                                      else if (ref.watch(statesProvider) ==
                                          null) {
                                        errorToast(
                                            context, 'Please select state');
                                      } else if (ref.watch(districtProvider) ==
                                          null) {
                                        errorToast(
                                            context, 'Please select District');
                                      } else {
                                        errorToast(
                                            context, 'Please fill all values');
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(15),
                                      backgroundColor:
                                          ColorsConstant.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 0.3)
                                        ],
                                        fontWeight: FontWeight.w700,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
            )));
  }

  identificationLayout(BuildContext context, WidgetRef ref) => Form(
      key: identificationKey,
      child: ColumnSuper(children: [
        CupertinoButton(
            child: Text(
              "Authorized Signatory",
              style: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(17)),
            ),
            onPressed: () {}),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: adharController,
          validator: (value) {
            if (value == null || value.isEmpty) {
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
        TextFormField(
          keyboardType: TextInputType.number,
          controller: authNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please input Valid Name';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter Authorised Name",
              label: const Text("Enter Authorised Name"),
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
                  ref.watch(authorisedImageProvider.notifier).state =
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
                    child: ref.watch(authorisedImageProvider) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(authorisedImageProvider) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(authorisedImageProvider);
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
                              "Upload Authorized Letter ",
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

  addressLayout(BuildContext context, WidgetRef ref) => Form(
          child: ColumnSuper(children: [
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
            loading: () => defaultLoader()),
        const SizedBox(
          height: 10,
        ),
        ref.watch(statesProvider) == null
            ? const SizedBox()
            : ref
                .watch(districtListProvider(
                    code: ref.watch(statesProvider)?.code.toString()))
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
            if (value == null || value.isEmpty) {
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
              hintText: "Enter Company Address",
              label: const Text("Enter Company Address"),
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
      ]));

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
          ref.watch(bankListProvider).when(
              data: (states) => DropdownSearch<BankDatum?>(
                    validator: (value) {
                      if (value == null || value.bankName.isEmpty) {
                        return 'Please input valid bank name';
                      }
                      return null;
                    },
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
                                      "${terminal?.bankName}",
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
                            'Select Bank',
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
                    itemAsString: (BankDatum? u) => "${u?.bankName}",
                    onChanged: (BankDatum? data) =>
                        ref.watch(bankProvider.notifier).state = data,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          contentPadding: Pad(left: 10, bottom: 5, top: 5),
                          hintText: "Select Bank",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: ColorsConstant.secondColorUltraDark))),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () => defaultLoader()),
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

  firmLayout(BuildContext context, WidgetRef ref) => Form(
      key: firmKey,
      child: ColumnSuper(children: [
        CupertinoButton(
            child: Text(
              "Company Details",
              style: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(17)),
            ),
            onPressed: () {}),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: firmController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please input Company name';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Enter Company Name",
              label: Text("Enter Company Name"),
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
        ColumnSuper(
          children: [
            // TextFormField(
            //   keyboardType: TextInputType.text,
            //   controller: nameController,
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please input value';
            //     }
            //     return null;
            //   },
            //   decoration: InputDecoration(
            //       hintText: "Enter Full Name",
            //       label: const Text("Enter Full Name"),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       disabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10))),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input email';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Company Email",
                  label: const Text("Enter Company Email"),
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
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return 'Please input valid number';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Company Phone Number",
                  label: const Text("Enter Company Phone Number"),
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
            addressLayout(context, ref),
          ],
        ),
        SizedBox(
          height: 10,
        ),

        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       showCupertinoModalPopup(
        //           context: context,
        //           builder: (context) => CupertinoActionSheet(
        //                 title: Text(
        //                   "Select Proprietorship Document Type",
        //                   style: TextStyle(
        //                       color: ColorsConstant.secondColorUltraDark,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: Adaptive.sp(16)),
        //                 ),
        //                 actions: [
        //                   CupertinoActionSheetAction(
        //                     onPressed: () {
        //                       ref.watch(propDocProvider.notifier).state = "GST";
        //                       Navigator.pop(context);
        //                     },
        //                     isDefaultAction: true,
        //                     child: Text("GST",
        //                         style: TextStyle(
        //                             color: ColorsConstant.primaryColor,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: Adaptive.sp(16))),
        //                   ),
        //                   CupertinoActionSheetAction(
        //                     onPressed: () {
        //                       ref.watch(propDocProvider.notifier).state =
        //                           "License";
        //                       Navigator.pop(context);
        //                     },
        //                     isDefaultAction: true,
        //                     child: Text("License",
        //                         style: TextStyle(
        //                             color: ColorsConstant.primaryColor,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: Adaptive.sp(16))),
        //                   ),
        //                   CupertinoActionSheetAction(
        //                       onPressed: () {
        //                         ref.watch(propDocProvider.notifier).state =
        //                             "MSME";
        //                         Navigator.pop(context);
        //                       },
        //                       isDefaultAction: true,
        //                       child: Text("MSME",
        //                           style: TextStyle(
        //                               color: ColorsConstant.primaryColor,
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: Adaptive.sp(16))))
        //                 ],
        //               ));
        //     },
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: ColorsConstant.secondColorDark,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10))),
        //     child: Text(
        //       ref.watch(propDocProvider),
        //       style: TextStyle(
        //           color: Colors.white,
        //           shadows: [const Shadow(color: Colors.white, blurRadius: 0.3)],
        //           fontWeight: FontWeight.w700,
        //           fontSize: Adaptive.sp(16)),
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 10,
        ),
        // Visibility(
        //     visible: ref.watch(propTypeProvider).isNotEmpty,
        //     child: TextFormField(
        //       keyboardType: TextInputType.text,
        //       textInputAction: TextInputAction.next,
        //       controller: gstController,
        //       validator: (value) {
        //         if (value == null || value.isEmpty) {
        //           return 'Please input Valid number';
        //         }
        //         return null;
        //       },
        //       decoration: InputDecoration(
        //           hintText: "Enter ${ref.watch(propDocProvider)} Number",
        //           label: Text("Enter ${ref.watch(propDocProvider)} Number"),
        //           enabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10)),
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10)),
        //           disabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10))),
        //     )),
        // const SizedBox(
        //   height: 10,
        // ),
        //
        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: InkWell(
        //     onTap: () async {
        //       imagePicker.pickImage(source: ImageSource.gallery).then((value) {
        //         if (value != null) {
        //           ref.watch(propDocImageProvider.notifier).state =
        //               File(value.path);
        //         }
        //       });
        //     },
        //     child: dottedBorder.DottedBorder(
        //         borderType: dottedBorder.BorderType.RRect,
        //         dashPattern: const [5, 5, 5, 5],
        //         color: ColorsConstant.primaryColor,
        //         child: Padding(
        //           padding: const Pad(all: 20),
        //           child: Center(
        //             child: ref.watch(propDocImageProvider) != null
        //                 ? Stack(
        //                     children: [
        //                       Image.file(ref.watch(propDocImageProvider) ??
        //                           File('path')),
        //                       Container(
        //                         decoration: BoxDecoration(
        //                             color: Colors.black.withOpacity(0.6),
        //                             shape: BoxShape.circle),
        //                         child: IconButton(
        //                             onPressed: () {
        //                               ref.invalidate(propDocImageProvider);
        //                             },
        //                             icon: const Icon(
        //                               Icons.close,
        //                               color: Colors.white,
        //                             )),
        //                       )
        //                     ],
        //                   )
        //                 : ColumnSuper(children: [
        //                     Icon(
        //                       LucideIcons.cloud_upload,
        //                       color: ColorsConstant.primaryColor,
        //                     ),
        //                     SizedBox(
        //                       height: 5,
        //                     ),
        //                     Text(
        //                       "Select Document Image",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                           color: ColorsConstant.primaryColor,
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: Adaptive.sp(16)),
        //                     ),
        //                     SizedBox(
        //                       height: 5,
        //                     ),
        //                     Text(
        //                       "Upload Document Image,\n  Supports JPG, JPEG, PNG",
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                           color: ColorsConstant.primaryColor,
        //                           fontWeight: FontWeight.w700,
        //                           fontSize: Adaptive.sp(13)),
        //                     )
        //                   ]),
        //           ),
        //         )),
        //   ),
        // ),
        //
        // const SizedBox(),
        const SizedBox(
          height: 10,
        ),
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
          inputFormatters: [
            UpperCaseTextFormatter(),
          ],
          decoration: InputDecoration(
              hintText: "Enter Company PAN Number",
              label: const Text("Enter Company PAN Number"),
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

        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () async {
              imagePicker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  ref.watch(moaAoaImageProvider.notifier).state =
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
                    child: ref.watch(moaAoaImageProvider) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(moaAoaImageProvider) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(moaAoaImageProvider);
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
                              "Select MOA/AOA Image",
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
                  ref.watch(boardResolutionImage.notifier).state =
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
                    child: ref.watch(boardResolutionImage) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(boardResolutionImage) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(boardResolutionImage);
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
                              "Select Board Resolution Image",
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
          controller: directorController,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty ) {
              return 'input no of Directors';
            }
            return null;
          },
          inputFormatters: [
            UpperCaseTextFormatter(),
          ],
          decoration: InputDecoration(
              hintText: "Enter No of Directors",
              label: const Text("Enter No of Directors"),
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
                  ref.watch(directorProofImage.notifier).state =
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
                    child: ref.watch(directorProofImage) != null
                        ? Stack(
                            children: [
                              Image.file(ref.watch(directorProofImage) ??
                                  File('path')),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      ref.invalidate(directorProofImage);
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
                              "Select Director Proof  Image",
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
}
