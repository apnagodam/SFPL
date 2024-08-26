import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes_strings.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef) {
    return Scaffold(
      body: OnBoardingSlider(
          totalPage: 2,
          hasSkip: true,
          skipTextButton: TextButton(
              onPressed: () {
                context.go(RoutesStrings.login);
              },
              child: Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          controllerColor: ColorsConstant.primaryColor,
          finishButtonStyle: const FinishButtonStyle(
              backgroundColor: ColorsConstant.secondColorDark),
          headerBackgroundColor: Colors.white,
          background: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorsConstant.secondColorDark,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorsConstant.secondColorDark,
            )
          ],
          onFinish: () {
            context.go(RoutesStrings.login);
          },
          finishButtonText: "Login",
          speed: 0.3,
          pageBodies: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/onboarding_one.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "We’ve 8 years of agriculture finance experience."
                        .toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(18),
                        shadows: [
                          const Shadow(
                              color: Colors.white,
                              blurRadius: 01,
                              offset: Offset(0.3, 0.4))
                        ],
                        color: ColorsConstant.primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Though our NBFC firm, ApnaGodam provides loans to farmers against warehouse receipts on low interest. Fastest Loan processing. Get easy finance on warehouse stocks.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Adaptive.sp(16)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/onboarding_two.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "SERVICES WE’RE OFFERING\n",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(18),
                        color: ColorsConstant.primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Apna Godam Finance provides loans to farmers against warehouse receipts on low interest. Fastest Loan processing. Get easy finance on warehouse stocks.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Adaptive.sp(16)))
                ],
              ),
            ),
          ]),
    );
  }
}
