import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Domain/BnplService/BnplService.dart';
import '../home/home_screen.dart';
import '../utils/colors.dart';
import '../utils/widgets.dart';

class Bnpldebitstatement extends ConsumerStatefulWidget {
  const Bnpldebitstatement({super.key});

  @override
  ConsumerState<Bnpldebitstatement> createState() => _BnpldebitstatementState();
}

class _BnpldebitstatementState extends ConsumerState<Bnpldebitstatement> {
  var startDate = StateProvider<DateTime?>((ref) => null);
  var endDate = StateProvider<DateTime?>((ref) => null);
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BNPL Debit Statements'),
      ),
      body: Padding(
        padding: const Pad(all: 10),
        child: ListView(
          children: [
            ref.watch(bnplPowerProvider).when(
                data: (data) => Container(
                      padding: const Pad(all: 10),
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
                            'Original Limit',
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
                            currencyFormat.format(double.tryParse(
                                "${data.bnpl?.originalLimit ?? 0.0}")),
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
                            'Utilised Limit',
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
                            currencyFormat.format(double.tryParse(
                                "${data.bnpl?.utilizedLimit ?? 0.0}")),
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
                            'Available Limit',
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
                            currencyFormat.format(double.tryParse(
                                "${data.bnpl?.availableLimit ?? 0.0}")),
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
                            'Hold Limit',
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
                            currencyFormat.format(double.tryParse(
                                "${data.bnpl?.holdLimit ?? 0.0}")),
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
                            'Effective Balance',
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
                            currencyFormat.format(double.tryParse(
                                "${data.bnpl?.effectiveBalance ?? 0.0}")),
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
                error: (e, s) => Container(),
                loading: () => Container()),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Select Statement Date",
                style: TextStyle(
                  fontSize: Adaptive.sp(18),
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.rubik().fontFamily,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RowSuper(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime.now());

                    if (ref.watch(endDate) != null) {
                      if (picked!
                          .isAfter(ref.watch(endDate) ?? DateTime.now())) {
                        errorToast(
                            context, 'Start Date cant be after end Date');
                      } else {
                        ref.watch(startDate.notifier).state = picked;
                      }
                    } else {
                      ref.watch(startDate.notifier).state = picked;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    ref.watch(startDate) == null
                        ? "Select Start Date"
                        : format
                            .format(ref.watch(startDate) ?? DateTime(2024))
                            .toString(),
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
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime.now());

                    if (ref.watch(startDate) != null) {
                      if (picked!
                          .isBefore(ref.watch(startDate) ?? DateTime.now())) {
                        errorToast(
                            context, 'End date cant be before than start date');
                      } else {
                        ref.watch(endDate.notifier).state = picked;
                      }
                    } else {
                      ref.watch(endDate.notifier).state = picked;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    ref.watch(endDate) == null
                        ? "Select End Date"
                        : format
                            .format(ref.watch(endDate) ?? DateTime(2024))
                            .toString(),
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
            ]),
            ref
                .watch(bnplDebitStatementProvider(
                    pastDate:
                        format.format(ref.watch(startDate) ?? DateTime.now()),
                    currentDate:
                        format.format(ref.watch(endDate) ?? DateTime.now())))
                .when(
                    data: (statementData) =>(statementData.data??[]).isEmpty ?emptyData(): ListView.builder(
                        itemCount: statementData.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          color: Colors.white,
                          margin: Pad(top:10,bottom: 10 ),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorsConstant.secondColorSuperDark),
                              borderRadius: BorderRadius.circular(10)),
                          surfaceTintColor: Colors.white,
                              child: Padding(padding: Pad(all: 10),child: ColumnSuper(children: [
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(child: Text(
                                            "${statementData.data?[index].reference}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.bold),
                                          )),
                                         
                                        ]),
                                        SizedBox(height: 10,),
                                 Row(
                                      
                                        children: [
                                          Expanded(child: Text(
                                            "Type",
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )),
                                           Text(
                                           "${statementData.data?[index].narration}",
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          ),
                                         
                                        ]),
                                          SizedBox(height: 5,),
                                          Row(
                                      
                                        children: [
                                          Expanded(child: Text(
                                            "Amount",
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )),
                                           Text(
                                           "${currencyFormat.format(double.tryParse("${statementData.data?[index].amount??0}"))}",
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          ),
                                         
                                        ]),
                                        SizedBox(height: 5,),
                                          Row(
                                  
                                        children: [
                                          Expanded(child: Text(
                                            "Rate",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Text( 
                                            "${currencyFormat.format(double.tryParse("${statementData.data?[index].commodityPrice??0}"))} / ${statementData.data?[index].weight??0} Qtl.",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                        SizedBox(height: 5,),
                                        
                                         Row(
                                        children: [
                                          Expanded(child: Text(
                                            "Statement Type",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Text(
                                            "${statementData.data?[index].type ?? ""}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                         SizedBox(height: 5,),
                                    Row(
                                  
                                        children: [
                                          Expanded(child: Text(
                                            "Date",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )),
                                          Text(
                                            "${statementData.data?[index].date ?? ""}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ])
                              ]),),
                            )),
                    error: (e, s) => Container(),
                    loading: () =>  Center(
                          child: defaultLoader(),
                        ))
          ],
        ),
      ),
    );
  }
}
