import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/auth/verify_otp_screen.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController panController = TextEditingController();
  var isLoading = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              "Login",
              style: TextStyle(
                  color: ColorsConstant.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(20)),
            ),
            const SizedBox(
              height: 20,
            ),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.isValidPanCardNo()) {
                return 'Please input Valid Pan Number';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            controller: panController,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
                hintText: "Enter Pan Number",
                label: const Text("Enter Pan Number"),
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
              ? const Center(
            child: CupertinoActivityIndicator(),
          )
              : SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
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
                            'panCard': panController.text.toString()
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
                    shadows: [const Shadow(color: Colors.white, blurRadius: 0.3)],
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
