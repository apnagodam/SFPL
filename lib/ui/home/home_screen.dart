import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:tab_container/tab_container.dart';

import '../../Domain/BnplService/BnplService.dart';
import '../utils/widgets.dart';

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);
final flipController = FlipCardController();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

TabController? _controller;

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: Adaptive.sh(2),
          ),
          Padding(
            padding: Pad(all: 10),
            child: TabContainer(
              controller: _controller,
              borderRadius: BorderRadius.circular(20),
              tabEdge: TabEdge.top,
              curve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.2, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              colors: const <Color>[
                ColorsConstant.primaryColor,
                ColorsConstant.secondColorDark,
              ],
              selectedTextStyle: TextStyle(
                  color: Colors.white,
                  shadows: [const Shadow(color: Colors.white, blurRadius: 0.3)],
                  fontWeight: FontWeight.w700,
                  fontSize: Adaptive.sp(16)),
              unselectedTextStyle: TextStyle(
                  color: Colors.black,
                  shadows: [const Shadow(color: Colors.white, blurRadius: 0.3)],
                  fontWeight: FontWeight.w700,
                  fontSize: Adaptive.sp(16)),
              tabs: [
                Text(
                  'Wallet Balance',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: Adaptive.sp(16)),
                ),
                Text(
                  'BNPL Balance',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: Adaptive.sp(16)),
                ),
              ],
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const Pad(all: 10),
                    padding: const Pad(all: 25),
                    child: RowSuper(fill: true, children: [
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Text(
                          "Wallet Balance".toUpperCase(),
                          style: TextStyle(
                            shadows: const [
                              Shadow(color: Colors.black, blurRadius: 2.0),
                              Shadow(color: Colors.black, blurRadius: 2.0)
                            ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: Adaptive.sp(18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          currencyFormat.format(double.tryParse(
                              "${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}")),
                          style: TextStyle(
                              shadows: const [
                                Shadow(color: Colors.black, blurRadius: 2.0),
                                Shadow(color: Colors.black, blurRadius: 2.0)
                              ],
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontSize: Adaptive.sp(22),
                              color: Colors.white),
                        ),
                      ]),
                    ])),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const Pad(all: 10),
                    padding: const Pad(all: 25),
                    child: RowSuper(fill: true, children: [
                      ColumnSuper(alignment: Alignment.centerLeft, children: [
                        Text(
                          "BNPL Balance".toUpperCase(),
                          style: TextStyle(
                            shadows: const [
                              Shadow(color: Colors.black, blurRadius: 2.0),
                              Shadow(color: Colors.black, blurRadius: 2.0)
                            ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: Adaptive.sp(18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ref.watch(bnplPowerProvider).when(
                            data: (bnplData) => Text(
                                  currencyFormat.format(double.tryParse(
                                      "${bnplData.bnpl?.effectiveBalance ?? 0.0}")),
                                  style: TextStyle(
                                      shadows: const [
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 2.0),
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 2.0)
                                      ],
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.manrope().fontFamily,
                                      fontSize: Adaptive.sp(22),
                                      color: Colors.white),
                                ),
                            error: (e, s) => Container(),
                            loading: () => Center(
                                  child: CupertinoActivityIndicator(),
                                ))
                      ]),
                    ])),
              ],
            ),
          ),
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     margin: const Pad(all: 10),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //             color: ColorsConstant.secondColorSuperDark, width: 2),
          //         borderRadius: BorderRadius.circular(10),
          //         gradient: LinearGradient(
          //             begin: Alignment.topLeft,
          //             end: Alignment.bottomRight,
          //             stops: const [
          //               0,
          //               0,
          //               1,
          //               2,
          //               3
          //             ],
          //             colors: [
          //               Colors.transparent.withOpacity(0.8),
          //               ColorsConstant.primaryColor.withOpacity(0.8),
          //               ColorsConstant.secondColorDark,
          //               ColorsConstant.secondColorSuperDark,
          //               ColorsConstant.primaryColor.withOpacity(0.8),
          //             ])),
          //     padding: const Pad(all: 25),
          //     child: RowSuper(
          //         fill: true,
          //         children: [
          //           ColumnSuper(alignment: Alignment.centerLeft, children: [
          //             Text(
          //               "BNPL Limit".toUpperCase(),
          //               style: TextStyle(
          //                 shadows: const [
          //                   Shadow(color: Colors.black, blurRadius: 2.0),
          //                   Shadow(color: Colors.black, blurRadius: 2.0)
          //                 ],
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: Adaptive.sp(18),
          //               ),
          //             ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //             Text(
          //               "${currencyFormat.format(21000000.00)}",
          //               style: TextStyle(
          //                   shadows: const [
          //                     Shadow(color: Colors.black, blurRadius: 2.0),
          //                     Shadow(color: Colors.black, blurRadius: 2.0)
          //                   ],
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: GoogleFonts.manrope().fontFamily,
          //                   fontSize: Adaptive.sp(22),
          //                   color: Colors.white),
          //             ),
          //           ]),
          //           Center(
          //             child: IconButton(onPressed: (){
          //
          //               flipController.flipcard();
          //             }, icon: Icon(Icons.crop_rotate,color: Colors.white,)),
          //           )
          //         ])),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(LucideIcons.banknote, 'Commodity Wise Loan', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/loan-2014155-1711062.png?f=webp&w=256',
              callback: () {
            if ((ref.watch(sharedUtilityProvider).getUser()?.triparty ?? [])
                .isEmpty) {
              showVerificationDialog(context,
                  titleText: "Verify Tri-Party Agreement",
                  messageText: "tri party agreement pending", action: () {
                hideLoader(context);
                context.goNamed(RoutesStrings.verfication);
              });
            } else {
              context.goNamed(RoutesStrings.applyForCommodityLoan);
            }
          }),
          homeLayoutWidget(LucideIcons.hand_coins, 'BNPL', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/loan-82-1066968.png?f=webp&w=256',
              callback: () {
            if (ref
                    .watch(sharedUtilityProvider)
                    .getUser()
                    ?.aadharVerify
                    .toString() ==
                "0") {
              showVerificationDialog(context,
                  titleText: "Verify Aadhar",
                  messageText: "Your Aadhar verification is pending",
                  action: () {
                hideLoader(context);
                context.goNamed(RoutesStrings.bnplAadharRegistrationHome);
              });
            } else {
              context.goNamed(RoutesStrings.bnpl);
            }
          }),
          homeLayoutWidget(LucideIcons.hand_coins, 'Repayment', '0',
              imagePath:
                  'https://static.thenounproject.com/png/4814670-200.png',
              callback: () {
            context.goNamed(RoutesStrings.repayment);
          }),
          // homeLayoutWidget(LucideIcons.percent, 'Due Loans', '0',
          //     imagePath:
          //         'https://cdn.iconscout.com/icon/premium/png-512-thumb/due-date-10983830-8792274.png?f=webp&w=256'),
          // homeLayoutWidget(LucideIcons.workflow, 'M2M Shortfalls', '0',
          //     imagePath:
          //         'https://cdn.iconscout.com/icon/premium/png-512-thumb/trading-3256014-2712970.png?f=webp&w=256')
        ],
      )),
    );
  }

  homeLayoutWidget(IconData? iconData, String text, String number,
          {VoidCallback? callback, String? imagePath}) =>
      InkWell(
        onTap: callback,
        child: Card(
          color: Colors.white,
          margin: Pad(all: 10),
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorsConstant.secondColorSuperDark),
              borderRadius: BorderRadius.circular(10)),
          surfaceTintColor: Colors.white,
          child: Row(children: [
            Container(
              height: Adaptive.sw(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent.withOpacity(0.6),
                        ColorsConstant.primaryColor
                      ]),
                  color: ColorsConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: Pad(all: 20),
                  child: Image.network(
                    imagePath ?? "",
                    fit: BoxFit.contain,
                    width: 20,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Adaptive.sp(19)),
            )),
            // Container(
            //   padding: Pad(all: 10),
            //   height: Adaptive.sw(15),
            //   decoration: BoxDecoration(
            //       color: ColorsConstant.primaryColor,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(10),
            //           bottomRight: Radius.circular(10))),
            //   alignment: Alignment.center,
            //   child: Text(
            //     number,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: Adaptive.sp(20),
            //         color: Colors.white),
            //   ),
            // )
          ]),
        ),
      );
}
