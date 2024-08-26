import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
      body: ref.watch(moneyRequestListProvider).when(
          data: (data) =>    ListView(
            children: [
              FittedBox(
                child: DataTable(
                    headingRowColor: MaterialStateProperty.resolveWith(
                            (states) => ColorsConstant.primaryColor),
                    showBottomBorder: true,
                    columnSpacing: 10,
                    dataRowMaxHeight: 80,
                    border: TableBorder.all(color: Colors.grey),
                    columns: [
                      DataColumn(
                        label: Center(
                            child: Text(
                              "S.No.",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(18)),
                            )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                              "Requested Amount",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(18)),
                            )),
                      ),
                      DataColumn(
                          label: Center(
                              child: Text(
                                "Approved Amount",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: Adaptive.sp(18)),
                              ))),
                      DataColumn(
                          label: Center(
                            child: Text(
                              "Requested Date",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(18)),
                            ),
                          )),
                      DataColumn(
                          label: Center(
                            child: Text(
                              "Status",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: Adaptive.sp(18)),
                            ),
                          ))
                    ],
                    rows: List.generate(
                        data.data?.length ?? 0,
                            (index) => DataRow(
                            color: MaterialStateProperty.resolveWith(
                                    (states) {
                                  if (index % 2 == 0) {
                                    return Colors.white;
                                  } else
                                    return Colors.grey.withOpacity(0.3);
                                }),
                            cells: [
                              DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: Adaptive.sp(18)),
                                ),
                              )),
                              DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${data.data?[index].appliedAmount ?? "0"} ₹",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: Adaptive.sp(18)),
                                ),
                              )),
                              DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${data.data?[index].recivedAmount ?? "0"} ₹",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: Adaptive.sp(18)),
                                ),
                              )),
                              DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  DateFormat('dd/MMM/yyyy').format(
                                      DateTime.parse(
                                          "${data.data?[index].createdAt ?? ""}")),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: Adaptive.sp(18)),
                                ),
                              )),
                              DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                    data.data?[index].status == "0"
                                        ? "Rejected"
                                        : data.data?[index].status ==
                                        "2"
                                        ? "Approved"
                                        : data.data?[index]
                                        .status ==
                                        "3"
                                        ? "Verified"
                                        : "Requested",
                                    style: TextStyle(
                                      color: data.data?[index].status ==
                                          "0"
                                          ? Colors.red
                                          : data.data?[index].status ==
                                          "3"
                                          ? ColorsConstant
                                          .primaryColor
                                          : data.data?[index]
                                          .status ==
                                          "2"
                                          ? Colors.blue
                                          : Colors.orange,
                                      fontSize: Adaptive.sp(18),
                                      fontWeight: FontWeight.bold,
                                    )),
                              ))
                            ]))),
              ),
              // Container(
              //     height: 50,
              //     // alignment: Alignment.topCenter,
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     decoration: const BoxDecoration(
              //       color: ColorConstant.maingreen,
              //     ),
              //     child: IntrinsicHeight(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Expanded(
              //             child: Text(
              //               "request_amountty".tr,
              //               maxLines: 2,
              //               style: AppStyle.wallatmoneylist,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //           VerticalDivider(
              //             color: Colors.white,
              //             width: 5,
              //             thickness: 2,
              //           ),
              //           Expanded(
              //             child: Text(
              //               "approved_amountty".tr,
              //               maxLines: 2,
              //               style: AppStyle.wallatmoneylist,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //           VerticalDivider(
              //             color: Colors.white,
              //             width: 5,
              //             thickness: 2,
              //           ),
              //           Expanded(
              //             child: Text(
              //               "requset_date_loan".tr,
              //               maxLines: 2,
              //               style: AppStyle.wallatmoneylist,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //           VerticalDivider(
              //             color: Colors.white,
              //             width: 5,
              //             thickness: 2,
              //           ),
              //           Expanded(
              //             child: Text(
              //               "status".tr,
              //               maxLines: 2,
              //               style: AppStyle.wallatmoneylist,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ],
              //       ),
              //     )),
              // cont.withdrawllist.isEmpty
              //     ? Expanded(
              //         child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Center(
              //           child: Text(
              //             "nodata_found".tr,
              //             style: TextStyle(
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.w500,
              //                 fontFamily: 'Roboto',
              //                 color: Colors.black),
              //           ),
              //         ),
              //       ))
              //     : Expanded(
              //         child: ListView.builder(
              //             itemCount: cont.withdrawllist.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               var date = DateFormat('dd/MMM/yyyy').format(
              //                   DateTime.parse(cont
              //                       .withdrawllist[index].createdAt
              //                       .toString()));
              //               return Container(
              //                   height: 50,
              //                   margin: const EdgeInsets.only(bottom: 3.0),
              //                   decoration: BoxDecoration(
              //                     // color: ColorConstant.mainlistgrayclr,
              //                     color: (index % 2 == 0)
              //                         ? ColorConstant.mainlistgrayclr
              //                         : Colors.white,
              //                   ),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                     children: [
              //                       IntrinsicHeight(
              //                         child: Padding(
              //                           padding: const EdgeInsets.only(
              //                             left: 8.0,
              //                             right: 8.0,
              //                           ),
              //                           child: Row(
              //                             children: [
              //                               Expanded(
              //                                 child: Center(
              //                                   child: Text(
              //                                       "${cont.withdrawllist[index].requestedAmount.toString()} ₹",
              //                                       style: AppStyle
              //                                           .aplayforloan
              //                                           .copyWith(
              //                                               fontSize: 12,
              //                                               fontWeight:
              //                                                   FontWeight
              //                                                       .w500)),
              //                                 ),
              //                               ),
              //                               const VerticalDivider(
              //                                 color: ColorConstant
              //                                     .listdivaderclr,
              //                                 width: 10,
              //                                 thickness: 2,
              //                               ),
              //                               Expanded(
              //                                 child: Center(
              //                                   child: Text(
              //                                     cont.withdrawllist[index]
              //                                                 .approvedAmount ==
              //                                             null
              //                                         ? "0.0"
              //                                         : cont
              //                                             .withdrawllist[
              //                                                 index]
              //                                             .approvedAmount
              //                                             .toString(),
              //                                     style: AppStyle
              //                                         .lblwarehousename
              //                                         .copyWith(
              //                                             color: Colors.black,
              //                                             fontSize: 12,
              //                                             fontWeight:
              //                                                 FontWeight
              //                                                     .w500),
              //                                     textAlign: TextAlign.center,
              //                                   ),
              //                                 ),
              //                               ),
              //                               const VerticalDivider(
              //                                 color: ColorConstant
              //                                     .listdivaderclr,
              //                                 width: 10,
              //                                 thickness: 2,
              //                               ),
              //                               Expanded(
              //                                 child: Center(
              //                                   child: Text(
              //                                     date,
              //                                     style: AppStyle
              //                                         .lblwarehousename
              //                                         .copyWith(
              //                                             color: ColorConstant
              //                                                 .maingreen,
              //                                             fontSize: 12,
              //                                             fontWeight:
              //                                                 FontWeight
              //                                                     .w500),
              //                                     textAlign: TextAlign.center,
              //                                   ),
              //                                 ),
              //                               ),
              //                               const VerticalDivider(
              //                                 color: ColorConstant
              //                                     .listdivaderclr,
              //                                 width: 10,
              //                                 thickness: 2,
              //                               ),
              //                               Expanded(
              //                                 child: Center(
              //                                     child: Text(
              //                                   cont.withdrawllist[index]
              //                                               .status ==
              //                                           0
              //                                       ? "rejected".tr
              //                                       : cont
              //                                                   .withdrawllist[
              //                                                       index]
              //                                                   .status ==
              //                                               2
              //                                           ? "msg_status_approved"
              //                                               .tr
              //                                           : cont
              //                                                       .withdrawllist[
              //                                                           index]
              //                                                       .status ==
              //                                                   3
              //                                               ? "msg_status_verified"
              //                                                   .tr
              //                                               : "request".tr,
              //                                   style: TextStyle(
              //                                       color: cont
              //                                                   .withdrawllist[
              //                                                       index]
              //                                                   .status ==
              //                                               0
              //                                           ? ColorConstant.grey
              //                                           : cont
              //                                                       .withdrawllist[
              //                                                           index]
              //                                                       .status ==
              //                                                   3
              //                                               ? ColorConstant
              //                                                   .maingreen
              //                                               : cont
              //                                                           .withdrawllist[
              //                                                               index]
              //                                                           .status ==
              //                                                       2
              //                                                   ? ColorConstant
              //                                                       .blue
              //                                                   : ColorConstant
              //                                                       .orangeA200,
              //                                       fontSize: 12,
              //                                       fontWeight:
              //                                           FontWeight.w500),
              //                                 )),
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ));
              //             }),
              //       ),
            ],
          ),
          error: (e, s) => Text(e.toString()),
          loading: () => const CupertinoActivityIndicator()),
    );
  }
}
