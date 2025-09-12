import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/ProfilesService/ProfilesService.dart';

import '../../../utils/LoaderUtils.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets.dart';

class Manditaxprofilescreen extends ConsumerStatefulWidget {
  const Manditaxprofilescreen({super.key});

  @override
  ConsumerState<Manditaxprofilescreen> createState() =>
      _ManditaxprofilescreenState();
}

class _ManditaxprofilescreenState extends ConsumerState<Manditaxprofilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mandi Tax Profile"),
      ),
      body: ListView(
        children: [
          Container(
            color: ColorsConstant.primaryColor.withOpacity(0.8),
            padding: const Pad(all: 10),
            child: IntrinsicHeight(
              child: Row(children: [
                Expanded(
                    child: Text(
                  "License Type ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "License No.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "State",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
                const VerticalDivider(),
                Expanded(
                    child: Text(
                  "Expiry Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Adaptive.sp(14)),
                )),
              ]),
            ),
          ),
          ref.watch(mandiTaxProfileProvider).when(
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
                                text:
                                    "${data.data?[index].licanceType ?? "--"}",
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
                                                        child: Text(
                                                            'License Type:',
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
                                                          "${data.data?[index].licanceType}",
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
                                                            'License Number:',
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
                                                        "${data.data?[index].licanceNumber}",
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
                                                            'License Relief:',
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
                                                          "${data.data?[index].isLicance??"--"}",
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
                                                            'C and F:',
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
                                                          "${data.data?[index].candfName??"--"}",
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
                                                            'State Name:',
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
                                                          "${data.data?[index].stateName??"--"}",
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
                                                        child: Text('District:',
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
                                                          "${data.data?[index].districtName??"--"}",
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
                                                            'Issue Date:',
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
                                                          "${data.data?[index].issueDate??"--"}",
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
                                                            'Expiry Date:',
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
                                                          "${data.data?[index].expiryDate??"--"}",
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
                                                ]),
                                                "License Details"));
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
                              "${data.data?[index].licanceNumber ?? "--"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            Expanded(
                                child: Text(
                              "${data.data?[index].stateName ?? "--"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${data.data?[index].expiryDate ?? "--"}",
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
      ),
    );
  }
}
