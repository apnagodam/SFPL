import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/RepaymentDataModel.dart';
import 'package:swfl/Data/Model/RepaymentTerminalData.dart';
import 'package:swfl/Domain/RepaymentService/RepaymentService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../utils/colors.dart';

class Repaymentscreen extends ConsumerStatefulWidget {
  const Repaymentscreen({super.key});

  @override
  ConsumerState<Repaymentscreen> createState() => _RepaymentscreenState();
}

class _RepaymentscreenState extends ConsumerState<Repaymentscreen> {
  var terminalProvider = StateProvider<Terminal?>((ref) => null);
  var commodityProvider = StateProvider<Datum?>((ref) => null);
  var stackProvider = StateProvider<Datum?>((ref) => null);

  var gatepassList = StateProvider<List<int>>((ref) => []);
  var selectedItem = StateProvider<int?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repayment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Pad(all: 10),
          child: Column(
            children: [
              ref.watch(repaymentTerminalDataProvider).when(
                  data: (data) => DropdownSearch<Terminal?>(
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
                                          color: ColorsConstant.primaryColor)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: ColorsConstant.primaryColor)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: ColorsConstant.primaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: ColorsConstant.primaryColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: ColorsConstant.primaryColor)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: ColorsConstant.primaryColor)),
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
                                          "${terminal?.name}",
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
                                'Select Terminal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            showSearchBox: true,
                            searchDelay: const Duration(microseconds: 500)),
                        filterFn: (user, filter) =>
                            user?.districtFilterByName(filter) ?? false,
                        // asyncItems: (String filter) => getData(filter),
                        items: data.terminals ?? [],
                        itemAsString: (Terminal? u) => u?.name ?? "",
                        onChanged: (Terminal? data) =>
                            ref.watch(terminalProvider.notifier).state = data,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              contentPadding: Pad(left: 10, bottom: 5, top: 5),
                              hintText: "Select Terminal",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      color: ColorsConstant
                                          .secondColorUltraDark))),
                        ),
                      ),
                  error: (e, s) => Container(),
                  loading: () => Center(
                        child: CircularProgressIndicator.adaptive(),
                      )),
              SizedBox(
                height: 10,
              ),
              if (ref.watch(terminalProvider) == null)
                SizedBox()
              else
                ref
                    .watch(repaymentDataProvider(
                        terminal: ref.watch(terminalProvider)?.name ?? '',
                        type: "commodity_names",
                        commodityName: ''))
                    .when(
                        data: (data) => DropdownSearch<Datum?>(
                              popupProps: PopupProps.menu(
                                  searchFieldProps: const TextFieldProps(
                                      autofocus: true,
                                      cursorColor: ColorsConstant.primaryColor,
                                      padding: Pad(left: 10, right: 10),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            Pad(left: 10, right: 10),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                      )),
                                  menuProps: MenuProps(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                                  ColorsConstant.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  itemBuilder: (context, terminal, isVisible) =>
                                      ColumnSuper(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Padding(
                                              padding: const Pad(all: 10),
                                              child: Text(
                                                "${terminal?.commodityName}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Adaptive.sp(16)),
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                            ),
                                          ]),
                                  isFilterOnline: true,
                                  title: Padding(
                                    padding: const Pad(all: 10),
                                    child: Text(
                                      'Select Commodity',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Adaptive.sp(16),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  showSearchBox: true,
                                  searchDelay:
                                      const Duration(microseconds: 500)),
                              filterFn: (user, filter) =>
                                  user?.commodityByFilter(filter) ?? false,
                              // asyncItems: (String filter) => getData(filter),

                              items: data.data ?? [],
                              itemAsString: (Datum? u) =>
                                  u?.commodityName ?? "",
                              onChanged: (Datum? data) => ref
                                  .watch(commodityProvider.notifier)
                                  .state = data,
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                    contentPadding:
                                        Pad(left: 10, bottom: 5, top: 5),
                                    hintText: "Select Commodity",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: ColorsConstant
                                                .secondColorUltraDark))),
                              ),
                            ),
                        error: (e, s) => Container(),
                        loading: () => Center(
                              child: CircularProgressIndicator.adaptive(),
                            )),
              SizedBox(
                height: 10,
              ),
              if (ref.watch(commodityProvider) == null)
                SizedBox()
              else
                ref
                    .watch(repaymentDataProvider(
                        terminal: ref.watch(terminalProvider)?.name ?? '',
                        type: "stack",
                        commodityName:
                            ref.watch(commodityProvider)?.commodityName ?? ""))
                    .when(
                        data: (data) => DropdownSearch<Datum?>(
                              popupProps: PopupProps.menu(
                                  searchFieldProps: const TextFieldProps(
                                      autofocus: true,
                                      cursorColor: ColorsConstant.primaryColor,
                                      padding: Pad(left: 10, right: 10),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            Pad(left: 10, right: 10),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: ColorsConstant
                                                    .primaryColor)),
                                      )),
                                  menuProps: MenuProps(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                                  ColorsConstant.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  itemBuilder: (context, terminal, isVisible) =>
                                      ColumnSuper(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Padding(
                                              padding: const Pad(all: 10),
                                              child: Text(
                                                "${terminal?.stackNumber}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Adaptive.sp(16)),
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                            ),
                                          ]),
                                  isFilterOnline: true,
                                  title: Padding(
                                    padding: const Pad(all: 10),
                                    child: Text(
                                      'Select Stack',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Adaptive.sp(16),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  showSearchBox: true,
                                  searchDelay:
                                      const Duration(microseconds: 500)),
                              filterFn: (user, filter) =>
                                  user?.stackByFilter(filter) ?? false,
                              // asyncItems: (String filter) => getData(filter),

                              items: data.data ?? [],
                              itemAsString: (Datum? u) =>
                                  u?.stackNumber.toString() ?? "",
                              onChanged: (Datum? data) => ref
                                  .watch(stackProvider.notifier)
                                  .state = data,
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                    contentPadding:
                                        Pad(left: 10, bottom: 5, top: 5),
                                    hintText: "Select Stack",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color: ColorsConstant
                                                .secondColorUltraDark))),
                              ),
                            ),
                        error: (e, s) => Container(
                              child: Text(e.toString()),
                            ),
                        loading: () => Center(
                              child: CircularProgressIndicator.adaptive(),
                            )),
              SizedBox(
                height: 10,
              ),
              ref.watch(terminalProvider) == null ||
                      ref.watch(commodityProvider) == null ||
                      ref.watch(stackProvider) == null
                  ? SizedBox()
                  : Text(
                      'Select Gatepass',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
              ref.watch(terminalProvider) == null ||
                      ref.watch(commodityProvider) == null ||
                      ref.watch(stackProvider) == null
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              ref.watch(terminalProvider) == null ||
                      ref.watch(commodityProvider) == null ||
                      ref.watch(stackProvider) == null
                  ? SizedBox()
                  : ref
                      .watch(repaymentSettlementListProvider(
                          terminal: ref.watch(terminalProvider)?.name ?? "",
                          commodityName:
                              ref.watch(commodityProvider)?.commodityName ?? "",
                          stackNumber:
                              ref.watch(stackProvider)?.stackNumber.toString()))
                      .when(
                          data: (data) => ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                var isSelected = ref.watch(selectedItem) ==
                                    data.data?[index].id;
                                return InkWell(
                                  child: GlassContainer.frostedGlass(
                                      height: Adaptive.h(isSelected ? 25 : 20),
                                      blur: 10,
                                      padding: Pad(all: 10),
                                      borderRadius: BorderRadius.circular(10),
                                      frostedOpacity: 0.12,
                                      shadowColor: Colors.black,
                                      gradient: !isSelected
                                          ? null
                                          : LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: const [
                                                  0,
                                                  1,
                                                  2,
                                                  3
                                                ],
                                              colors: [
                                                  ColorsConstant.primaryColor
                                                      .withOpacity(0.9),
                                                  ColorsConstant.secondColorDark
                                                      .withOpacity(0.9),
                                                  ColorsConstant
                                                      .secondColorSuperDark
                                                      .withOpacity(0.9),
                                                  ColorsConstant.primaryColor
                                                      .withOpacity(0.9),
                                                ]),
                                      borderGradient: !isSelected
                                          ? null
                                          : LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              stops: const [
                                                  0,
                                                  1,
                                                  2,
                                                  3
                                                ],
                                              colors: [
                                                  ColorsConstant.primaryColor,
                                                  ColorsConstant
                                                      .secondColorDark,
                                                  ColorsConstant
                                                      .secondColorSuperDark,
                                                  ColorsConstant.primaryColor,
                                                ]),
                                      borderWidth: 2,
                                      child: ColumnSuper(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'DRF-${data.data?[index].drfNo ?? 0}',
                                                  style: TextStyle(
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: isSelected
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize:
                                                          Adaptive.sp(18)),
                                                ),

                                                // Text(
                                                //   "${data.data?[index].terminal}",
                                                //   style: TextStyle(
                                                //       height: 2,
                                                //       fontWeight: FontWeight.normal,
                                                //       fontSize: Adaptive.sp(16)),
                                                // ),
                                                Text.rich(TextSpan(
                                                    text: 'Gatepass:',
                                                    style: TextStyle(
                                                        height: 2,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: isSelected
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize:
                                                            Adaptive.sp(16)),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              ' ${data.data?[index].gatePass ?? 0.0}')
                                                    ])),
                                              ],
                                            ),
                                            Text.rich(TextSpan(
                                                text: 'Quantity:',
                                                style: TextStyle(
                                                    height: 2,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: Adaptive.sp(16)),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          ' ${data.data?[index].quantity ?? 0.0}')
                                                ])),

                                            // RowSuper(fill: true, children: [
                                            //   // Text.rich(TextSpan(
                                            //   //     text: 'Commodity:',
                                            //   //     style: TextStyle(
                                            //   //         height: 2,
                                            //   //         fontWeight: FontWeight.bold,
                                            //   //         fontSize: Adaptive.sp(16)),
                                            //   //     children: [
                                            //   //       TextSpan(
                                            //   //           text:
                                            //   //           ' ${data.data?[index].commodityName}')
                                            //   //     ])),
                                            //
                                            // ]),

                                            Text.rich(
                                              TextSpan(
                                                text: 'Interest Amount:',
                                                style: TextStyle(
                                                    height: 2,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: Adaptive.sp(16)),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          ' ${currencyFormat.format(double.parse("${data.data?[index].interestAmount ?? 0.0}"))}')
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                  text: 'Settlement Amount:',
                                                  style: TextStyle(
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: isSelected
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize:
                                                          Adaptive.sp(16)),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            ' ${currencyFormat.format(double.parse("${data.data?[index].totalSettlementAmount ?? 0.0}"))}')
                                                  ]),
                                            ),

                                            // RowSuper(fill: true, children: [
                                            //   // Text.rich(
                                            //   //   TextSpan(
                                            //   //       text: 'Pi Amount: ',
                                            //   //       style: TextStyle(
                                            //   //           height: 2,
                                            //   //           fontWeight: FontWeight.bold,
                                            //   //           fontSize: Adaptive.sp(16)),
                                            //   //       children: [
                                            //   //         TextSpan(
                                            //   //             text:
                                            //   //             ' ${currencyFormat.format(
                                            //   //                 double.parse(
                                            //   //                     "${data.data?[index]
                                            //   //                         .compoundPIAmount ??
                                            //   //                         0.0}"))}')
                                            //   //       ]),
                                            //   // ),
                                            //
                                            // ]),
                                            // RowSuper(fill: true, children: [
                                            //   Text.rich(TextSpan(
                                            //       text: 'Loan Amount: ',
                                            //       style: TextStyle(
                                            //           height: 2,
                                            //           fontWeight: FontWeight.bold,
                                            //           fontSize: Adaptive.sp(16)),
                                            //       children: [
                                            //         TextSpan(
                                            //             text:
                                            //             ' ${currencyFormat.format(
                                            //                 double.parse("${data.data?[index]
                                            //                     .totalLoanAmount ?? 0.0}"))}')
                                            //       ])),
                                            //   Text.rich(TextSpan(
                                            //       text: 'Interest Amount:',
                                            //       style: TextStyle(
                                            //           height: 2,
                                            //           fontWeight: FontWeight.bold,
                                            //           fontSize: Adaptive.sp(16)),
                                            //       children: [
                                            //         TextSpan(
                                            //             text:
                                            //             '${currencyFormat.format(double.parse(
                                            //                 "${data.data?[index]
                                            //                     .interestAmount ?? 0.0}"))}')
                                            //       ]))
                                            // ])
                                            if (isSelected)
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    showloader(context);
                                                    ref
                                                        .watch(repayGatepassProvider(
                                                                financeId: [
                                                          "${data.data?[index].id}"
                                                        ],
                                                                finalAmount: data
                                                                    .data?[
                                                                        index]
                                                                    .totalSettlementAmount
                                                                    .toString())
                                                            .future)
                                                        .then((value) {
                                                      hideLoader(context);
                                                      if (value['status']
                                                              .toString() ==
                                                          "1") {
                                                        successToast(
                                                            context,
                                                            value['message']
                                                                .toString());
                                                        ref.invalidate(
                                                            repaymentSettlementListProvider);
                                                      } else {
                                                        errorToast(
                                                            context,
                                                            value['message']
                                                                .toString());
                                                      }
                                                    }).onError((e, s) {
                                                      hideLoader(context);
                                                    });
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          ColorsConstant
                                                              .secondColorDark,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                  child: Text(
                                                    "Pay",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        shadows: [
                                                          const Shadow(
                                                              color:
                                                                  Colors.white,
                                                              blurRadius: 0.3)
                                                        ],
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            Adaptive.sp(16)),
                                                  ),
                                                ),
                                              ),
                                          ])),
                                  onTap: () {
                                    ref.watch(selectedItem.notifier).state =
                                        data.data?[index].id;
                                    // if (!ref
                                    //     .watch(gatepassList)
                                    //     .contains(data.data?[index].id)) {
                                    //   ref.watch(gatepassList.notifier).state = [
                                    //     ...ref.watch(gatepassList),
                                    //     data.data?[index].id
                                    //   ];
                                    // } else {
                                    //   ref
                                    //       .watch(gatepassList)
                                    //       .remove(data.data?[index].id);
                                    //
                                    //   setState(() {});
                                    // }
                                  },
                                );
                              }),
                          error: (e, s) => Container(child: Text(e.toString())),
                          loading: () => Center(
                                child: CircularProgressIndicator.adaptive(),
                              ))
            ],
          ),
        ),
      ),
    );
  }
}
