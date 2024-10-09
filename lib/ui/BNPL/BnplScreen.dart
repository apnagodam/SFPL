import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/enums.dart';

import '../../Data/Model/TermsModel.dart';
import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../Domain/BnplService/BnplService.dart';
import '../utils/colors.dart';
import '../utils/routes_strings.dart';
import '../utils/widgets.dart';

class Bnplscreen extends ConsumerStatefulWidget {
  const Bnplscreen({super.key});

  @override
  ConsumerState<Bnplscreen> createState() => _BnplscreenState();
}

class _BnplscreenState extends ConsumerState<Bnplscreen> {
  var checkBoxValueProvider = StateProvider((ref) => false);
  var bnplKey = GlobalKey<FormState>();
  final bnplController = TextEditingController();
  var bnplTypeProvider = StateProvider<BnplLimitType?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy now pay later'),
      ),
      body: SafeArea(
          child: Center(
        child: ref.watch(bnplPowerProvider).when(
            data: (data) => Form(
                  key: bnplKey,
                  child: Padding(
                    padding: Pad(all: 10),
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "Available BNPL Limit",
                            style: TextStyle(
                              fontSize: Adaptive.sp(18),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.rubik().fontFamily,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            currencyFormat
                                .format(double.parse("${data.bnpl?.effectiveBalance??0.0}")),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontSize: Adaptive.sp(24)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownSearch<BnplLimitType?>(
                          popupProps: PopupProps.menu(
                              searchFieldProps: const TextFieldProps(
                                  autofocus: true,
                                  cursorColor: ColorsConstant.primaryColor,
                                  padding: Pad(left: 10, right: 10),
                                  decoration: InputDecoration(
                                    contentPadding: Pad(left: 10, right: 10),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                ColorsConstant.primaryColor)),
                                  )),
                              menuProps: MenuProps(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorsConstant.primaryColor),
                                      borderRadius: BorderRadius.circular(8))),
                              itemBuilder: (context, terminal, isVisible) =>
                                  ColumnSuper(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Padding(
                                          padding: const Pad(all: 10),
                                          child: Text(
                                            "${terminal?.label}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(16)),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                      ]),
                              isFilterOnline: true,
                              title: Padding(
                                padding: const Pad(all: 10),
                                child: Text(
                                  'Select Bnpl Type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              showSearchBox: true,
                              searchDelay: const Duration(microseconds: 500)),
                          items: BnplLimitType.values ?? [],
                          itemAsString: (BnplLimitType? u) => u!.label,
                          onChanged: (BnplLimitType? data) =>
                              ref.watch(bnplTypeProvider.notifier).state = data,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding:
                                    Pad(left: 10, bottom: 5, top: 5),
                                hintText: "Select Bnpl Type",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: ColorsConstant
                                            .secondColorUltraDark))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: bnplController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input valid amount';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Amount",
                              label: const Text("Amount"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.aadharVerify ==
                                  "0") {
                                showVerificationDialog(context,
                                    titleText: "Verify Aadhar",
                                    messageText:
                                        "Your Aadhar verification is pending",
                                    action: () {
                                  hideLoader(context);
                                  context.goNamed(
                                      RoutesStrings.bnplAadharRegistration);
                                });
                              } else {
                                if (bnplKey.currentState!.validate()) {
                                  if (ref.watch(bnplTypeProvider) !=
                                      BnplLimitType.defaultType) {
                                    showloader(context);
                                    ref
                                        .watch(bnplTermsProvider.future)
                                        .then((value) {
                                      hideLoader(context);
                                      if (value.status.toString() == "1") {
                                        termsLayout(context, ref, value);
                                      } else {
                                        showErrorDialog(context,
                                            titleText: "Error!",
                                            messageText: value.message ?? "");
                                      }
                                    }).onError((e, s) {
                                      hideLoader(context);
                                      showErrorDialog(context,
                                          titleText: "Error!",
                                          messageText: e.toString() ?? "");
                                    });
                                  } else {
                                    errorToast(context, "Select Bnpl Type");
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.secondColorDark,
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
                                  fontSize: Adaptive.sp(16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: Pad(all: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorsConstant.secondColorSuperDark,
                                  width: 2),
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
                                    ColorsConstant.primaryColor
                                        .withOpacity(0.8),
                                    ColorsConstant.secondColorDark,
                                    ColorsConstant.secondColorSuperDark,
                                    ColorsConstant.primaryColor
                                        .withOpacity(0.8),
                                  ])),
                          child: ColumnSuper(children: [
                            Text(
                              'BNPL Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  shadows: const [
                                    Shadow(
                                        color: Colors.black, blurRadius: 2.0),
                                    Shadow(color: Colors.black, blurRadius: 2.0)
                                  ],
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: Adaptive.sp(18)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Original Limit',
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              ),
                              Text(
                                currencyFormat
                                    .format( double.tryParse("${data.bnpl?.originalLimit??0.0}")),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Utilised Limit',
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              ),
                              Text(
                                currencyFormat
                                    .format( double.tryParse("${data.bnpl?.utilizedLimit??0.0}")),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Available Limit',
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              ),
                              Text(
                                currencyFormat
                                    .format( double.tryParse("${data.bnpl?.availableLimit??0.0}")),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Hold Limit',
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              ),
                              Text(
                                currencyFormat
                                    .format(double.tryParse("${data.bnpl?.holdLimit??0.0}")),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              )
                            ]),

                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Effective Balance',
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              ),
                              Text(
                                currencyFormat
                                    .format( double.tryParse("${data.bnpl?.effectiveBalance??0.0}")),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0),
                                      Shadow(
                                          color: Colors.black, blurRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: Adaptive.sp(17)),
                              )
                            ]),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
            error: (e, s) => Container(),
            loading: () => CupertinoActivityIndicator()),
      )),
    );
  }

  termsLayout(BuildContext context, WidgetRef ref, TermsModel data) =>
      showBarModalBottomSheet(
          context: context,
          expand: true,
          builder: (context) => Consumer(
              builder: (context, ref, child) => Padding(
                    padding: const Pad(all: 10),
                    child: ListView(
                      children: [
                        HtmlWidget(data.view ?? ""),
                        RowSuper(children: [
                          Checkbox(
                              value: ref.watch(checkBoxValueProvider),
                              onChanged: (value) {
                                ref
                                    .watch(checkBoxValueProvider.notifier)
                                    .state = value ?? false;
                              }),
                          Text(
                              'By proceeding, you agree to our Term and Conditions',
                              style: TextStyle(
                                  fontSize: Adaptive.sp(15),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {

                              if (ref.watch(checkBoxValueProvider)) {
                                showloader(context);
                                ref
                                    .watch(bnplRequestProvider(
                                            requestedAmount:
                                                bnplController.text.toString(),
                                            type: ref
                                                .watch(bnplTypeProvider)
                                                ?.type)
                                        .future)
                                    .then((value) {
                                  hideLoader(context);

                                  if (value.status.toString() == "1") {
                                    Navigator.of(context).pop();
                                    ref.invalidate(bnplPowerProvider);
                                    successToast(
                                        context, value.message.toString());
                                  } else {
                                    errorToast(
                                        context, value.message.toString());
                                  }
                                }).onError((e, s) {
                                  showErrorDialog(context,
                                      titleText: "Exception!",
                                      messageText: e.toString());
                                });
                              } else {
                                errorToast(
                                    context, 'Please agree to terms first');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.secondColorDark,
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
                                  fontSize: Adaptive.sp(16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )));
}
