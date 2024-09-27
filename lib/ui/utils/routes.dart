import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/BNPL/BnplScreen.dart';
import 'package:swfl/ui/BNPL/BnplStatement.dart';
import 'package:swfl/ui/BNPL/Withdraw.dart';
import 'package:swfl/ui/auth/BnplAadharRegistration.dart';
import 'package:swfl/ui/auth/BnplRegistration.dart';
import 'package:swfl/ui/auth/BnplUpdateAddress.dart';
import 'package:swfl/ui/auth/IndividualRegistration.dart';
import 'package:swfl/ui/auth/PropRegistration.dart';
import 'package:swfl/ui/auth/RegistrationScreen.dart';
import 'package:swfl/ui/auth/RegistrationVerifyOtp.dart';
import 'package:swfl/ui/auth/login_screen.dart';
import 'package:swfl/ui/auth/verify_otp_screen.dart';
import 'package:swfl/ui/home/DashboardMenu/ApplyForCommodityLoan/AppliedLoanList.dart';
import 'package:swfl/ui/home/DashboardMenu/ApplyForCommodityLoan/ApplyLoanScreen.dart';
import 'package:swfl/ui/home/DashboardMenu/SanctionedAmount/SanctionedAmountScreen.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/AddMoney.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/MoneyRequest.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/WithdrawMoney.dart';
import 'package:swfl/ui/home/DashboardMenu/Wallet/WithdrawRequests.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/profile/ProfileScreen.dart';
import 'package:swfl/ui/splash/onboarding_screen.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/verification/Verification.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';
import '../home/DashboardMenu/ApplyForSanctionLimit/ApplyForSanctionLimit.dart';

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
                  path: RoutesStrings.bnpl,
                  name: RoutesStrings.bnpl,
                  builder: (context, state) => const Bnplscreen()),

              GoRoute(
                  path: RoutesStrings.bnplStatement,
                  name: RoutesStrings.bnplStatement,
                  builder: (context, state) => const Bnplstatement()),


              GoRoute(
                  path: RoutesStrings.applyForCommodityLoan,
                  name: RoutesStrings.applyForCommodityLoan,
                  builder: (context, state) => const Applyloanscreen()),
              GoRoute(
                  path: RoutesStrings.appliedLoanList,
                  name: RoutesStrings.appliedLoanList,
                  builder: (context, state) => const Appliedloanlist()),

              GoRoute(
                  path: RoutesStrings.bnplWithdraw,
                  name: RoutesStrings.bnplWithdraw,
                  builder: (context, state) => const WithdrawScreen()),
              GoRoute(
                  path: RoutesStrings.verfication,
                  name: RoutesStrings.verfication,
                  builder: (context, state) => const Verification()),
              GoRoute(
                path: RoutesStrings.applyForSanctionLimit,
                name: RoutesStrings.applyForSanctionLimit,
                builder: (context, state) => const ApplyForSanctionLimit(),
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
              GoRoute(
                path: RoutesStrings.withdrawRequests,
                name: RoutesStrings.withdrawRequests,
                builder: (context, state) => const Withdrawrequests(),
              ),
              GoRoute(
                  path: RoutesStrings.bnplAadharRegistrationHome,
                  name: RoutesStrings.bnplAadharRegistrationHome,
                  builder: (context, state) =>
                  const Bnplaadharregistration()),
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
                        path: RoutesStrings.bnplRegistration,
                        name: RoutesStrings.bnplRegistration,
                        builder: (context, state) {
                          final data = state.extra! as Map<String, dynamic>;
                          return Bnplregistration(
                            typeOfRegistration: data['reg_type'],
                            constitutiontype: data['cons_type'],
                          );
                        },
                        routes: [
                          GoRoute(
                              path: RoutesStrings.bnplAadharRegistration,
                              name: RoutesStrings.bnplAadharRegistration,
                              builder: (context, state) =>
                                  const Bnplaadharregistration()),
                          GoRoute(
                              path: RoutesStrings.bnplUpdateAddress,
                              name: RoutesStrings.bnplUpdateAddress,
                              builder: (context, state) =>
                                  const Bnplupdateaddress()),
                        ]),
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
