import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/colors.dart';

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: Adaptive.sh(2),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const Pad(all: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorsConstant.secondColorSuperDark, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0,
                        0,
                        1,
                        2,
                        3
                      ],
                      colors: [
                        Colors.transparent.withOpacity(0.8),
                        ColorsConstant.primaryColor.withOpacity(0.8),
                        ColorsConstant.secondColorDark,
                        ColorsConstant.secondColorSuperDark,
                        ColorsConstant.primaryColor.withOpacity(0.8),
                      ])),
              padding: const Pad(all: 25),
              child: ColumnSuper(alignment: Alignment.topLeft, children: [
                Text(
                  "Outstanding Amount".toUpperCase(),
                  style: TextStyle(
                    shadows: const [
                      Shadow(color: Colors.black, blurRadius: 2.0),
                      Shadow(color: Colors.black, blurRadius: 2.0)
                    ],
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${currencyFormat.format(21000000.00)}",
                  style: TextStyle(
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 2.0),
                        Shadow(color: Colors.black, blurRadius: 2.0)
                      ],
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: Adaptive.sp(22),
                      color: Colors.white),
                ),
              ])),
          SizedBox(
            height: 10,
          ),
          homeLayoutWidget(LucideIcons.banknote, 'Commodity Wise Loan', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/loan-2014155-1711062.png?f=webp&w=256'),
          homeLayoutWidget(LucideIcons.hand_coins, 'Unfunded SR', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/loan-82-1066968.png?f=webp&w=256'),
          homeLayoutWidget(LucideIcons.percent, 'Due Loans', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/due-date-10983830-8792274.png?f=webp&w=256'),
          homeLayoutWidget(LucideIcons.workflow, 'M2M Shortfalls', '0',
              imagePath:
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/trading-3256014-2712970.png?f=webp&w=256')
        ],
      )),
    );
  }

  homeLayoutWidget(IconData? iconData, String text, String number,
          {VoidCallback? callback, String? imagePath}) =>
      InkWell(
        onTap: callback,
        child: Card(
          color: Colors.white,
          margin: Pad(all: 10),
          elevation: 10,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorsConstant.secondColorSuperDark),
              borderRadius: BorderRadius.circular(10)),
          surfaceTintColor: Colors.white,
          child: Row(children: [
            Container(
              height: Adaptive.sw(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent.withOpacity(0.6),
                        ColorsConstant.primaryColor
                      ]),
                  color: ColorsConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: Pad(all: 20),
                  child: Image.network(
                    imagePath ?? "",
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
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Adaptive.sp(19)),
            )),
            Container(
              padding: Pad(all: 10),
              height: Adaptive.sw(15),
              decoration: BoxDecoration(
                  color: ColorsConstant.primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              alignment: Alignment.center,
              child: Text(
                number,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(20),
                    color: Colors.white),
              ),
            )
          ]),
        ),
      );
}
