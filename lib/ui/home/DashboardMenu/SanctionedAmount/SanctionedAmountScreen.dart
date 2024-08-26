import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/home/home_screen.dart';

import '../../../utils/colors.dart';

class Sanctionedamountscreen extends ConsumerStatefulWidget {
  const Sanctionedamountscreen({super.key});

  @override
  ConsumerState<Sanctionedamountscreen> createState() =>
      _SanctionedamountscreenState();
}

class _SanctionedamountscreenState
    extends ConsumerState<Sanctionedamountscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanctioned Amount'),
      ),
      body: ListView(
        children: [
          ref.watch(appliedListProvider).when(
              data: (data) => ListView.builder(
                    itemCount: data.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var appliedData = data.data?[index];
                      return Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 2,
                              color: appliedData?.status == "0"
                                  ? Colors.red
                                  : appliedData?.status == "1"
                                      ? ColorsConstant.secondColorUltraDark
                                      : appliedData?.status == "2"
                                          ? ColorsConstant.primaryColor
                                          : appliedData?.status == "3"
                                              ? ColorsConstant
                                                  .secondColorUltraDark
                                              : ColorsConstant
                                                  .secondColorUltraDark,
                            )),
                        elevation: 6,
                        color: Colors.white,
                        margin: Pad(all: 10),
                        child: Padding(
                          padding: const Pad(all: 10),
                          child: ColumnSuper(children: [
                            Text(
                              '${appliedData?.uniqueId}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: Adaptive.sp(18),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Scheme Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.schemeName}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Interest Rate',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.interestRate}%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Processing Fee',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.processingFee}%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Loan per Total Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.ltp}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Requested Amount(Lakh)	',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${currencyFormat.format(int.parse(appliedData?.requestedAmount ?? "0"))}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Approved Amount(Lakh)		',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${currencyFormat.format(int.parse(appliedData?.approvedAmount ?? "0"))}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Request Date',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.verifiedDate ?? "--"}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            TextOneLine(
                                'Status: ${appliedData?.status == "0" ? "Rejected" : appliedData?.status == "1" ? "Pending" : appliedData?.status == "2" ? "Approved" : appliedData?.status == "3" ? "Pending Approval" : "--"}',
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    color: appliedData?.status == "0"
                                        ? Colors.red
                                        : appliedData?.status == "1"
                                            ? ColorsConstant
                                                .secondColorUltraDark
                                            : appliedData?.status == "2"
                                                ? ColorsConstant.primaryColor
                                                : appliedData?.status == "3"
                                                    ? ColorsConstant
                                                        .secondColorUltraDark
                                                    : ColorsConstant
                                                        .secondColorUltraDark,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      );
                    },
                  ),
              error: (e, s) => Text(e.toString()),
              loading: () => const CupertinoActivityIndicator()),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
