import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/BnplService/BnplService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/widgets.dart';

class BnplRequests extends ConsumerStatefulWidget {
  const BnplRequests({super.key});

  @override
  ConsumerState<BnplRequests> createState() => _BnplRequestsState();
}

class _BnplRequestsState extends ConsumerState<BnplRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BNPL Requests'),
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
                  "Unique Id",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Approved ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Requested ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "interest",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
              ]),
            ),
          ),
          ref.watch(bnplListProvider).when(
              data: (data) =>
              
              (data.data??[]).isEmpty?emptyData():
               ListView.builder(
                    itemCount: data.data?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                                            "${data.data?[index].uniqueId ?? "0"}"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14)))),
                            const VerticalDivider(),
                            Expanded(
                              child: Text.rich(
                                  TextSpan(
                                      text:
                                          currencyFormat.format(double.parse("${data.data?[index].approvedAmount ?? "0"}"))),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Adaptive.sp(14))),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Text.rich(
                              TextSpan(
                                  text:
                                      currencyFormat.format(double.parse("${data.data?[index].requestedAmount ?? "0"}"))),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                              textAlign: TextAlign.center,
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text.rich(
                                    TextSpan(
                                        text:
                                            "${data.data?[index].interestRate ?? "0"}%"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14)))),
                            const VerticalDivider(),
                            Expanded(
                                child: Text.rich(
                                    TextSpan(
                                        text:
                                            data.data?[index].status.toString() == "3" ? "Approved" : data.data?[index].status.toString() == "0" ? "Rejected" : "Pending"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: data.data?[index].status.toString() == "3"
                                            ? ColorsConstant.primaryColor
                                            : data.data?[index].status.toString() == "0"
                                                ? Colors.red
                                                : ColorsConstant.secondColorDark,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14)))),
                          ]),
                        ),
                      ),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () =>  Center(
                child: defaultLoader(),
              )),
        ],
      )),
    );
  }
}
