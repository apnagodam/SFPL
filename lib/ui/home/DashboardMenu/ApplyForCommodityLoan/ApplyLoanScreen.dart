import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/LoanApplyListModel.dart';
import 'package:swfl/Data/Model/LoanRequestFormModel.dart';
import 'package:swfl/Domain/BnplService/BnplService.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/home/home_screen.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets.dart';

class Applyloanscreen extends ConsumerStatefulWidget {
  const Applyloanscreen({super.key});

  @override
  ConsumerState<Applyloanscreen> createState() => _ApplyloanscreenState();
}

class _ApplyloanscreenState extends ConsumerState<Applyloanscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Loan Apply"),
        titleTextStyle: TextStyle(
            color: ColorsConstant.primaryColor,
            fontSize: Adaptive.sp(18),
            fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            color: ColorsConstant.primaryColor.withOpacity(0.8),
            padding: const Pad(all: 10),
            child: IntrinsicHeight(
              child: Row(children: [
                Expanded(
                    child: Text(
                  "Gatepass",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Terminal ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Commodity ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Qty.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Stack No",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Bags",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
              ]),
            ),
          ),
          ref.watch(loanApplyListProvider).when(
              data: (data) => (data.data ?? []).isEmpty
                  ? emptyData()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            color: index % 2 == 0
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.white,
                            child: Padding(
                              padding: const Pad(all: 10),
                              child: IntrinsicHeight(
                                child: Row(children: [
                                  Expanded(
                                      child: Text.rich(
                                          TextSpan(
                                              text:
                                                  "${data.data?[index].gatePass ?? "0"}"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(12)))),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: Text.rich(
                                        TextSpan(
                                            text:
                                                "${data.data?[index].terminal}"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(12))),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text.rich(
                                    TextSpan(
                                        text: "${data.data?[index].commodity}"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(12)),
                                    textAlign: TextAlign.center,
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text.rich(
                                    TextSpan(
                                        text: "${data.data?[index].quantity}"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(12)),
                                    textAlign: TextAlign.center,
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text.rich(
                                          TextSpan(
                                              text:
                                                  "${data.data?[index].stackNumber ?? "0"}"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(12)))),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text.rich(
                                          TextSpan(
                                              text:
                                                  "${data.data?[index].bags ?? "0"}"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(12)))),
                                  const VerticalDivider(),
                                  data.data?[index].status
                                              .toString()
                                              .toLowerCase() ==
                                          "pending"
                                      ? const SizedBox()
                                      : Expanded(
                                          child: InkWell(
                                          onTap: () async {
                                            if (data.data?[index].loan
                                                    .toString()
                                                    .toLowerCase() ==
                                                "cancel request") {
                                              // ref.watch(
                                              //     cancelLoanRequestProvider(id:"${data.data?[index].financeId}")
                                              //         .future).then((value) {
                                              //   if (value['status'].toString() == "1") {
                                              //     ref.invalidate(loanApplyListProvider);
                                              //     successToast(context, value['message'].toString());
                                              //
                                              //   } else {
                                              //     errorToast(context, value['message'].toString());
                                              //   }
                                              // });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      StockApplyLoan(
                                                        data: data.data?[index],
                                                      ));
                                              // showBarModalBottomSheet(
                                              //     context: context,
                                              //     builder: (context) =>
                                              //        );
                                            }
                                          },
                                          child: Text(
                                            "${data.data?[index].loan.toString().toLowerCase() == "cancel request" ? "Applied" : data.data?[index].loan}",
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: data.data?[index].loan
                                                            .toString()
                                                            .toLowerCase() ==
                                                        "pending"
                                                    ? ColorsConstant
                                                        .secondaryColor
                                                    : data.data?[index].loan
                                                                .toString()
                                                                .toLowerCase() ==
                                                            "cancel request"
                                                        ? ColorsConstant
                                                            .secondaryColor
                                                        : ColorsConstant
                                                            .primaryColor,
                                                fontWeight: FontWeight.w700,
                                                decorationColor: data
                                                            .data?[index].loan
                                                            .toString()
                                                            .toLowerCase() ==
                                                        "pending"
                                                    ? ColorsConstant
                                                        .secondaryColor
                                                    : data.data?[index].loan
                                                                .toString()
                                                                .toLowerCase() ==
                                                            "cancel request"
                                                        ? Colors.red
                                                        : ColorsConstant
                                                            .primaryColor,
                                                fontSize: Adaptive.sp(14)),
                                          ),
                                        )),
                                ]),
                              ),
                            ),
                          )),
              error: (e, s) => emptyData(),
              loading: () => const CupertinoActivityIndicator())
        ],
      )),
    );
  }
}

class StockApplyLoan extends ConsumerStatefulWidget {
  const StockApplyLoan({super.key, required this.data});

  final Datum? data;

  @override
  ConsumerState<StockApplyLoan> createState() => _StockApplyLoanState();
}

class _StockApplyLoanState extends ConsumerState<StockApplyLoan> {
  var schemeActionProvider = StateProvider<String>((ref) => '');
  var checkBoxValueProvider = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(bnplPowerProvider).when(
          data: (bnplData) => ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back)),
                      CupertinoButton(
                          child: Text('Select Scheme',
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(17))),
                          onPressed: () async {})
                    ],
                  ),
                  Container(
                    padding: const Pad(all: 10),
                    color: ColorsConstant.secondColorDark,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            "Action",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Adaptive.sp(14),
                                shadows: const [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(0.2, 0.2))
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )),
                          Expanded(
                              child: Text(
                            "Scheme Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Adaptive.sp(14),
                                shadows: const [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(0.2, 0.2))
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )),
                          Expanded(
                              child: Text("Processing Fee(%)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(14),
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                            offset: Offset(0.2, 0.2))
                                      ],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800))),
                          Expanded(
                              child: Text("Interest Rate(%)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(14),
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                            offset: Offset(0.2, 0.2))
                                      ],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800))),
                          Expanded(
                              child: Text("Loan To Value(%)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(14),
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                            offset: Offset(0.2, 0.2))
                                      ],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800))),
                          Expanded(
                              child: Text("Tenor",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(13),
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                            offset: Offset(0.2, 0.2))
                                      ],
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800)))
                        ]),
                  ),
                  ref.watch(loanRequestFormProvider).when(
                      data: (data) => (data.data?.scheme ?? []).isEmpty
                          ? emptyData()
                          : ListView.builder(
                              itemCount: data.data?.scheme?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => (data
                                              .data?.scheme?[index].schemeName
                                              .toString()
                                              .toLowerCase()
                                              .trim() ==
                                          "bnpl takeover" &&
                                      num.parse(
                                              "${bnplData.bnpl?.utilizedLimit ?? 0}") <=
                                          0)
                                  ? SizedBox()
                                  : Container(
                                      color: index % 2 == 0
                                          ? Colors.grey.withOpacity(0.1)
                                          : Colors.white,
                                      child: Padding(
                                        padding: const Pad(all: 10),
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Radio<String?>(
                                                    activeColor: ColorsConstant
                                                        .primaryColor,
                                                    value: data
                                                        .data?.scheme?[index].id
                                                        .toString(),
                                                    groupValue: ref
                                                        .watch(
                                                            schemeActionProvider)
                                                        .toString(),
                                                    onChanged: (String? value) {
                                                      ref
                                                          .watch(
                                                              schemeActionProvider
                                                                  .notifier)
                                                          .state = value.toString();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Text(
                                                        data
                                                                .data
                                                                ?.scheme?[index]
                                                                .schemeName ??
                                                            "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                Adaptive.sp(15),
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .white,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0.2,
                                                                          0.2))
                                                            ],
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800))),
                                                Expanded(
                                                    child: Text(
                                                        data
                                                                .data
                                                                ?.scheme?[index]
                                                                .processingFee ??
                                                            "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                Adaptive.sp(15),
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .white,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0.2,
                                                                          0.2))
                                                            ],
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800))),
                                                Expanded(
                                                    child: Text(
                                                        data
                                                                .data
                                                                ?.scheme?[index]
                                                                .interestRate ??
                                                            "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                Adaptive.sp(15),
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .white,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0.2,
                                                                          0.2))
                                                            ],
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800))),
                                                Expanded(
                                                    child: Text(
                                                        data
                                                                .data
                                                                ?.scheme?[index]
                                                                .loanPerTotalAmount ??
                                                            "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                Adaptive.sp(15),
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .white,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0.2,
                                                                          0.2))
                                                            ],
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800))),
                                                Expanded(
                                                    child: Text(

                                                    "${data
                                                        .data
                                                        ?.scheme?[index]
                                                        .tenor ??""} ${data
                                                        .data
                                                        ?.scheme?[index]
                                                        .tenorType ??""}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                Adaptive.sp(15),
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .white,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0.2,
                                                                          0.2))
                                                            ],
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800)))
                                              ]),
                                          ref.watch(schemeActionProvider) !=
                                                  data.data?.scheme?[index].id
                                                      .toString()
                                              ? const SizedBox()
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child: LoanDetails(
                                                    data: widget.data,
                                                    schemeId: data
                                                        .data?.scheme?[index].id
                                                        .toString(),
                                                    loanData: data.data,
                                                  ),
                                                )
                                        ]),
                                      ),
                                    ),
                            ),
                      error: (e, s) => Container(),
                      loading: () => Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: defaultLoader(),
                              ),
                            ),
                          ))
                ],
              ),
          error: (e, s) => emptyData(),
          loading: () => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: defaultLoader(),
                ),
              )),
    );
  }
}

class LoanDetails extends ConsumerStatefulWidget {
  const LoanDetails(
      {super.key,
      required this.data,
      required this.schemeId,
      required this.loanData});

  final Datum? data;
  final String? schemeId;
  final Data? loanData;

  @override
  ConsumerState<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends ConsumerState<LoanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref
          .watch(loanDetailsProvider(
              inventoryId: "${widget.data?.inventoryId ?? "0"}",
              commodityName: "${widget.data?.commodity}",
              quantity: "${widget.data?.quantity}",
              gatePass: "${widget.data?.gatePass}",
              schemeId: "${widget.schemeId}",bags: "${widget.data?.bags??"0"}"))
          .when(
              data: (data) {
                return data.status.toString() == "0"
                    ? Center(
                        child: Text(
                          '${data.message}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: Adaptive.sp(18),
                              color: ColorsConstant.secondColorSuperDark),
                        ),
                      )
                    : ColumnSuper(alignment: Alignment.centerLeft, children: [

                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Market Rate: ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                                Text(
                                    '${currencyFormat.format(double.tryParse("${data.data?.marketPrice ?? "0"}"))} Qtl.',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                  const Divider(),
                  Padding(
                    padding: const Pad(all: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Quality Adjusted Market Rate:  ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(14),
                                  shadows: const [
                                    Shadow(
                                        color: Colors.white,
                                        blurRadius: 1,
                                        offset: Offset(0.2, 0.2))
                                  ],
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          Text('${data.data?.qualityMarketPrice ?? 0.0} Qtl.',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(14),
                                  shadows: const [
                                    Shadow(
                                        color: Colors.white,
                                        blurRadius: 1,
                                        offset: Offset(0.2, 0.2))
                                  ],
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                        ]),
                  ),
                        const Divider(),
                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Market Value: ${currencyFormat.format(double.tryParse("${data.data?.marketValue ?? 0.0}"))}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                                Text('LTV: ${data.data?.ltv ?? 0.0}%',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                  const Divider(),
                  Padding(
                    padding: const Pad(all: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Weight: ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(14),
                                  shadows: const [
                                    Shadow(
                                        color: Colors.white,
                                        blurRadius: 1,
                                        offset: Offset(0.2, 0.2))
                                  ],
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          Text(
                              '${data.data?.quantity ?? 0.0} Qtl.',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(14),
                                  shadows: const [
                                    Shadow(
                                        color: Colors.white,
                                        blurRadius: 1,
                                        offset: Offset(0.2, 0.2))
                                  ],
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                        ]),
                  ),
                        const Divider(),
                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Loan Amount: ${currencyFormat.format(double.tryParse("${data.data?.loanAmount ?? 0.0}"))}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                                ColumnSuper(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Text(
                                          'Processing Fee: ${data.data?.proccessingFessAmt ?? 0.0}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(14),
                                              shadows: const [
                                                Shadow(
                                                    color: Colors.white,
                                                    blurRadius: 1,
                                                    offset: Offset(0.2, 0.2))
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800)),
                                      Text(
                                          'CGST Fee: ${data.data?.cgstAmt ?? 0.0}',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(14),
                                              shadows: const [
                                                Shadow(
                                                    color: Colors.white,
                                                    blurRadius: 1,
                                                    offset: Offset(0.2, 0.2))
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800)),
                                      Text(
                                          'SGST Fee: ${data.data?.sgstAmt ?? 0.0}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(14),
                                              shadows: const [
                                                Shadow(
                                                    color: Colors.white,
                                                    blurRadius: 1,
                                                    offset: Offset(0.2, 0.2))
                                              ],
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800)),
                                    ]),
                              ]),
                        ),
                        const Divider(),
                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Net Payable Amount:',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                                Text(
                                    '${currencyFormat.format(double.tryParse("${data.data?.netPayableAmt ?? 0.0}"))}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                        const Divider(),
                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Bank: ${widget.loanData?.bankName ?? ""}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                                Text(
                                    'IFSC Code: ${widget.loanData?.ifscCode ?? ""}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                        Padding(
                          padding: const Pad(all: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Account Number: ${widget.loanData?.accountNumber ?? ""}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: Adaptive.sp(14),
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800)),
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              // inventory_id:16717
                              // commodity_name:Maize
                              // quantity:37.95
                              // gate_pass:17943
                              // scheme_id:1
                              // bank_name:UCO Bank
                              // ifsc:UCBA0002784
                              // account_no:27840210001226
                              // stack_number:6
                              // terminal:Mohan Cold Storage Pvt. Ltd.
                              showloader(context);
                              ref
                                  .watch(submitLoanRequestProvider(
                                          inventoryId:
                                              "${widget.data?.inventoryId}",
                                          commodityName:
                                              "${widget.data?.commodity}",
                                          quantity: "${widget.data?.quantity}",
                                          gatePass: "${widget.data?.gatePass}",
                                          schemeId: "${widget.schemeId}",
                                          bankName:
                                              "${widget.loanData?.bankName ?? ""}",
                                          ifscCode:
                                              "${widget.loanData?.ifscCode}",
                                          accountNo:
                                              "${widget.loanData?.accountNumber}",
                                          stackNo:
                                              "${widget.data?.stackNumber}",
                                          bags: "${widget.data?.bags}",
                                          terminalName:
                                              "${widget.data?.terminal}")
                                      .future)
                                  .then((value) {
                                    hideLoader(context);
                                if (value['status'].toString() == "1") {
                                  ref.invalidate(loanApplyListProvider);
                                  successToast(
                                      context, value['message'].toString());

                                  Navigator.of(context).pop();
                                } else {
                                  errorToast(
                                      context, value['message'].toString());
                                }
                              }).onError((e, s) {
                                hideLoader(context);

                                errorToast(context, e.toString());
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.primaryColor,
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
                                  fontSize: Adaptive.sp(12)),
                            ),
                          ),
                        )
                      ]);
              },
              error: (e, s) => Container(),
              loading: () => Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: defaultLoader(),
                      ),
                    ),
                  )),
    );
  }
}
