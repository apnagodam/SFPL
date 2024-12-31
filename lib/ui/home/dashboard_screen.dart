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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callBack) {
      ref.watch(loginInfoProvider.future).then((data) {
        if (data.data?.isLogin != false) {
          if (data.data?.type == "BNPL" && data.data?.aadharVerify == "0") {
            showVerificationDialog(context,
                titleText: "Verify Aadhar",
                messageText: "Your Aadhar verification is pending", action: () {
              hideLoader(context);
              context.goNamed(RoutesStrings.bnplAadharRegistration);
            });
          }
          ref.watch(sharedUtilityProvider).setUser(data.data);
        } else {
          ref.watch(sharedPreferencesProvider).clear();
          context.go(RoutesStrings.login);
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
          backgroundColor: Colors.grey.shade100,
          child: SafeArea(
            child: ListView(
              padding: Pad(
                  left: 10,
                  right: 10,
                  top: MediaQuery.of(context).viewInsets.top),
              children: [
                InkWell(
                  onTap: () {
                    context.goNamed(RoutesStrings.profile);
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: Pad(all: 10),
                      child: Column(
                        children: [
                          roundedProfileImage(
                            imageUrl: ref
                                    .watch(sharedUtilityProvider)
                                    .getUser()
                                    ?.profileImage ??
                                "",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${ref.watch(sharedUtilityProvider).getUser()?.firmName}',
                            style: TextStyle(
                                fontSize: Adaptive.sp(16),
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '+91-${ref.watch(sharedUtilityProvider).getUser()?.phone}',
                            style: TextStyle(
                                fontSize: Adaptive.sp(14),
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                // CupertinoActionSheet(
                //   actions: [
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           context.goNamed(RoutesStrings.profile);
                //         },
                //         child: RowSuper(
                //           alignment: Alignment.centerLeft,
                //           children: [
                //             CircleAvatar(
                //               foregroundImage: NetworkImage(ref
                //                       .watch(sharedUtilityProvider)
                //                       .getUser()
                //                       ?.profileImage ??
                //                   ""),
                //             ),
                //             const SizedBox(
                //               width: 10,
                //             ),
                //             Text(
                //               '${ref.watch(sharedUtilityProvider).getUser()?.firmName}',
                //               style: TextStyle(
                //                   fontSize: Adaptive.sp(16),
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w700),
                //             )
                //           ],
                //         )),
                //   ],
                // ),
                // TapToExpand(
                //     backgroundcolor: Colors.white,
                //     outerClosedPadding: 0.0,
                //
                //     title: Text(
                //       'Sanctioned',
                //       style: TextStyle(
                //           fontSize: Adaptive.sp(16),
                //           color: Colors.black,
                //           fontWeight: FontWeight.w700),
                //     ),
                //     content: Column(
                //       children: [
                //         CupertinoActionSheetAction(
                //           onPressed: () {
                //             if ((ref.watch(sharedUtilityProvider).getUser()?.triparty ??
                //                 [])
                //                 .isEmpty) {
                //               showVerificationDialog(context,
                //                   titleText: "Verify Tri-Party Agreement",
                //                   messageText: "tri party agreement pending",
                //                   action: () {
                //                     hideLoader(context);
                //                     context.goNamed(RoutesStrings.verfication);
                //                   });
                //             } else {
                //               context.goNamed(RoutesStrings.applyForSanctionLimit);
                //             }
                //           },
                //           child: Text('Sanction Limit Apply',
                //               textAlign: TextAlign.start,
                //               style: TextStyle(
                //                   fontSize: Adaptive.sp(16),
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w500)),
                //         ),
                //         CupertinoActionSheetAction(
                //             onPressed: () {
                //               if ((ref
                //                   .watch(sharedUtilityProvider)
                //                   .getUser()
                //                   ?.triparty ??
                //                   [])
                //                   .isEmpty) {
                //                 showVerificationDialog(context,
                //                     titleText: "Verify Tri-Party Agreement",
                //                     messageText: "tri party agreement pending",
                //                     action: () {
                //                       hideLoader(context);
                //                       context.goNamed(RoutesStrings.verfication);
                //                     });
                //               } else {
                //                 context.goNamed(RoutesStrings.sanctionedAmount);
                //               }
                //             },
                //             child: Text('Sanctioned Amount',
                //                 textAlign: TextAlign.start,
                //                 style: TextStyle(
                //                     fontSize: Adaptive.sp(16),
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.w500))),
                //       ],
                //     )),

                if (int.parse(
                        '${ref.watch(sharedUtilityProvider).getUser()?.partnerDirectorCount ?? 0}') >
                    0)
                  SizedBox(
                    height: 10,
                  ),
                if (int.parse(
                        '${ref.watch(sharedUtilityProvider).getUser()?.partnerDirectorCount ?? 0}') >
                    0)
                  Visibility(
                      visible: (int.parse(
                                  '${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                              4 ||
                          int.parse(
                                  '${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                              3),
                      child: ExpansionTile(
                        title: Center(
                          child: Text(
                            int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                    4
                                ? 'Directors'
                                : int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                        3
                                    ? "Partners"
                                    : "",
                            style: TextStyle(
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: ColorsConstant.primaryColor)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: ColorsConstant.secondColorUltraDark)),
                        children: [
                          Divider(),
                          ListTile(
                              onTap: () {
                                context.goNamed(
                                    RoutesStrings.directorPartnersList);
                              },
                              title: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                              4
                                          ? 'Directors List'
                                          : int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                                  3
                                              ? "Partners List"
                                              : "",
                                      style: TextStyle(
                                          fontSize: Adaptive.sp(16),
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              )),
                          Divider(),
                          ListTile(
                              onTap: () {
                                context.goNamed(
                                    RoutesStrings.authorisationLetterScreen);
                              },
                              title: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                              4
                                          ? 'Directors Authorization'
                                          : int.parse('${ref.watch(sharedUtilityProvider).getUser()?.constitution ?? 0}') ==
                                                  3
                                              ? "Partners Authorization"
                                              : "",
                                      style: TextStyle(
                                          fontSize: Adaptive.sp(16),
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      )),

                SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  title: Center(
                    child: Text(
                      'Sanction',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:
                          const BorderSide(color: ColorsConstant.primaryColor)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: ColorsConstant.secondColorUltraDark)),
                  children: [
                    Divider(),
                    ListTile(
                        onTap: () {
                          if ((ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.triparty ??
                                  [])
                              .isEmpty) {
                            showVerificationDialog(context,
                                titleText: "Verify Tri-Party Agreement",
                                messageText: "tri party agreement pending",
                                action: () {
                              hideLoader(context);
                              context.goNamed(RoutesStrings.verfication);
                            });
                          } else {
                            context
                                .goNamed(RoutesStrings.applyForSanctionLimit);
                          }
                        },
                        title: Center(
                          child: Text('Apply',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                    Divider(),
                    ListTile(
                        onTap: () {
                          if ((ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.triparty ??
                                  [])
                              .isEmpty) {
                            showVerificationDialog(context,
                                titleText: "Verify Tri-Party Agreement",
                                messageText: "tri party agreement pending",
                                action: () {
                              hideLoader(context);
                              context.goNamed(RoutesStrings.verfication);
                            });
                          } else {
                            context.goNamed(RoutesStrings.sanctionedAmount);
                          }
                        },
                        title: Center(
                          child: Text('Requests',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                    Divider(),
                    ListTile(
                        onTap: () {
                          if ((ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.triparty ??
                                  [])
                              .isEmpty) {
                            showVerificationDialog(context,
                                titleText: "Verify Tri-Party Agreement",
                                messageText: "tri party agreement pending",
                                action: () {
                              hideLoader(context);
                              context.goNamed(RoutesStrings.verfication);
                            });
                          } else {
                            context.goNamed(RoutesStrings.holdStatement);
                          }
                        },
                        title: Center(
                          child: Text('Hold Statement',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                ExpansionTile(
                  title: Center(
                    child: Text(
                      'Disbursement',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:
                          const BorderSide(color: ColorsConstant.primaryColor)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: ColorsConstant.secondColorUltraDark)),
                  children: [
                    Divider(),
                    ListTile(
                      onTap: () {
                        if ((ref
                                    .watch(sharedUtilityProvider)
                                    .getUser()
                                    ?.triparty ??
                                [])
                            .isEmpty) {
                          showVerificationDialog(context,
                              titleText: "Verify Tri-Party Agreement",
                              messageText: "tri party agreement pending",
                              action: () {
                            hideLoader(context);
                            context.goNamed(RoutesStrings.verfication);
                          });
                        } else {
                          context.goNamed(RoutesStrings.applyForCommodityLoan);
                        }
                      },
                      title: Center(
                        child: Text('Apply ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: Adaptive.sp(16),
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
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
                    Divider(),

                    ListTile(
                        onTap: () {
                          if ((ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.triparty ??
                                  [])
                              .isEmpty) {
                            showVerificationDialog(context,
                                titleText: "Verify Tri-Party Agreement",
                                messageText: "tri party agreement pending",
                                action: () {
                              hideLoader(context);
                              context.goNamed(RoutesStrings.verfication);
                            });
                          } else {
                            context.goNamed(RoutesStrings.appliedLoanList);
                          }

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
                        title: Center(
                          child: Text('Requests',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  title: Center(
                    child: Text(
                      'Wallet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:
                          const BorderSide(color: ColorsConstant.primaryColor)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: ColorsConstant.secondColorUltraDark)),
                  children: [
                    Divider(),
                    ListTile(
                        onTap: () {
                          context.goNamed(RoutesStrings.addMoney);
                        },
                        title: Center(
                          child: Text('Add Money',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                    Divider(),
                    ListTile(
                        onTap: () {
                          context.goNamed(RoutesStrings.withdrawMoney);
                        },
                        title: Center(
                          child: Text('Withdraw Money',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                    Divider(),
                    ListTile(
                        onTap: () {
                          context.goNamed(RoutesStrings.walletStatement);
                        },
                        title: Center(
                          child: Text('Wallet Statement',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )),
                  ],
                ),
                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Sanctioned Amount',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //     CupertinoActionSheetAction(
                //       onPressed: () {
                //         if ((ref.watch(sharedUtilityProvider).getUser()?.triparty ??
                //                 [])
                //             .isEmpty) {
                //           showVerificationDialog(context,
                //               titleText: "Verify Tri-Party Agreement",
                //               messageText: "tri party agreement pending",
                //               action: () {
                //             hideLoader(context);
                //             context.goNamed(RoutesStrings.verfication);
                //           });
                //         } else {
                //           context.goNamed(RoutesStrings.applyForSanctionLimit);
                //         }
                //       },
                //       child: Text('Apply',
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //               fontSize: Adaptive.sp(16),
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500)),
                //     ),
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           if ((ref
                //                       .watch(sharedUtilityProvider)
                //                       .getUser()
                //                       ?.triparty ??
                //                   [])
                //               .isEmpty) {
                //             showVerificationDialog(context,
                //                 titleText: "Verify Tri-Party Agreement",
                //                 messageText: "tri party agreement pending",
                //                 action: () {
                //               hideLoader(context);
                //               context.goNamed(RoutesStrings.verfication);
                //             });
                //           } else {
                //             context.goNamed(RoutesStrings.sanctionedAmount);
                //           }
                //         },
                //         child: Text('Requests',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //   ],
                // ),
                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Disbursement Amount',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //     CupertinoActionSheetAction(
                //       onPressed: () {
                //         if ((ref.watch(sharedUtilityProvider).getUser()?.triparty ??
                //                 [])
                //             .isEmpty) {
                //           showVerificationDialog(context,
                //               titleText: "Verify Tri-Party Agreement",
                //               messageText: "tri party agreement pending",
                //               action: () {
                //             hideLoader(context);
                //             context.goNamed(RoutesStrings.verfication);
                //           });
                //         } else {
                //           context.goNamed(RoutesStrings.applyForCommodityLoan);
                //         }
                //       },
                //       child: Text('Apply ',
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //               fontSize: Adaptive.sp(16),
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500)),
                //     ),
                //     // CupertinoActionSheetAction(
                //     //   onPressed: () {
                //     //     context.goNamed(RoutesStrings.bnplWithdraw);
                //     //   },
                //     //   child: Text('Withdraw ',
                //     //       textAlign: TextAlign.start,
                //     //       style: TextStyle(
                //     //           fontSize: Adaptive.sp(16),
                //     //           color: Colors.black,
                //     //           fontWeight: FontWeight.w500)),
                //     // ),
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           if ((ref
                //                       .watch(sharedUtilityProvider)
                //                       .getUser()
                //                       ?.triparty ??
                //                   [])
                //               .isEmpty) {
                //             showVerificationDialog(context,
                //                 titleText: "Verify Tri-Party Agreement",
                //                 messageText: "tri party agreement pending",
                //                 action: () {
                //               hideLoader(context);
                //               context.goNamed(RoutesStrings.verfication);
                //             });
                //           } else {
                //             context.goNamed(RoutesStrings.appliedLoanList);
                //           }
                //
                //           // if(ref.watch(sharedUtilityProvider).getUser()?.aadharVerify.toString()=="0"){
                //           //   showVerificationDialog(context,
                //           //       titleText: "Verify Aadhar",
                //           //       messageText: "Your Aadhar verification is pending", action: () {
                //           //         hideLoader(context);
                //           //         context.goNamed(RoutesStrings.bnplAadharRegistrationHome);
                //           //       });
                //           // }else{
                //           //
                //           //
                //           // }
                //
                //           // if (ref.watch(sharedUtilityProvider).getUser()?.aadharVerify == "0") {
                //           //   showVerificationDialog(context,
                //           //       titleText: "Verify Aadhar",
                //           //       messageText: "Your Aadhar verification is pending");
                //           // }
                //           // else{
                //           //   context.goNamed(RoutesStrings.sanctionedAmount);
                //           //
                //           // }
                //         },
                //         child: Text('Requests',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //   ],
                // ),

                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Commodity Pledge Loan',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //
                //   ],
                // ),
                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Buy Now Pay Later',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //     CupertinoActionSheetAction(
                //       onPressed: () {
                //         if (ref
                //                 .watch(sharedUtilityProvider)
                //                 .getUser()
                //                 ?.aadharVerify
                //                 .toString() ==
                //             "0") {
                //           showVerificationDialog(context,
                //               titleText: "Verify Aadhar",
                //               messageText: "Your Aadhar verification is pending",
                //               action: () {
                //             hideLoader(context);
                //             context
                //                 .goNamed(RoutesStrings.bnplAadharRegistrationHome);
                //           });
                //         } else {
                //           context.goNamed(RoutesStrings.bnpl);
                //         }
                //       },
                //       child: Text('Apply ',
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //               fontSize: Adaptive.sp(16),
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500)),
                //     ),
                //     // CupertinoActionSheetAction(
                //     //   onPressed: () {
                //     //     context.goNamed(RoutesStrings.bnplWithdraw);
                //     //   },
                //     //   child: Text('Withdraw ',
                //     //       textAlign: TextAlign.start,
                //     //       style: TextStyle(
                //     //           fontSize: Adaptive.sp(16),
                //     //           color: Colors.black,
                //     //           fontWeight: FontWeight.w500)),
                //     // ),
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           if (ref
                //                   .watch(sharedUtilityProvider)
                //                   .getUser()
                //                   ?.aadharVerify
                //                   .toString() ==
                //               "0") {
                //             showVerificationDialog(context,
                //                 titleText: "Verify Aadhar",
                //                 messageText: "Your Aadhar verification is pending",
                //                 action: () {
                //               hideLoader(context);
                //               context.goNamed(
                //                   RoutesStrings.bnplAadharRegistrationHome);
                //             });
                //           } else {
                //             context.goNamed(RoutesStrings.bnplRequests);
                //           }
                //         },
                //         child: Text('Requests',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           if (ref
                //                   .watch(sharedUtilityProvider)
                //                   .getUser()
                //                   ?.aadharVerify
                //                   .toString() ==
                //               "0") {
                //             showVerificationDialog(context,
                //                 titleText: "Verify Aadhar",
                //                 messageText: "Your Aadhar verification is pending",
                //                 action: () {
                //               hideLoader(context);
                //               context.goNamed(
                //                   RoutesStrings.bnplAadharRegistrationHome);
                //             });
                //           } else {
                //             context.goNamed(RoutesStrings.bnplStatement);
                //           }
                //         },
                //         child: Text('Hold Statement',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),

                //   ],
                // ),
                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Sanction Limit',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //     CupertinoActionSheetAction(
                //       onPressed: () {
                //         if ((ref.watch(sharedUtilityProvider).getUser()?.triparty ??
                //                 [])
                //             .isEmpty) {
                //           showVerificationDialog(context,
                //               titleText: "Verify Tri-Party Agreement",
                //               messageText: "tri party agreement pending",
                //               action: () {
                //             hideLoader(context);
                //             context.goNamed(RoutesStrings.verfication);
                //           });
                //         } else {
                //           context.goNamed(RoutesStrings.applyForSanctionLimit);
                //         }
                //       },
                //       child: Text('Sanction Limit Apply',
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //               fontSize: Adaptive.sp(16),
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500)),
                //     ),
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           if ((ref
                //                       .watch(sharedUtilityProvider)
                //                       .getUser()
                //                       ?.triparty ??
                //                   [])
                //               .isEmpty) {
                //             showVerificationDialog(context,
                //                 titleText: "Verify Tri-Party Agreement",
                //                 messageText: "tri party agreement pending",
                //                 action: () {
                //               hideLoader(context);
                //               context.goNamed(RoutesStrings.verfication);
                //             });
                //           } else {
                //             context.goNamed(RoutesStrings.sanctionedAmount);
                //           }
                //         },
                //         child: Text('Sanctioned Amount',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //   ],
                // ),
                // CupertinoActionSheet(
                //   title: Center(
                //     child: Text(
                //       'Wallet',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
                //     ),
                //   ),
                //   actions: [
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           context.goNamed(RoutesStrings.addMoney);
                //         },
                //         child: Text('Add Money',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //     CupertinoActionSheetAction(
                //         onPressed: () {
                //           context.goNamed(RoutesStrings.withdrawMoney);
                //         },
                //         child: Text('Withdraw Money',
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontSize: Adaptive.sp(16),
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500))),
                //     // CupertinoActionSheetAction(
                //     //     onPressed: () {
                //     //       context.goNamed(RoutesStrings.walletStatement);
                //     //     },
                //     //     child: Text('Wallet Statement',
                //     //         textAlign: TextAlign.start,
                //     //         style: TextStyle(
                //     //             fontSize: Adaptive.sp(16),
                //     //             color: Colors.black,
                //     //             fontWeight: FontWeight.w500))),
                //   ],
                // ),
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () async {
                          showLogoutDialog(context, () async {
                            await ref.watch(sharedPreferencesProvider).clear();
                            ref
                                .watch(goRouterProvider)
                                .goNamed(RoutesStrings.login);
                            ref
                                .watch(logoutProvider.future)
                                .then((value) async {});

                            hideLoader(context);
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
          )),
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
