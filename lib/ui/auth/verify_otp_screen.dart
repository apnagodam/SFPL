import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/utils/colors.dart';

class VerifyOtpScreen extends ConsumerWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "+91-9001155788",
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
                  onCompleted: (pin) => print(pin),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    DashboardScreen().launch(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    "Verify Otp",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                  ),
                ),
              ),
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
                  onPressed: () {},
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
