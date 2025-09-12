import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';

import '../../utils/colors.dart';
import '../../utils/routes_strings.dart';

class Registrationverifyotp extends ConsumerStatefulWidget {
  const Registrationverifyotp({super.key, required this.panCard});

  final String panCard;

  @override
  ConsumerState<Registrationverifyotp> createState() =>
      _RegistrationverifyotpState();
}

class _RegistrationverifyotpState extends ConsumerState<Registrationverifyotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: ListView(
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
            Center(
              child: Text(
                "Verification",
                style: TextStyle(
                    color: ColorsConstant.secondColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(22)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Enter the code sent to your number",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Adaptive.sp(18)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Text(
            //     "+91-9001155788",
            //     style: TextStyle(
            //         color: ColorsConstant.primaryColor,
            //         fontWeight: FontWeight.bold,
            //         fontSize: Adaptive.sp(16)),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
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
                          color: ColorsConstant.primaryColor.withOpacity(0.1),
                          border: Border.all(
                              color: ColorsConstant.primaryColor
                                  .withOpacity(0.1)))),
                  focusedPinTheme: PinTheme(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsConstant.primaryColor.withOpacity(0.1),
                          border: Border.all(
                              color: ColorsConstant.secondColorDark))),
                  onCompleted: (pin) {
                    if (pin.length == 6) {
                      ref
                          .watch(verifyOtpProvider(
                                  panCard: widget.panCard, otp: pin)
                              .future)
                          .then((value) {
                        if (value.status.toString() == "1") {
                          ref
                              .watch(sharedUtilityProvider)
                              .setToken(value.data?.token ?? "");
                          ref.watch(sharedUtilityProvider).setUser(value.data);
                          context.go(RoutesStrings.dashboard);
                        }
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't Received the Otp?",
                  style: TextStyle(
                      color: ColorsConstant.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(16)),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .watch(loginProvider(panNumber: widget.panCard).future)
                        .then((value) {})
                        .onError((e, s) {});
                  },
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsConstant.secondColorSuperDark,
                        color: ColorsConstant.secondColorSuperDark,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(16)),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
