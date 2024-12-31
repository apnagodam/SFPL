import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Sanctionedholdstatementscreen extends ConsumerStatefulWidget {
  const Sanctionedholdstatementscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SanctionedholdstatementscreenState();
}

class _SanctionedholdstatementscreenState
    extends ConsumerState<Sanctionedholdstatementscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Limit Hold Statement'),
        ),
        body: ref.watch(sanctionHoldProvider).when(
            data: (data) => ListView(
                  padding: Pad(all: 10),
                  children: [
                    ElevarmOutlinedCard(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sanctioned Limit',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${data.sanctionLimit}',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Used Limit',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${data.usedLimit}',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Hold Limit',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${data.totalHoldLimit}',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Balance',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${data.balance}',
                                textAlign: TextAlign.left,
                                style: ElevarmFontFamilies.inter(
                                  color: ElevarmColors.neutral500,
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: ElevarmFontWeights.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: ColorsConstant.primaryColor.withOpacity(0.8),
                      padding: const Pad(all: 10),
                      child: IntrinsicHeight(
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            "Sbt Trade ID ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "Product",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "Hold Amount",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                        ]),
                      ),
                    ),
                    ListView.builder(
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
                                text: "${data.data?[index].sbtTradeId}",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${data.data?[index].productName}",
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
                                  "${data.data?[index].holdAmount ?? 0.0}")),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              data.data?[index].createdAt == null
                                  ? "--"
                                  : "${DateFormat('dd-MMMM-yyyy').format((DateTime.parse(data.data?[index].createdAt)))}",
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
                  ],
                ),
            error: (e, s) => Container(),
            loading: () => Center(
                  child: defaultLoader(),
                )));
  }
}
