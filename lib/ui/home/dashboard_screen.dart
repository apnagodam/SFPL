import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../Domain/AuthenticationService/AuthenticationService.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

var triPartyImageProvider = StateProvider<File?>((ref) => null);

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(loginInfoProvider.future).then((value) async {
        if (value.data?.isLogin != false) {
          ref.watch(sharedUtilityProvider).setUser(value.data);
        } else {
          ref.watch(sharedPreferencesProvider).clear();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/swfl.png',
          fit: BoxFit.contain,
          height: Adaptive.h(2.5),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.help))],
        iconTheme:
            const IconThemeData(color: ColorsConstant.secondColorSuperDark),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.profile);
                    },
                    child: RowSuper(
                      alignment: Alignment.centerLeft,
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.profileImage ??
                              ""),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${ref.watch(sharedUtilityProvider).getUser()?.firmName}',
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ],
            ),
            CupertinoActionSheet(
              title: Center(
                child: Text(
                  'Loan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    if (ref
                            .watch(sharedUtilityProvider)
                            .getUser()
                            ?.tryPartyStatus !=
                        2) {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus ==
                          1) {
                        errorToast(context,
                            "You already have a pending request for verification!");
                      } else {
                        context.goNamed(RoutesStrings.verfication);
                      }
                    } else {
                      context.goNamed(RoutesStrings.applyForLoan);
                    }
                  },
                  child: Text('Apply For Loan',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                CupertinoActionSheetAction(
                    onPressed: () {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus !=
                          2) {
                        if (ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.tryPartyStatus ==
                            1) {
                          errorToast(context,
                              "You already have a pending request for verification!");
                        } else {
                          context.goNamed(RoutesStrings.verfication);
                        }
                      } else {
                        context.goNamed(RoutesStrings.sanctionedAmount);
                      }
                    },
                    child: Text('Sanctioned Amount',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            CupertinoActionSheet(
              title: Center(
                child: Text(
                  'Wallet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus !=
                          2) {
                        if (ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.tryPartyStatus ==
                            1) {
                          errorToast(context,
                              "You already have a pending request for verification!");
                        } else {
                          context.goNamed(RoutesStrings.verfication);
                        }
                      } else {
                        context.goNamed(RoutesStrings.addMoney);
                      }
                    },
                    child: Text('Add Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus !=
                          2) {
                        if (ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.tryPartyStatus ==
                            1) {
                          errorToast(context,
                              "You already have a pending request for verification!");
                        } else {
                          context.goNamed(RoutesStrings.verfication);
                        }
                      } else {
                        context.goNamed(RoutesStrings.moneyRequests);
                      }
                    },
                    child: Text('Add Money Requests',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus !=
                          2) {
                        if (ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.tryPartyStatus ==
                            1) {
                          errorToast(context,
                              "You already have a pending request for verification!");
                        } else {
                          context.goNamed(RoutesStrings.verfication);
                        }
                      } else {
                        context.goNamed(RoutesStrings.withdrawMoney);
                      }
                    },
                    child: Text('Withdraw Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      if (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.tryPartyStatus !=
                          2) {
                        if (ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.tryPartyStatus ==
                            1) {
                          errorToast(context,
                              "You already have a pending request for verification!");
                        } else {
                          context.goNamed(RoutesStrings.verfication);
                        }
                      } else {
                        context.goNamed(RoutesStrings.withdrawRequests);
                      }
                    },
                    child: Text('Withdraw Requests',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref.watch(logoutProvider.future).then((value) async {
                        await ref.watch(sharedPreferencesProvider).clear();
                        setState(() {});
                        ref
                            .watch(goRouterProvider)
                            .goNamed(RoutesStrings.login);
                      });
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            )
          ],
        ),
      ),
      body: const HomeScreen(),
    );
  }

  var activeStepProvider = StateProvider((ref) => 0);
}

tripartyDialog(BuildContext context, WidgetRef ref) => showBarModalBottomSheet(
    context: context,
    builder: (context) => ColumnSuper(children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'How to Verify?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          RowSuper(fill: true, children: [
            ColumnSuper(children: [
              CircleButton(
                onTap: () async {},
                icon: const Icon(
                  LucideIcons.file_down,
                ),
                border: Border.all(color: ColorsConstant.primaryColor),
              ),
              Text(
                'Download \nAgreement',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700),
              )
            ]),
            const Divider(
              thickness: 1.0,
            ),
            ColumnSuper(children: [
              CircleButton(
                icon: const Icon(
                  LucideIcons.stamp,
                ),
                border: Border.all(color: ColorsConstant.primaryColor),
              ),
              Text('Stamp \nAgreement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
            ]),
            const Divider(
              thickness: 1.0,
            ),
            ColumnSuper(children: [
              CircleButton(
                icon: const Icon(
                  LucideIcons.cloud_upload,
                ),
                border: Border.all(color: ColorsConstant.primaryColor),
              ),
              Text('Upload \nAgreement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
            ]),
          ]),
          const SizedBox(
            height: 10,
          ),
        ]));
