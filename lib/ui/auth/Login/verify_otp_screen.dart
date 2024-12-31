import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/AuthenticationService/AuthenticationService.dart';
import '../../../Domain/Dio/DioProvider.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({super.key, required this.panCard});

  final String panCard;

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
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
                "Enter the code sent to the number",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Adaptive.sp(18)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "${widget.panCard}",
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(16)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                      Debouncer(delay: const Duration(milliseconds: 500))
                          .call(() {
                        showloader(context);
                        ref
                            .watch(verifyOtpProvider(
                                    panCard: widget.panCard, otp: pin)
                                .future)
                            .then((value) {
                          Navigator.of(context, rootNavigator: true).pop('dialog');

                          if (value.status.toString() == "1") {
                            ref
                                .watch(sharedUtilityProvider)
                                .setToken(value.data?.token ?? "");
                            ref.watch(sharedUtilityProvider).setUser(value.data);

                            ref.invalidate(dioProvider);
                            context.go(RoutesStrings.dashboard);
                          }
                        });
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         context.go(RoutesStrings.dashboard);
            //       },
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: ColorsConstant.secondColorDark,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(8))),
            //       child: Text(
            //         "Verify Otp",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
            //       ),
            //     ),
            //   ),
            // ),
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