import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/home/home_screen.dart';

import '../../../Domain/LoanService/LoanService.dart';
import '../../utils/LoaderUtils.dart';
import '../../utils/colors.dart';
import '../../utils/pdf.dart';
import '../../utils/widgets.dart';

class Totalloanamountscreen extends ConsumerWidget {
  const Totalloanamountscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loans Report'),
      ),
      body: SafeArea(child: totalLoanAmountLayout(ref, context)),
    );
  }

  totalLoanAmountLayout(WidgetRef ref, BuildContext context) => ListView(
        children: [
          Container(
            color: ColorsConstant.primaryColor.withOpacity(0.8),
            padding: const Pad(all: 10),
            child: IntrinsicHeight(
              child: Row(children: [
                Expanded(
                    child: Text(
                  "Drf No. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Disbursement Date ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Maturity Date ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Loan Amount.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Commodity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
              ]),
            ),
          ),
          ref.watch(totalLoanAmountProvider).when(
              data: (data) => (data.data ?? []).isEmpty
                  ? emptyData()
                  : ListView.builder(
                      itemCount: data.data?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        color: index % 2 == 0
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text.rich(
                              TextSpan(
                                text: "${data.data?[index].drfNo}",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            showCustomAlertDialog(
                                                context,
                                                ColumnSuper(children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text('Tenor:',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${data.data?[index].tenor}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text('Terminal:',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                        "${data.data?[index].terminal}",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14)),
                                                      )),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Gate Pass No.:',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${data.data?[index].gatePass}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Interest(%):',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${data.data?[index].interestRate}%",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Loan Amount:',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          currencyFormat.format(
                                                              double.parse(
                                                                  "${data.data?[index].loanAmount ?? 0.0}")),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Quantity(Qtl.):',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    Adaptive.sp(
                                                                        14))),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${data.data?[index].quantity}(Qtl.)",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        ref
                                                            .watch(drfLinkProvider(
                                                                    financeId:
                                                                        "${data.data?[index].financeId}")
                                                                .future)
                                                            .then((value) {
                                                          if (value['status']
                                                                  .toString() ==
                                                              "1") {
                                                            ref
                                                                .watch(downloadFileBGProvider(
                                                                        fileName:
                                                                            "drf_${data.data?[index].drfNo}",
                                                                        url:
                                                                            "${value['data']}")
                                                                    .future)
                                                                .then((file) {
                                                              if (file !=
                                                                  null) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                successToast(
                                                                    context,
                                                                    "File Downloaded Successfully");
                                                              } else {}
                                                            });
                                                          }
                                                        });
                                                      },
                                                      child: Text.rich(
                                                        TextSpan(
                                                            text:
                                                                "Download DRF"),
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14)),
                                                      ))
                                                ]),
                                                "Loan Details"));
                                  },
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${data.data?[index].disbursementDate}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            Expanded(
                                child: Text(
                              "${data.data?[index].maturityDate}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              currencyFormat.format(double.parse(
                                  "${data.data?[index].loanAmount ?? 0.0}")),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${data.data?[index].commodity}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                          ]),
                        ),
                      ),
                    ),
              error: (e, s) => Container(),
              loading: () => expiredLoansShimmer())
        ],
      );
}
