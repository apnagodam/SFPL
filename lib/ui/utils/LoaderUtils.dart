import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import 'colors.dart';

expiredLoansShimmer() => Column(
      children: List.generate(
          8,
          (index) => Shimmer.fromColors(
                baseColor: index%2==0 ?Colors.black.withOpacity(0.3) :Colors.white,
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
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
                            fontSize: Adaptive.sp(12)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Maturity Date ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(12)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Loan Amount.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(12)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Commodity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(12)),
                      )),
                    ]),
                  ),
                ),
              )),
    );

homeShimmer() => Column(
      children: List.generate(
          8,
          (index) => Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.3),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    margin: Pad(all: 10),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ColorsConstant.secondColorSuperDark),
                        borderRadius: BorderRadius.circular(10)),
                    surfaceTintColor: Colors.white,
                    child: Row(children: [
                      Container(
                        height: Adaptive.sh(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.transparent.withOpacity(0.6),
                                  ColorsConstant.primaryColor
                                ]),
                            color: const Color.fromARGB(255, 28, 42, 25),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: Pad(all: 20),
                            child: Image.network(
                              'https://static.thenounproject.com/png/4814670-200.png',
                              fit: BoxFit.contain,
                              width: 20,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "loading",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(16)),
                      )),
                      Container(
                        padding: Pad(all: 10),
                        height: Adaptive.sh(10),
                        width: Adaptive.w(25),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.transparent.withOpacity(0.6),
                                  ColorsConstant.primaryColor
                                ]),
                            color: const Color.fromARGB(255, 28, 42, 25),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(16),
                              color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                ),
              )),
    );
