import 'dart:convert';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with WidgetsBindingObserver {
  final formKey = GlobalKey<FormState>();
  TextEditingController panController = TextEditingController();
  var isLoading = StateProvider((ref) => false);
  var phoneNumber = StateProvider((ref) => '');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   var db = await mongo.Db.create(
    //       "mongodb+srv://apnagodam:WOU8uu5VoGWuaaZW@cluster0.humxj.mongodb.net/");
    //   await db.open();

    //   final mobileDeviceIdentifier =
    //       await MobileDeviceIdentifier().getDeviceId();

    //   var userDetailsCollection =
    //       db.collection(mobileDeviceIdentifier.toString());
    //   showloader(context);

    //   userDetailsCollection.find().first.then((value) {
    //     if (value['phone'] != null) {
    //       ref
    //           .watch(loginProvider(panNumber: value['phone']).future)
    //           .then((value) {
    //         hideLoader(context);
    //         ref.watch(isLoading.notifier).state = false;

    //         if (value['status'].toString() == "1") {
    //           context.goNamed(RoutesStrings.verifyOtp,
    //               extra: {'panCard': value['phone'].toString().toUpperCase()});
    //           successToast(context, '${value['message']}');
    //         } else {
    //           context.goNamed(RoutesStrings.register);
    //         }
    //       });
    //     } else {
    //       hideLoader(context);
    //     }
    //   });
    // });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // var db = await mongo.Db.create(
      //     "mongodb+srv://apnagodam:WOU8uu5VoGWuaaZW@cluster0.humxj.mongodb.net/");
      // await db.open();

      // final mobileDeviceIdentifier =
      //     await MobileDeviceIdentifier().getDeviceId();

      // var userDetailsCollection =
      //     db.collection(mobileDeviceIdentifier.toString());
      // showloader(context);

      // userDetailsCollection.find().first.then((value) {
      //   if (value['phone'] != null) {
      //     ref
      //         .watch(loginProvider(panNumber: value['phone']).future)
      //         .then((value) {
      //       hideLoader(context);
      //       ref.watch(isLoading.notifier).state = false;

      //       if (value['status'].toString() == "1") {
      //         context.goNamed(RoutesStrings.verifyOtp,
      //             extra: {'panCard': value['phone'].toString().toUpperCase()});
      //         successToast(context, '${value['message']}');
      //       } else {
      //         context.goNamed(RoutesStrings.register);
      //       }
      //     });
      //   } else {
      //     hideLoader(context);
      //   }
      // });
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
                                  errorToast(context, '${value['message']}');
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(
                    TextSpan(
                        text: 'Do not have an Account?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsConstant.primaryColor),
                        children: [
                          TextSpan(
                            text: " Register",
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.goNamed(RoutesStrings.register),
                            style: TextStyle(
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
