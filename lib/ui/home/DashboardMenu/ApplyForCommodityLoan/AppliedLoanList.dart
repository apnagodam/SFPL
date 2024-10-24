import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../utils/colors.dart';

class Appliedloanlist extends ConsumerStatefulWidget {
  const Appliedloanlist({super.key});

  @override
  ConsumerState<Appliedloanlist> createState() => _AppliedloanlistState();
}

class _AppliedloanlistState extends ConsumerState<Appliedloanlist> {
  var indexProvider = StateProvider((ref) => 0);
  var listOfScreens = [
    const ApprovedloanRequests(),
    const PendingloanRequests(),
    const RejectedloanRequests(),
    const ClosedloanRequests()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Stock Loan Requests"),
              titleTextStyle: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontSize: Adaptive.sp(18),
                  fontWeight: FontWeight.bold),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: ref.watch(indexProvider),
                onTap: (index) =>
                    ref.watch(indexProvider.notifier).state = index,
                backgroundColor: ColorsConstant.primaryColor,
                selectedItemColor: ColorsConstant.primaryColor,
                unselectedItemColor: ColorsConstant.secondaryColor,
                selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(12)),
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(12)),
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.approval_outlined), label: "Approved"),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.pending),
                    label: "Pending",
                  ),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.close), label: "Rejected"),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.check), label: "Closed")
                ]),
            body: listOfScreens[ref.watch(indexProvider)]));
  }
}

class ApprovedloanRequests extends ConsumerStatefulWidget {
  const ApprovedloanRequests({super.key});

  @override
  ConsumerState<ApprovedloanRequests> createState() =>
      _ApprovedloanRequestsState();
}

class _ApprovedloanRequestsState extends ConsumerState<ApprovedloanRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  "Amount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
              ]),
            ),
          ),
          ref.watch(approvedRequestsProvider).when(
              data: (data) => (data.data??[]).isEmpty ?emptyData(): ListView.builder(
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
                              child: Text(
                            "${data.data?[index].gatePass}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].terminal}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].commodityName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].quantity}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].stackNumber}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${currencyFormat.format(double.tryParse("${data.data?[index].amount}"))}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                        ]),
                      ),
                    ),
                  ),
              error: (e, s) => emptyData(),
              loading: () =>  Center(
                    child: defaultLoader(),
                  ))
        ],
      ),
    );
  }
}

class PendingloanRequests extends ConsumerStatefulWidget {
  const PendingloanRequests({super.key});

  @override
  ConsumerState<PendingloanRequests> createState() =>
      _PendingloanRequestsState();
}

class _PendingloanRequestsState extends ConsumerState<PendingloanRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  "Amount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
              ]),
            ),
          ),
          ref.watch(pendingRequestsProvider).when(
              data: (data) => (data.data??[]).isEmpty ?emptyData(): ListView.builder(
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
                              child: Text(
                            "${data.data?[index].gatePass}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].terminal}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].commodityName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].quantity}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].stackNumber}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${currencyFormat.format(double.tryParse("${data.data?[index].amount}"))}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                        ]),
                      ),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () =>  Center(
                    child:defaultLoader(),
                  ))
        ],
      ),
    );
  }
}

class RejectedloanRequests extends ConsumerStatefulWidget {
  const RejectedloanRequests({super.key});

  @override
  ConsumerState<RejectedloanRequests> createState() =>
      _RejectedloanRequestsState();
}

class _RejectedloanRequestsState extends ConsumerState<RejectedloanRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  "Amount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
              ]),
            ),
          ),
          ref.watch(approvedRequestsProvider).when(
              data: (data) => (data.data??[]).isEmpty ?emptyData(): ListView.builder(
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
                              child: Text(
                            "${data.data?[index].gatePass}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].terminal}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].commodityName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].quantity}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].stackNumber}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${currencyFormat.format(double.tryParse("${data.data?[index].amount}"))}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                        ]),
                      ),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () =>  Center(
                    child: defaultLoader()
                  ))
        ],
      ),
    );
  }
}

class ClosedloanRequests extends ConsumerStatefulWidget {
  const ClosedloanRequests({super.key});

  @override
  ConsumerState<ClosedloanRequests> createState() => _ClosedloanRequestsState();
}

class _ClosedloanRequestsState extends ConsumerState<ClosedloanRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  "Amount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(12)),
                )),
              ]),
            ),
          ),
          ref.watch(closedRequestsProvider).when(
              data: (data) => (data.data??[]).isEmpty ?emptyData(): ListView.builder(
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
                              child: Text(
                            "${data.data?[index].gatePass}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].terminal}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].commodityName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].quantity}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${data.data?[index].stackNumber}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "${currencyFormat.format(double.tryParse("${data.data?[index].amount}"))}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Adaptive.sp(12)),
                          )),
                        ]),
                      ),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () =>  Center(
                    child: defaultLoader(),
                  ))
        ],
      ),
    );
  }
}
