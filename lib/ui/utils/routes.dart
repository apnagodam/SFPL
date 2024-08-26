import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/auth/IndividualRegistration.dart';
import 'package:swfl/ui/auth/PropRegistration.dart';
import 'package:swfl/ui/auth/RegistrationScreen.dart';
import 'package:swfl/ui/auth/RegistrationVerifyOtp.dart';
import 'package:swfl/ui/auth/login_screen.dart';
import 'package:swfl/ui/auth/verify_otp_screen.dart';
import 'package:swfl/ui/home/DashboardMenu/ApplyForLoan/ApplyForLoan.dart';
import 'package:swfl/ui/home/DashboardMenu/SanctionedAmount/SanctionedAmountScreen.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/AddMoney.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/MoneyRequest.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/WithdrawMoney.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/profile/ProfileScreen.dart';
import 'package:swfl/ui/splash/onboarding_screen.dart';
import 'package:swfl/ui/utils/routes_strings.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';

part 'routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        if (ref.watch(sharedUtilityProvider).getToken().isEmpty) {
          if (state.fullPath == RoutesStrings.dashboard)
            return RoutesStrings.login;
          return null;
        }
      },
      routes: [
        GoRoute(
            path: RoutesStrings.onBoarding,
            name: RoutesStrings.onBoarding,
            builder: (context, state) => const OnBoardingScreen()),
        GoRoute(
            path: RoutesStrings.dashboard,
            name: RoutesStrings.dashboard,
            routes: [
              GoRoute(
                path: RoutesStrings.applyForLoan,
                name: RoutesStrings.applyForLoan,
                builder: (context, state) => const Applyforloan(),
              ),
              GoRoute(
                path: RoutesStrings.profile,
                name: RoutesStrings.profile,
                builder: (context, state) => const Profilescreen(),
              ),
              GoRoute(
                path: RoutesStrings.sanctionedAmount,
                name: RoutesStrings.sanctionedAmount,
                builder: (context, state) => const Sanctionedamountscreen(),
              ),
              GoRoute(
                path: RoutesStrings.addMoney,
                name: RoutesStrings.addMoney,
                builder: (context, state) => const Addmoney(),
              ),
              GoRoute(
                path: RoutesStrings.moneyRequests,
                name: RoutesStrings.moneyRequests,
                builder: (context, state) => const Moneyrequest(),
              ),
              GoRoute(
                path: RoutesStrings.withdrawMoney,
                name: RoutesStrings.withdrawMoney,
                builder: (context, state) => const Withdrawmoney(),
              ),
            ],
            builder: (context, state) => const DashboardScreen()),
        GoRoute(
            path: RoutesStrings.login,
            name: RoutesStrings.login,
            routes: [
              GoRoute(
                  path: RoutesStrings.verifyOtp,
                  name: RoutesStrings.verifyOtp,
                  builder: (context, state) {
                    final data = state.extra! as Map<String, dynamic>;
                    return VerifyOtpScreen(
                      panCard: data['panCard'],
                    );
                  }),
              GoRoute(
                  path: RoutesStrings.register,
                  name: RoutesStrings.register,
                  builder: (context, state) => const Registrationscreen(),
                  routes: [
                    GoRoute(
                        path: RoutesStrings.individualRegistration,
                        name: RoutesStrings.individualRegistration,
                        builder: (context, state) =>
                            const Individualregistration()),
                    GoRoute(
                        path: RoutesStrings.propRegistration,
                        name: RoutesStrings.propRegistration,
                        builder: (context, state) => const Propregistration()),
                    GoRoute(
                        path: RoutesStrings.registrationOtp,
                        name: RoutesStrings.registrationOtp,
                        builder: (context, state) {
                          final data = state.extra! as Map<String, dynamic>;
                          return Registrationverifyotp(
                              panCard: data['panCard']);
                        }),
                  ]),
            ],
            builder: (context, state) => LoginScreen()),
        // GoRoute(
        //     path: RoutesStrings.register,
        //     name: RoutesStrings.register,
        //     builder: (context, state) => const Registrationscreen(),
        //     routes: [
        //       GoRoute(
        //           path: RoutesStrings.individualRegistration,
        //           name: RoutesStrings.individualRegistration,
        //           builder: (context, state) => const Individualregistration()),
        //       GoRoute(
        //           path: RoutesStrings.propRegistration,
        //           name: RoutesStrings.propRegistration,
        //           builder: (context, state) => const Propregistration()),
        //       GoRoute(
        //           path: RoutesStrings.registrationOtp,
        //           name: RoutesStrings.registrationOtp,
        //           builder: (context, state) {
        //             final data = state.extra! as Map<String, dynamic>;
        //             return Registrationverifyotp(panCard: data['panCard']);
        //           }),
        //     ]),
      ]);
}
