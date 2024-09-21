import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/home/home_screen.dart';

import '../../Data/Model/TermsModel.dart';
import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../Domain/BnplService/BnplService.dart';
import '../utils/colors.dart';
import '../utils/widgets.dart';

class Bnplscreen extends ConsumerStatefulWidget {
  const Bnplscreen({super.key});

  @override
  ConsumerState<Bnplscreen> createState() => _BnplscreenState();
}

class _BnplscreenState extends ConsumerState<Bnplscreen> {
  var checkBoxValueProvider = StateProvider((ref) => false);
  var bnplKey = GlobalKey<FormState>();
  final bnplController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy now pay later'),
      ),
      body: SafeArea(
          child: Form(
        key: bnplKey,
        child: Padding(
          padding: Pad(all: 10),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "BNPL Limit",
                  style: TextStyle(
                    fontSize: Adaptive.sp(18),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.rubik().fontFamily,
                  ),
                ),
              ),
              Center(
                child: Text(
                  currencyFormat.format(350000),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontSize: Adaptive.sp(24)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: bnplController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input valid amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Apply for limit",
                    label: const Text("Apply for limit"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (ref
                            .watch(sharedUtilityProvider)
                            .getUser()
                            ?.aadharVerify ==
                        "0") {
                      showVerificationDialog(context,
                          titleText: "Verify Aadhar",
                          messageText: "Your Aadhar verification is pending");
                    } else {
                      ref.watch(bnplTermsProvider.future).then((value) {
                        if (value.status.toString() == "1") {
                          termsLayout(context, ref, value);
                        } else {
                          showErrorDialog(context,
                              titleText: "Error!",
                              messageText: value.message ?? "");
                        }
                      }).onError((e, s) {
                        showErrorDialog(context,
                            titleText: "Error!",
                            messageText: e.toString() ?? "");
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Apply BNPL",
                    style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          const Shadow(color: Colors.white, blurRadius: 0.3)
                        ],
                        fontWeight: FontWeight.w700,
                        fontSize: Adaptive.sp(16)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: bnplController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input valid amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Apply for limit",
                    label: const Text("Apply for limit"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (ref
                        .watch(sharedUtilityProvider)
                        .getUser()
                        ?.aadharVerify ==
                        "0") {
                      showVerificationDialog(context,
                          titleText: "Verify Aadhar",
                          messageText: "Your Aadhar verification is pending");
                    } else {
                      ref.watch(bnplTermsProvider.future).then((value) {
                        if (value.status.toString() == "1") {
                          termsLayout(context, ref, value);
                        } else {
                          showErrorDialog(context,
                              titleText: "Error!",
                              messageText: value.message ?? "");
                        }
                      }).onError((e, s) {
                        showErrorDialog(context,
                            titleText: "Error!",
                            messageText: e.toString() ?? "");
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Apply BNPL",
                    style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          const Shadow(color: Colors.white, blurRadius: 0.3)
                        ],
                        fontWeight: FontWeight.w700,
                        fontSize: Adaptive.sp(16)),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: Pad(all: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorsConstant.secondColorSuperDark,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                          0,
                          0,
                          1,
                          2,
                          3
                        ],
                        colors: [
                          Colors.transparent.withOpacity(0.8),
                          ColorsConstant.primaryColor.withOpacity(0.8),
                          ColorsConstant.secondColorDark,
                          ColorsConstant.secondColorSuperDark,
                          ColorsConstant.primaryColor.withOpacity(0.8),
                        ])),
                child: ColumnSuper(children: [
                  Text(
                    'BNPL Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        shadows: const [
                          Shadow(color: Colors.black, blurRadius: 2.0),
                          Shadow(color: Colors.black, blurRadius: 2.0)
                        ],
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.rubik().fontFamily,
                        fontSize: Adaptive.sp(18)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RowSuper(fill: true, children: [
                    Text(
                      'Sanctioned Amount',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    ),
                    Text(
                      currencyFormat.format(200000),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  RowSuper(fill: true, children: [
                    Text(
                      'Hold Amount',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    ),
                    Text(
                      currencyFormat.format(170000),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  RowSuper(fill: true, children: [
                    Text(
                      'Used Amount',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    ),
                    Text(
                      currencyFormat.format(22000),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  RowSuper(fill: true, children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    ),
                    Text(
                      currencyFormat.format(8000),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.rubik().fontFamily,
                          fontSize: Adaptive.sp(17)),
                    )
                  ]),
                ]),
              ),
            ],
          ),
        ),
      )),
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
                                    .watch(bnplRequestProvider.future)
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
}
