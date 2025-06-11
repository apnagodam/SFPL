import 'dart:convert';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/MongoDbUserModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../utils/routes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with WidgetsBindingObserver {
  final formKey = GlobalKey<FormState>();
  final _autoFormKey = GlobalKey<FormState>();
  TextEditingController panController = TextEditingController();
  var isLoading = StateProvider((ref) => false);
  var phoneNumber = StateProvider((ref) => '');
  var userDetailsProvider = StateProvider<Map<String, dynamic>?>((ref) => null);
  var isDataLoading = StateProvider((ref) => false);

  final _pancardController = TextEditingController();
  final _autologinPhoneController = TextEditingController();
  final _autologinOtpController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // showloader(context);
      // ref.watch(isDataLoading.notifier).state = true;

      // var db = await mongo.Db.create(
      //     "mongodb+srv://apnagodam:l2F97uxKZ73eq251@cluster0.humxj.mongodb.net/userData");
      // await db.open();
      // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      // final mobileDeviceIdentifier =
      //     await MobileDeviceIdentifier().getDeviceId();

      // var userDetailsCollection = db.collection(androidInfo.id.toString());

      // userDetailsCollection.find().first.then((value) {
      //   ref
      //       .watch(sharedUtilityProvider)
      //       .setMongoDbUser(mongoDbUserModelFromJson(jsonEncode(value)));
      //   ref.watch(userDetailsProvider.notifier).state = value;
      // });

      // hideLoader(context);
      // ref.watch(isDataLoading.notifier).state = false;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // ref.watch(isDataLoading.notifier).state = true;
      // var db = await mongo.Db.create(
      //     "mongodb+srv://apnagodam:l2F97uxKZ73eq251@cluster0.humxj.mongodb.net/userData");
      // await db.open();
      // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      // final mobileDeviceIdentifier =
      //     await MobileDeviceIdentifier().getDeviceId();

      // var userDetailsCollection = db.collection(androidInfo.id.toString());

      // userDetailsCollection.find().first.then((value) {
      //   ref
      //       .watch(sharedUtilityProvider)
      //       .setMongoDbUser(mongoDbUserModelFromJson(jsonEncode(value)));
      //   ref.watch(userDetailsProvider.notifier).state = value;
      // });
//
      //ref.watch(isDataLoading.notifier).state = false;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ColumnSuper(
              children: [
                SizedBox(
                  height: Adaptive.h(25),
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
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: ColorsConstant.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(20)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to avail and manage loan facilities",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(17)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'Please input Valid Mobile Number';
                    }
                    return null;
                  },
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  keyboardType: TextInputType.number,
                  controller: panController,
                  maxLength: 10,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      label: const Text("Enter Mobile Number"),
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
                ref.watch(isLoading)
                    ? Center(
                        child: defaultLoader(),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              ref.watch(isLoading.notifier).state = true;

                              ref
                                  .watch(loginProvider(
                                          panNumber:
                                              panController.text.toString())
                                      .future)
                                  .then((value) {
                                ref.watch(isLoading.notifier).state = false;

                                if (value['status'].toString() == "1") {
                                  context.goNamed(RoutesStrings.verifyOtp,
                                      extra: {
                                        'panCard': panController.text
                                            .toString()
                                            .toUpperCase()
                                      });
                                  successToast(context, '${value['message']}');
                                } else {
                                  ref
                                      .watch(goRouterProvider)
                                      .goNamed(RoutesStrings.register);
                                }
                              }).onError((e, s) {
                                ref.watch(isLoading.notifier).state = false;
                              });
                            } else {
                              ref.watch(isLoading.notifier).state = false;
                            }
                            // VerifyOtpScreen().launch(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                shadows: [
                                  const Shadow(
                                      color: Colors.white, blurRadius: 0.3)
                                ],
                                fontWeight: FontWeight.w700,
                                fontSize: Adaptive.sp(16)),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsConstant.secondColorDark,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                // if (ref.watch(userDetailsProvider) != null)
                //   ElevarmDivider(
                //     child: Text(
                //       'OR',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: Adaptive.sp(14)),
                //     ),
                //   ),
                // InkWell(
                //   child: Card(
                //     elevation: 5,
                //     color: Colors.white,
                //     child: Padding(
                //       padding: const Pad(all: 10),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           CircleAvatar(
                //             child: Image.asset(
                //               'assets/user_logo.png',
                //               errorBuilder: (context, obj, stack) =>
                //                   const Icon(Icons.image),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   'Login with Apnagodam',
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: Adaptive.sp(15)),
                //                 ),
                //                 // Text(
                //                 //   '${ref.watch(sharedUtilityProvider).getMongoDbUser()?.fname ?? ""} ${ref.watch(sharedUtilityProvider).getMongoDbUser()?.lname ?? ""}',
                //                 //   style: TextStyle(
                //                 //       fontWeight: FontWeight.normal,
                //                 //       fontSize: Adaptive.sp(15)),
                //                 // )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   onTap: () {
                //     // ref.watch(isLoading.notifier).state = true;
                //     _handleAutoLogin();

                //     // ref
                //     //     .watch(loginProvider(
                //     //             panNumber: ref.watch(
                //     //                 userDetailsProvider)!['phone'])
                //     //         .future)
                //     //     .then((value) {
                //     //   ref.watch(isLoading.notifier).state = false;

                //     //   if (value['status'].toString() == "1") {
                //     //     context
                //     //         .goNamed(RoutesStrings.verifyOtp, extra: {
                //     //       'panCard':
                //     //           ref.watch(userDetailsProvider)!['phone']
                //     //     });

                //     //     successToast(context, '${value['message']}');
                //     //   } else {
                //     //     if (value['message']
                //     //         .toString()
                //     //         .toLowerCase()
                //     //         .trim()
                //     //         .contains('not registered')) {
                //     //       if (ref.watch(userDetailsProvider)?[
                //     //               'constitution'] ==
                //     //           null) {
                //     //         ref
                //     //             .watch(goRouterProvider)
                //     //             .goNamed(RoutesStrings.register);
                //     //       } else if (ref
                //     //               .watch(userDetailsProvider)?[
                //     //                   'constitution']
                //     //               .toString() ==
                //     //           '1') {
                //     //         ref.watch(goRouterProvider).goNamed(
                //     //             RoutesStrings.individualRegistration);
                //     //       } else if (ref
                //     //               .watch(userDetailsProvider)?[
                //     //                   'constitution']
                //     //               .toString() ==
                //     //           '2') {
                //     //         ref.watch(goRouterProvider).goNamed(
                //     //             RoutesStrings.propRegistration);
                //     //       } else if (ref
                //     //               .watch(userDetailsProvider)?[
                //     //                   'constitution']
                //     //               .toString() ==
                //     //           '3') {
                //     //         ref.watch(goRouterProvider).goNamed(
                //     //             RoutesStrings.partnershipRegistration);
                //     //       } else if (ref
                //     //               .watch(userDetailsProvider)?[
                //     //                   'constitution']
                //     //               .toString() ==
                //     //           '4') {
                //     //         ref.watch(goRouterProvider).goNamed(
                //     //             RoutesStrings.companyRegistration);
                //     //       }

                //     //       // debugPrint(" \x1B[31m${response.data}\x1B[0m");
                //     //     }
                //     //   }
                //     // }).onError((e, s) {
                //     //   ref.watch(isLoading.notifier).state = false;
                //     // });
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(
                    TextSpan(
                        text: 'Do not have an Account?',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstant.primaryColor),
                        children: [
                          TextSpan(
                            text: " Register",
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.goNamed(RoutesStrings.register),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.secondColorDark),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _handleAutoLogin() async {
    showBottomSheet(
        context: context,
        builder: (sheetContext) => ElevarmDraggableBottomSheet(
              title: 'Login with Apnagodam',
              onPressedClose: () =>
                  Navigator.of(sheetContext, rootNavigator: false).pop(),
              children: [_autoLoginBottomsheetUI()],
              footerWidget: ElevarmPrimaryButton.text(
                text: 'Login',
                onPressed: _autoFetchUserDetails,
              ),
            ));
  }

  Future<void> _autoFetchUserDetails() async {
    if (_autoFormKey.checkFormValidtion()) {
      ref
          .watch(fetchRegisteredUserDataProvider(
                  panCardNo: _pancardController.text,
                  phone: _autologinPhoneController.text)
              .future)
          .then((value) {
        if (value['status'].toString() == "1") {
          successToast(context, value['message']);
          showBottomSheet(
              context: context,
              builder: (otpContext) => ElevarmBottomSheet(
                      title: "Verify Otp",
                      children: [
                        _autoLoginOtpBottomsheetUI(
                            ref, value['constitution'].toString())
                      ]));
        }
        ;
      });
    }
  }

  _autoLoginBottomsheetUI() => Consumer(
      builder: (context, ref, child) => Form(
          key: _autoFormKey,
          child: Column(
            children: [
              ElevarmTextInputField(
                label: 'Input Pan card no.',
                helperText: 'E.g ABCDE1234F',
                controller: _pancardController,
                maxLength: 10,
                inputFormatters: [UpperCaseTextFormatter()],
                validator: (value) {
                  if (value == null || !value.isValidPanCardNo()) {
                    return 'Please input valid pan card no.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevarmTextInputField(
                label: 'Input Phone no.',
                maxLength: 10,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Please input valid mobile no.';
                  }
                  return null;
                },
                controller: _autologinPhoneController,
              )
            ],
          )));

  _autoLoginOtpBottomsheetUI(WidgetRef ref, String constitution) => Form(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Pinput(
                autofocus: true,
                controller: _autologinOtpController,
                length: 6,
                defaultPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsConstant.primaryColor.withOpacity(0.1),
                        border: Border.all(
                            color:
                                ColorsConstant.primaryColor.withOpacity(0.1)))),
                focusedPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsConstant.primaryColor.withOpacity(0.1),
                        border:
                            Border.all(color: ColorsConstant.secondColorDark))),
                onCompleted: (pin) {
                  if (pin.length == 6) {
                    Debouncer(delay: const Duration(milliseconds: 500))
                        .call(() {
                      Map<String, dynamic> data = {
                        'pancard_no': _pancardController.text,
                        'phone': _autologinPhoneController.text,
                        'constitution': constitution,
                        'otp': pin
                      };

                      ref
                          .watch(verifyRegisteredUserOtpProvider(data: data)
                              .future)
                          .then((otpResponse) {
                        if (otpResponse['status'].toString() == "1") {
                          successToast(context, '${otpResponse['data']}');
                          if (otpResponse['status'].toString() == "1") {
                            context.goNamed(RoutesStrings.verifyOtp, extra: {
                              'panCard':
                                  ref.watch(userDetailsProvider)!['phone']
                            });

                            successToast(context, '${otpResponse['message']}');
                          } else {
                            if (otpResponse['message']
                                .toString()
                                .toLowerCase()
                                .trim()
                                .contains('not registered')) {
                              if (ref.watch(
                                      userDetailsProvider)?['constitution'] ==
                                  null) {
                                ref
                                    .watch(goRouterProvider)
                                    .goNamed(RoutesStrings.register);
                              } else if (ref
                                      .watch(
                                          userDetailsProvider)?['constitution']
                                      .toString() ==
                                  '1') {
                                ref.watch(goRouterProvider).goNamed(
                                    RoutesStrings.individualRegistration);
                              } else if (ref
                                      .watch(
                                          userDetailsProvider)?['constitution']
                                      .toString() ==
                                  '2') {
                                ref
                                    .watch(goRouterProvider)
                                    .goNamed(RoutesStrings.propRegistration);
                              } else if (ref
                                      .watch(
                                          userDetailsProvider)?['constitution']
                                      .toString() ==
                                  '3') {
                                ref.watch(goRouterProvider).goNamed(
                                    RoutesStrings.partnershipRegistration);
                              } else if (ref
                                      .watch(
                                          userDetailsProvider)?['constitution']
                                      .toString() ==
                                  '4') {
                                ref
                                    .watch(goRouterProvider)
                                    .goNamed(RoutesStrings.companyRegistration);
                              }

                              // debugPrint(" \x1B[31m${response.data}\x1B[0m");
                            }
                          }
                        }
                      });
                      //showloader(context);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ));
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
