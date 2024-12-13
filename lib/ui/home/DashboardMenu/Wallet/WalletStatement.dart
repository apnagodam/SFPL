import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/WalletService/WalletService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../../Data/SharedPrefs/SharedUtility.dart';

class Walletstatement extends ConsumerStatefulWidget {
  const Walletstatement({super.key});

  @override
  ConsumerState<Walletstatement> createState() => _WalletstatementState();
}

class _WalletstatementState extends ConsumerState<Walletstatement> {
  var startDate = StateProvider<DateTime?>((ref) => null);
  var endDate = StateProvider<DateTime?>((ref) => null);
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Statement'),
      ),
      body: ListView(
        padding: Pad(all: 10),
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Wallet Balance",
              style: TextStyle(
                  shadows: const [
                    Shadow(color: Colors.black, blurRadius: 1.0),
                    Shadow(color: Colors.black, blurRadius: 1.0)
                  ],
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  fontSize: Adaptive.sp(18),
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
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
                  color: Colors.black),
            ),
          ),
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
                    if (picked!.isAfter(ref.watch(endDate) ?? DateTime.now())) {
                      errorToast(context, 'Start Date cant be after end Date');
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
              .watch(walletStatementProvider(
                  pastDate:
                      format.format(ref.watch(startDate) ?? DateTime.now()),
                  currentDate:
                      format.format(ref.watch(endDate) ?? DateTime.now())))
              .when(
                  data: (statementData) => (statementData.data ?? []).isEmpty
                      ? emptyData()
                      : ListView.builder(
                          itemCount: statementData.data?.length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                                color: Colors.white,
                                margin: Pad(top: 10, bottom: 10),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: statementData.data?[index].type.toString().toLowerCase()=="debit"?Colors.red:Colors.green),
                                    borderRadius: BorderRadius.circular(10)),
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding: Pad(all: 10),
                                  child: ColumnSuper(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "${statementData.data?[index].label}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(18),
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ]),
                                    Divider(
                                      color:  statementData.data?[index].type.toString().toLowerCase()=="debit"?Colors.red:Colors.green,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Narration",
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Amount",
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Text(
                                        "${statementData.data?[index].type.toString().toLowerCase()=="debit"?"-":"+"} ${currencyFormat.format(double.tryParse("${statementData.data?[index].amount ?? 0}"))}",
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold,
                                            color: statementData.data?[index].type.toString().toLowerCase()=="debit"?Colors.red:Colors.green),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Balance",
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Text(
                                        "${currencyFormat.format(double.tryParse("${statementData.data?[index].balance ?? 0}"))}",
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: Text(
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
                                            fontWeight: FontWeight.bold
                                        ,color: statementData.data?[index].type.toString().toLowerCase()=="debit"?Colors.red:Colors.green),
                                      )
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Date",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Text(
                                        "${DateFormat('dd-MMMM-yyyy').format(DateTime.parse(statementData.data?[index].date))}",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])
                                  ]),
                                ),
                              )),
                  error: (e, s) => Container(),
                  loading: () => Center(
                        child: defaultLoader(),
                      ))
        ],
      ),
    );
  }
}
