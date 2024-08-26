import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/WalletService/WalletService.dart';

import '../../../utils/colors.dart';
import '../../home_screen.dart';

class Moneyrequest extends ConsumerStatefulWidget {
  const Moneyrequest({super.key});

  @override
  ConsumerState<Moneyrequest> createState() => _MoneyrequestState();
}

class _MoneyrequestState extends ConsumerState<Moneyrequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money Requests'),
      ),
      body: ListView(
        children: [
          ref.watch(moneyRequestListProvider).when(
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
                              '${appliedData?.uniqueLoanReqNo}',
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
                                'Payment Type',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.paymentType}',
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
                                'Requested Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${currencyFormat.format(int.parse(appliedData?.appliedAmount ?? "0"))}',
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
                                'Received Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${currencyFormat.format(int.parse(appliedData?.recivedAmount ?? "0"))}',
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
                                '${appliedData?.updatedAt ?? "--"}',
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
