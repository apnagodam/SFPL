import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/TermsModel.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/BnplService/BnplService.dart';
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
  var checkBoxValueProvider = StateProvider((ref) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(loginInfoProvider.future).then((value) async {
        if (value.data?.isLogin != false) {

          if (value.data?.type == "BNPL" && value.data?.aadharVerify == "0") {
            showVerificationDialog(context,
                titleText: "Verify Aadhar",
                messageText: "Your Aadhar verification is pending", action: () {
              hideLoader(context);
              context.goNamed(RoutesStrings.bnplAadharRegistration);
            });
          }

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
                  'Commodity Pledge Loan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {

                    context.goNamed(RoutesStrings.applyForCommodityLoan);


                  },
                  child: Text('Loan Apply ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                // CupertinoActionSheetAction(
                //   onPressed: () {
                //     context.goNamed(RoutesStrings.bnplWithdraw);
                //   },
                //   child: Text('Withdraw ',
                //       textAlign: TextAlign.start,
                //       style: TextStyle(
                //           fontSize: Adaptive.sp(16),
                //           color: Colors.black,
                //           fontWeight: FontWeight.w500)),
                // ),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.appliedLoanList);
                      // if(ref.watch(sharedUtilityProvider).getUser()?.aadharVerify.toString()=="0"){
                      //   showVerificationDialog(context,
                      //       titleText: "Verify Aadhar",
                      //       messageText: "Your Aadhar verification is pending", action: () {
                      //         hideLoader(context);
                      //         context.goNamed(RoutesStrings.bnplAadharRegistrationHome);
                      //       });
                      // }else{
                      //
                      //
                      // }

                      // if (ref.watch(sharedUtilityProvider).getUser()?.aadharVerify == "0") {
                      //   showVerificationDialog(context,
                      //       titleText: "Verify Aadhar",
                      //       messageText: "Your Aadhar verification is pending");
                      // }
                      // else{
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      //
                      // }
                    },
                    child: Text('Loan Requests',
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
                  'Buy Now Pay Later',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    if(ref.watch(sharedUtilityProvider).getUser()?.aadharVerify.toString()=="0"){
                      showVerificationDialog(context,
                          titleText: "Verify Aadhar",
                          messageText: "Your Aadhar verification is pending", action: () {
                            hideLoader(context);
                            context.goNamed(RoutesStrings.bnplAadharRegistrationHome);
                          });
                    }else{
                      context.goNamed(RoutesStrings.bnpl);

                    }

                  },
                  child: Text('Apply ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                // CupertinoActionSheetAction(
                //   onPressed: () {
                //     context.goNamed(RoutesStrings.bnplWithdraw);
                //   },
                //   child: Text('Withdraw ',
                //       textAlign: TextAlign.start,
                //       style: TextStyle(
                //           fontSize: Adaptive.sp(16),
                //           color: Colors.black,
                //           fontWeight: FontWeight.w500)),
                // ),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.bnplStatement);
                      // if(ref.watch(sharedUtilityProvider).getUser()?.aadharVerify.toString()=="0"){
                      //   showVerificationDialog(context,
                      //       titleText: "Verify Aadhar",
                      //       messageText: "Your Aadhar verification is pending", action: () {
                      //         hideLoader(context);
                      //         context.goNamed(RoutesStrings.bnplAadharRegistrationHome);
                      //       });
                      // }else{
                      //
                      //
                      // }

                      // if (ref.watch(sharedUtilityProvider).getUser()?.aadharVerify == "0") {
                      //   showVerificationDialog(context,
                      //       titleText: "Verify Aadhar",
                      //       messageText: "Your Aadhar verification is pending");
                      // }
                      // else{
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      //
                      // }
                    },
                    child: Text('Requests',
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
                  'Sanction Limit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    if((ref.watch(sharedUtilityProvider).getUser()?.triparty??[]).isEmpty){
                      showVerificationDialog(context,
                          titleText: "Verify Tri-Party Agreement",
                          messageText: "tri party agreement pending", action: () {
                            hideLoader(context);
                            context.goNamed(RoutesStrings.verfication);
                          });
                    }
                    else{
                      context.goNamed(RoutesStrings.applyForSanctionLimit);

                    }
                  },
                  child: Text('Sanction Limit Apply',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                CupertinoActionSheetAction(
                    onPressed: () {
                      if((ref.watch(sharedUtilityProvider).getUser()?.triparty??[]).isEmpty){
                        showVerificationDialog(context,
                            titleText: "Verify Tri-Party Agreement",
                            messageText: "tri party agreement pending", action: () {
                              hideLoader(context);
                              context.goNamed(RoutesStrings.verfication);
                            });
                      }
                      else{
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
                      context.goNamed(RoutesStrings.addMoney);
                    },
                    child: Text('Add Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),

                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.withdrawMoney);
                    },
                    child: Text('Withdraw Money',
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
                      await ref.watch(sharedPreferencesProvider).clear();
                      ref.watch(goRouterProvider).goNamed(RoutesStrings.login);
                      ref.watch(logoutProvider.future).then((value) async {});
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

  termsLayout(BuildContext context, WidgetRef ref, TermsModel data) =>
      showBarModalBottomSheet(
          context: context,
          expand: true,
          builder: (context) => Consumer(
              builder: (context, ref, child) => Padding(
                    padding: const Pad(all: 10),
                    child: ListView(
                      children: [
                        HtmlWidget(data.view ?? ""),
                        RowSuper(children: [
                          Checkbox(
                              value: ref.watch(checkBoxValueProvider),
                              onChanged: (value) {
                                ref
                                    .watch(checkBoxValueProvider.notifier)
                                    .state = value ?? false;
                              }),
                          Text(
                              'By proceeding, you agree to our Term and Conditions',
                              style: TextStyle(
                                  fontSize: Adaptive.sp(15),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (ref.watch(checkBoxValueProvider)) {
                                showloader(context);
                                ref
                                    .watch(bnplRequestProvider().future)
                                    .then((value) {
                                  hideLoader(context);
                                  if (value.status.toString() == "1") {
                                    hideLoader(context);
                                    successToast(
                                        context, value.message.toString());
                                  } else {
                                    context.pop();
                                    errorToast(
                                        context, value.message.toString());
                                  }
                                }).onError((e, s) {
                                  hideLoader(context);
                                  showErrorDialog(context,
                                      titleText: "Exception!",
                                      messageText: e.toString());
                                });
                              } else {
                                errorToast(
                                    context, 'Please agree to terms first');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.secondColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.white, blurRadius: 0.3)
                                  ],
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )));
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
