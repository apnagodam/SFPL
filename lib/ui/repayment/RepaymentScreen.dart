import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/RepaymentDataModel.dart';
import 'package:swfl/Data/Model/RepaymentTerminalData.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/RepaymentService/RepaymentService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/enums.dart';
import 'package:swfl/ui/utils/extensions.dart';
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
  var paymentType =
      StateProvider<PartPaymentType?>((ref) => PartPaymentType.full);
  var paymentAmountController = TextEditingController();
  var errorText = StateProvider<String?>((ref) => null);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ltvTypeProvider = StateProvider<LTVType?>((ref) => null);
  final terminalsListProvider = StateProvider<List<Terminal>?>((ref) => null);
  final ltvDataProvider = StateProvider<RepaymentTerminalData?>((ref) => null);
  final _totalSettlementAmount = StateProvider<num>((ref) => 0.0);
  final isLoading = StateProvider<bool>((ref) => false);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTerminalsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repayment '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const Pad(all: 10),
          child: ref.watch(isLoading) == true
              ? SizedBox(
                  height: context.fullHeight,
                  child: Center(
                    child: defaultLoader(),
                  ))
              : ref.watch(ltvTypeProvider) == LTVType.aboveZero
                  ? Column(
                      children: [
                        if (num.parse(
                                    '${ref.watch(ltvDataProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          const SizedBox(
                            height: 10,
                          ),
                        if (num.parse(
                                    '${ref.watch(ltvDataProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          Text(
                              'Total Settlement Amount \u{20B9}${ref.watch(ltvDataProvider)?.settlementAmount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.primaryColor,
                                fontSize: Adaptive.sp(16),
                              )),
                                TextButton(
                              onPressed: () {
                                showloader(context);
                                ref
                                    .watch(sendWhatsappPdfProvider(
                                          
                                            terminal:
                                                "${ref.watch(terminalsListProvider)?[0].name}",
                                           )
                                        .future)
                                    .then((value) {
                                  hideLoader(context);
                                  if (value['status'].toString() == "1") {
                                    successToast(
                                        context, value['message'].toString());
                                  } else {
                                    errorToast(
                                        context, value['message'].toString());
                                  }
                                }).onError((e, s) {
                                  hideLoader(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Tap to Receive report on whatsapp',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CachedNetworkImage(imageUrl: 'https://web.whatsapp.com/favicon-64x64.ico',height: Adaptive.sp(20),)
                                ],
                              )),
                        _ltvSettlementUi(ref.watch(ltvDataProvider))
                      ],
                    )
                  : Column(
                      children: [
                        DropdownSearch<Terminal?>(
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
                                          child: Text.rich(
                                            TextSpan(text: "${terminal?.name}"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(15)),
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
                                      fontSize: Adaptive.sp(15),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              showSearchBox: true,
                              searchDelay: const Duration(microseconds: 500)),
                          filterFn: (user, filter) =>
                              user?.districtFilterByName(filter) ?? false,
                          // asyncItems: (String filter) => getData(filter),
                          items: ref.watch(terminalsListProvider) ?? [],
                          itemAsString: (Terminal? u) => "${u?.name}",
                          onChanged: (Terminal? data) =>
                              ref.watch(terminalProvider.notifier).state = data,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding:
                                    Pad(left: 10, bottom: 5, top: 5),
                                hintText: "Select Terminal",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: ColorsConstant
                                            .secondColorUltraDark))),
                          ),
                        ),
                        if (num.parse(
                                    '${ref.watch(terminalProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          const SizedBox(
                            height: 10,
                          ),
                        if (num.parse(
                                    '${ref.watch(terminalProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          Text(
                              'Terminal-wise Settlement Amount \u{20B9}${ref.watch(terminalProvider)?.settlementAmount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.primaryColor,
                                fontSize: Adaptive.sp(16),
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        if (ref.watch(terminalProvider) == null)
                          const SizedBox()
                        else
                          ref
                              .watch(repaymentDataProvider(
                                  terminal:
                                      ref.watch(terminalProvider)?.name ?? '',
                                  type: "commodity_names",
                                  commodityName: ''))
                              .when(
                                  data: (data) => DropdownSearch<Datum?>(
                                        popupProps: PopupProps.menu(
                                            searchFieldProps:
                                                const TextFieldProps(
                                                    autofocus: true,
                                                    cursorColor: ColorsConstant
                                                        .primaryColor,
                                                    padding: Pad(
                                                        left: 10, right: 10),
                                                    decoration: InputDecoration(
                                                      contentPadding: Pad(
                                                          left: 10, right: 10),
                                                      focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      disabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                    )),
                                            menuProps: MenuProps(
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color: ColorsConstant
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            itemBuilder: (context, terminal,
                                                    isVisible) =>
                                                ColumnSuper(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const Pad(all: 10),
                                                        child: Text(
                                                          "${terminal?.commodityName}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      15)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                      ),
                                                    ]),
                                            isFilterOnline: true,
                                            title: Padding(
                                              padding: const Pad(all: 10),
                                              child: Text(
                                                'Select Commodity',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Adaptive.sp(15),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            showSearchBox: true,
                                            searchDelay: const Duration(
                                                microseconds: 500)),
                                        filterFn: (user, filter) =>
                                            user?.commodityByFilter(filter) ??
                                            false,
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
                                              contentPadding: Pad(
                                                  left: 10, bottom: 5, top: 5),
                                              hintText: "Select Commodity",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  borderSide: BorderSide(
                                                      color: ColorsConstant
                                                          .secondColorUltraDark))),
                                        ),
                                      ),
                                  error: (e, s) => Container(),
                                  loading: () => const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      )),
                        if (num.parse(
                                    '${ref.watch(commodityProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          const SizedBox(
                            height: 10,
                          ),
                        if (num.parse(
                                    '${ref.watch(commodityProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          Text(
                              'Commodity-wise  Settlement Amount \u{20B9}${ref.watch(commodityProvider)?.settlementAmount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.primaryColor,
                                fontSize: Adaptive.sp(16),
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        if (ref.watch(commodityProvider) == null)
                          const SizedBox()
                        else
                          ref
                              .watch(repaymentDataProvider(
                                  terminal:
                                      ref.watch(terminalProvider)?.name ?? '',
                                  type: "stack",
                                  commodityName: ref
                                          .watch(commodityProvider)
                                          ?.commodityName ??
                                      ""))
                              .when(
                                  data: (data) => DropdownSearch<Datum?>(
                                        popupProps: PopupProps.menu(
                                            searchFieldProps:
                                                const TextFieldProps(
                                                    autofocus: true,
                                                    cursorColor: ColorsConstant
                                                        .primaryColor,
                                                    padding: Pad(
                                                        left: 10, right: 10),
                                                    decoration: InputDecoration(
                                                      contentPadding: Pad(
                                                          left: 10, right: 10),
                                                      focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      disabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      errorBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: ColorsConstant
                                                                  .primaryColor)),
                                                    )),
                                            menuProps: MenuProps(
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color: ColorsConstant
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            itemBuilder: (context, terminal,
                                                    isVisible) =>
                                                ColumnSuper(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const Pad(all: 10),
                                                        child: Text(
                                                          "${terminal?.stackNumber}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      15)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                      ),
                                                    ]),
                                            isFilterOnline: true,
                                            title: Padding(
                                              padding: const Pad(all: 10),
                                              child: Text(
                                                'Select Stack',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Adaptive.sp(15),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            showSearchBox: true,
                                            searchDelay: const Duration(
                                                microseconds: 500)),
                                        filterFn: (user, filter) =>
                                            user?.stackByFilter(filter) ??
                                            false,
                                        // asyncItems: (String filter) => getData(filter),

                                        items: data.data ?? [],
                                        itemAsString: (Datum? u) =>
                                            u?.stackNumber.toString() ?? "",
                                        onChanged: (Datum? data) async {
                                          ref
                                              .watch(stackProvider.notifier)
                                              .state = data;

                                          ref
                                              .watch(repaymentSettlementListProvider(
                                                      terminal: ref
                                                              .watch(
                                                                  terminalProvider)
                                                              ?.name ??
                                                          "",
                                                      commodityName: ref
                                                              .watch(
                                                                  commodityProvider)
                                                              ?.commodityName ??
                                                          "",
                                                      stackNumber: ref
                                                          .watch(stackProvider)
                                                          ?.stackNumber
                                                          .toString())
                                                  .future)
                                              .then((value) {
                                            value.data?.forEach((value) {
                                              ref
                                                      .watch(
                                                          _totalSettlementAmount
                                                              .notifier)
                                                      .state +=
                                                  num.parse(
                                                      "${value.totalSettlementAmount}");
                                            });
                                          });
                                        },
                                        dropdownDecoratorProps:
                                            const DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                              contentPadding: Pad(
                                                  left: 10, bottom: 5, top: 5),
                                              hintText: "Select Stack",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  borderSide: BorderSide(
                                                      color: ColorsConstant
                                                          .secondColorUltraDark))),
                                        ),
                                      ),
                                  error: (e, s) => Container(
                                        child: Text(e.toString()),
                                      ),
                                  loading: () => const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      )),
                        if (num.parse(
                                    '${ref.watch(stackProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          const SizedBox(
                            height: 10,
                          ),
                        if (num.parse(
                                    '${ref.watch(stackProvider)?.settlementAmount ?? 0}')
                                .toString() !=
                            "0")
                          Text(
                              'Stack-wise Settlement Amount \u{20B9}${ref.watch(stackProvider)?.settlementAmount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.primaryColor,
                                fontSize: Adaptive.sp(16),
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        if (ref.watch(stackProvider) != null)
                          TextButton(
                              onPressed: () {
                                showloader(context);
                                ref
                                    .watch(sendWhatsappPdfProvider(
                                            commodityName:
                                                "${ref.watch(commodityProvider)?.commodityName}",
                                            terminal:
                                                "${ref.watch(terminalProvider)?.name}",
                                            stackNumber:
                                                "${ref.watch(stackProvider)?.stackNumber}")
                                        .future)
                                    .then((value) {
                                  hideLoader(context);
                                  if (value['status'].toString() == "1") {
                                    successToast(
                                        context, value['message'].toString());
                                  } else {
                                    errorToast(
                                        context, value['message'].toString());
                                  }
                                }).onError((e, s) {
                                  hideLoader(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Tap to Receive report on whatsapp',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CachedNetworkImage(imageUrl: 'https://web.whatsapp.com/favicon-64x64.ico',height: Adaptive.sp(20),)
                                ],
                              )),
                        ref.watch(terminalProvider) == null ||
                                ref.watch(commodityProvider) == null ||
                                ref.watch(stackProvider) == null
                            ? const SizedBox()
                            : Text(
                                'Select Gatepass',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(15)),
                              ),
                        ref.watch(terminalProvider) == null ||
                                ref.watch(commodityProvider) == null ||
                                ref.watch(stackProvider) == null
                            ? const SizedBox()
                            : const SizedBox(
                                height: 10,
                              ),
                        ref.watch(terminalProvider) == null ||
                                ref.watch(commodityProvider) == null ||
                                ref.watch(stackProvider) == null
                            ? const SizedBox()
                            : ref
                                .watch(repaymentSettlementListProvider(
                                    terminal:
                                        ref.watch(terminalProvider)?.name ?? "",
                                    commodityName: ref
                                            .watch(commodityProvider)
                                            ?.commodityName ??
                                        "",
                                    stackNumber: ref
                                        .watch(stackProvider)
                                        ?.stackNumber
                                        .toString()))
                                .when(
                                    data: (data) => _settlementUi(data),
                                    error: (e, s) => emptyData(),
                                    loading: () => const Center(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        ))
                      ],
                    ),
        ),
      ),
    );
  }

  void _getTerminalsData() {
    ref.watch(isLoading.notifier).state = true;
    ref.watch(repaymentTerminalDataProvider.future).then((value) {
      ref.watch(isLoading.notifier).state = false;

      ref.watch(terminalsListProvider.notifier).state = value.terminals;

      if (num.parse("${value.ltv ?? 0}") > 0) {
        ref.watch(ltvDataProvider.notifier).state = value;

        ref.watch(ltvTypeProvider.notifier).state = LTVType.aboveZero;
      }

      ref.invalidate(selectedItem);
    });
  }

  void _pushRepyamentApi(dynamic data) {
    showloader(context);
    ref
        .watch(repayGatepassProvider(
                financeId: ["${data?.id}"],
                finalAmount: data?.totalSettlementAmount.toString(),
                paymentType: ref.watch(paymentType)?.type,
                partPaymentAmount: paymentAmountController.text)
            .future)
        .then((value) {
      hideLoader(context);
      if (value['status'].toString() == "1") {
        ref.invalidate(paymentType);
        paymentAmountController.clear();
        successToast(context, value['message'].toString());
        ref.invalidate(repaymentSettlementListProvider);
        _getTerminalsData();
      } else {
        errorToast(context, value['message'].toString());
      }
    }).onError((e, s) {
      hideLoader(context);
    });
  }

  _settlementUi(dynamic data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.data?.length ?? 0,
        itemBuilder: (context, index) {
          var isSelected = ref.watch(selectedItem) == index;

          // var isSelected = index == 0;

          return InkWell(
            child: IntrinsicHeight(
              child: Container(
                  padding: const Pad(all: 10),
                  margin: Pad(bottom: 10),
                  decoration: BoxDecoration(
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
                                  ColorsConstant.primaryColor.withOpacity(0.9),
                                  ColorsConstant.secondColorDark
                                      .withOpacity(0.9),
                                  ColorsConstant.secondColorSuperDark
                                      .withOpacity(0.9),
                                  ColorsConstant.primaryColor.withOpacity(0.9),
                                ]),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorsConstant.primaryColor)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildRichText(
                                mainText:
                                    'DRF-${data?.data?[index].drfNo ?? 0}',
                                mainTextStyle: TextStyle(
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: Adaptive.sp(17))),
                            buildRichText(
                                mainText: 'Gatepass:',
                                mainTextStyle: TextStyle(
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: Adaptive.sp(17)),
                                children: [
                                  TextSpan(
                                      text:
                                          ' ${data?.data?[index].gatePass ?? 0.0}')
                                ]),
                          ],
                        ),
                        buildRichText(
                            mainText: 'Quantity:',
                            mainTextStyle: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${data?.data?[index].quantity ?? 0.0}')
                            ]),
                        buildRichText(
                            mainText: 'Loan Amount:',
                            mainTextStyle: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${currencyFormat.format(double.parse("${data?.data?[index].totalLoanAmount ?? 0.0}"))}')
                            ]),
                        buildRichText(
                            mainText: 'Interest Amount:',
                            mainTextStyle: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${currencyFormat.format(double.parse("${data?.data?[index].interestAmount ?? 0.0}"))}')
                            ]),
                        buildRichText(
                            mainText: 'Penal Charges:',
                            mainTextStyle: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${currencyFormat.format(num.parse("${data?.data?[index].penalCharges}"))}')
                            ]),
                        buildRichText(
                            mainText: 'Settlement Amount:',
                            mainTextStyle: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text:
                                      ' ${currencyFormat.format(double.parse("${data?.data?[index].totalSettlementAmount ?? 0.0}"))}')
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        if (isSelected)
                          ElevarmTwoChoiceRadioCard<PartPaymentType>(
                            groupValue: ref.watch(paymentType),
                            onChanged: (PartPaymentType newValue) {
                              ref.watch(paymentType.notifier).state = newValue;
                              // on change
                            },
                            items: [
                              ElevarmRadioItemModel(
                                value: PartPaymentType.part,
                                title: PartPaymentType.part.label,
                              ),
                              ElevarmRadioItemModel(
                                value: PartPaymentType.full,
                                title: PartPaymentType.full.label,
                              ),
                            ],
                          ),
                        if (ref.watch(paymentType) == PartPaymentType.part &&
                            isSelected)
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                ElevarmTextInputField(
                                  controller: paymentAmountController,
                                  isRequired: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter amount';
                                    }
                                    if (num.parse('${value ?? "0.0"}') >
                                        num.parse(
                                            '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')) {
                                      return 'Amount should not be greater than wallet balance';
                                    }
                                    if (num.parse('${value ?? "0.0"}') <= 0) {
                                      return 'Amount should not be 0';
                                    }
                                    return null;
                                  },
                                  maxLength: num.parse(
                                          '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')
                                      .toStringAsFixed(0)
                                      .length,
                                  onChanged: (value) {
                                    if (num.parse('${value}') >
                                        num.parse(
                                            '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')) {
                                      ref.watch(errorText.notifier).state =
                                          'Amount should not be greater than wallet balance';
                                    } else if (num.parse('${value ?? "0.0"}') <=
                                        0) {
                                      ref.watch(errorText.notifier).state =
                                          'Amount should not be 0';
                                    } else {
                                      ref.watch(errorText.notifier).state =
                                          null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  hintText: "Enter Amount",
                                  suffixIconAssetName: Icons.money,
                                ),
                                if (ref.watch(errorText) != null)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        ref.watch(errorText) ?? "",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.white,
                                            shadows: [
                                              const Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 0.3)
                                            ],
                                            fontSize: Adaptive.sp(14)),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        Spacer(),
                        if (isSelected)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                // _pushRepyamentApi(
                                //         data.data?[index]);
                                switch (ref.watch(paymentType)) {
                                  case null:
                                    errorToast(
                                        context, 'Please select payment type');
                                    break;
                                  case PartPaymentType.part:
                                    if (_formKey.currentState!.validate()) {
                                      _pushRepyamentApi(data?.data?[index]);
                                    }
                                    break;
                                  case PartPaymentType.full:
                                    _pushRepyamentApi(data.data?[index]);
                                    break;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorsConstant.secondColorDark,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Pay",
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      const Shadow(
                                          color: Colors.white, blurRadius: 0.3)
                                    ],
                                    fontWeight: FontWeight.w700,
                                    fontSize: Adaptive.sp(15)),
                              ),
                            ),
                          ),
                      ])),
            ),
            onTap: () {
              if (num.parse('${data.data?[index].ltv}') >= 90) {
                ref.watch(selectedItem.notifier).state = data.data?[index].id;
              }
              if (ref.watch(selectedItem) == index) {
                ref.invalidate(selectedItem);
              } else {
                ref.watch(selectedItem.notifier).state = index;
              }
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
        });
  }

  _ltvSettlementUi(RepaymentTerminalData? data) => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data?.data?.length ?? 0,
      itemBuilder: (context, index) {
        // var isSelected = ref.watch(selectedItem) ==
        //     data.data?[index].id;

        var isSelected = index == 0;

        return InkWell(
          child: IntrinsicHeight(
            child: Container(
                padding: const Pad(all: 10),
                margin: Pad(bottom: 10),
                decoration: BoxDecoration(
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
                                ColorsConstant.primaryColor.withOpacity(0.9),
                                ColorsConstant.secondColorDark.withOpacity(0.9),
                                ColorsConstant.secondColorSuperDark
                                    .withOpacity(0.9),
                                ColorsConstant.primaryColor.withOpacity(0.9),
                              ]),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorsConstant.primaryColor)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      buildRichText(
                          mainText: '${data?.data?[index].terminal}',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(17)),
                          textAlign: TextAlign.center),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRichText(
                              mainText: 'DRF-${data?.data?[index].drfNo ?? 0}',
                              mainTextStyle: TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: Adaptive.sp(17))),

                          buildRichText(
                              mainText: 'Gatepass:',
                              mainTextStyle: TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: Adaptive.sp(17)),
                              children: [
                                TextSpan(
                                    text:
                                        ' ${data?.data?[index].gatePass ?? 0.0}')
                              ]),

                          // Text(
                          //   "${data.data?[index].terminal}",
                          //   style: TextStyle(
                          //       height: 2,
                          //       fontWeight: FontWeight.normal,
                          //       fontSize: Adaptive.sp(15)),
                          // ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRichText(
                              mainText: 'Commodity:',
                              mainTextStyle: TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: Adaptive.sp(15)),
                              children: [
                                TextSpan(
                                    text:
                                        ' ${data?.data?[index].commodityName ?? 0.0}')
                              ]),
                          buildRichText(
                              mainText:
                                  'Stack No.:${data?.data?[index].stackNumber ?? 0}',
                              mainTextStyle: TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: Adaptive.sp(15))),
                          // Text(
                          //   "${data.data?[index].terminal}",
                          //   style: TextStyle(
                          //       height: 2,
                          //       fontWeight: FontWeight.normal,
                          //       fontSize: Adaptive.sp(15)),
                          // ),
                        ],
                      ),

                      buildRichText(
                          mainText: 'Quantity:',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(15)),
                          children: [
                            TextSpan(
                                text: ' ${data?.data?[index].quantity ?? 0.0}')
                          ]),

                      buildRichText(
                          mainText: 'Loan Amount:',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(15)),
                          children: [
                            TextSpan(
                                text:
                                    ' ${currencyFormat.format(double.parse("${data?.data?[index].totalLoanAmount ?? 0.0}"))}')
                          ]),
                      buildRichText(
                          mainText: 'Interest Amount:',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(15)),
                          children: [
                            TextSpan(
                                text:
                                    ' ${currencyFormat.format(double.parse("${data?.data?[index].loanint ?? 0.0}"))}')
                          ]),
                      buildRichText(
                          mainText: 'Penal Charges:',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(15)),
                          children: [
                            TextSpan(
                                text:
                                    ' ${currencyFormat.format(num.parse("${data?.data?[index].penalCharges}"))}')
                          ]),
                      buildRichText(
                          mainText: 'Settlement Amount:',
                          mainTextStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: Adaptive.sp(15)),
                          children: [
                            TextSpan(
                                text:
                                    ' ${currencyFormat.format(double.parse("${data?.data?[index].totalSettlementAmount ?? 0.0}"))}')
                          ]),

                      // RowSuper(fill: true, children: [
                      //   // Text.rich(
                      //   //   TextSpan(
                      //   //       text: 'Pi Amount: ',
                      //   //       style: TextStyle(
                      //   //           height: 2,
                      //   //           fontWeight: FontWeight.bold,
                      //   //           fontSize: Adaptive.sp(15)),
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

                      SizedBox(
                        height: 10,
                      ),
                      if (isSelected)
                        IntrinsicWidth(
                          child: ElevarmTwoChoiceRadioCard<PartPaymentType>(
                            groupValue: ref.watch(paymentType),
                            onChanged: (PartPaymentType newValue) {
                              ref.watch(paymentType.notifier).state = newValue;
                              // on change
                            },
                            items: [
                              ElevarmRadioItemModel(
                                value: PartPaymentType.part,
                                title: PartPaymentType.part.label,
                              ),
                              ElevarmRadioItemModel(
                                value: PartPaymentType.full,
                                title: PartPaymentType.full.label,
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      if (ref.watch(paymentType) == PartPaymentType.part &&
                          isSelected)
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmTextInputField(
                                controller: paymentAmountController,
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter amount';
                                  }
                                  if (num.parse('${value ?? "0.0"}') >
                                      num.parse(
                                          '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')) {
                                    return 'Amount should not be greater than wallet balance';
                                  }
                                  if (num.parse('${value ?? "0.0"}') <= 0) {
                                    return 'Amount should not be 0';
                                  }
                                  return null;
                                },
                                maxLength: num.parse(
                                        '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')
                                    .toStringAsFixed(0)
                                    .length,
                                onChanged: (value) {
                                  if (num.parse('${value}') >
                                      num.parse(
                                          '${ref.watch(sharedUtilityProvider).getUser()?.wallet ?? "0.0"}')) {
                                    ref.watch(errorText.notifier).state =
                                        'Amount should not be greater than wallet balance';
                                  } else if (num.parse('${value ?? "0.0"}') <=
                                      0) {
                                    ref.watch(errorText.notifier).state =
                                        'Amount should not be 0';
                                  } else {
                                    ref.watch(errorText.notifier).state = null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                hintText: "Enter Amount",
                                suffixIconAssetName: Icons.money,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (ref.watch(errorText) != null)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      ref.watch(errorText) ?? "",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            const Shadow(
                                                color: Colors.black,
                                                blurRadius: 0.3)
                                          ],
                                          fontSize: Adaptive.sp(14)),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),

                      Spacer(),
                      if (isSelected)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              // _pushRepyamentApi(
                              //         data.data?[index]);
                              switch (ref.watch(paymentType)) {
                                case null:
                                  errorToast(
                                      context, 'Please select payment type');
                                  break;
                                case PartPaymentType.part:
                                  if (_formKey.currentState!.validate()) {
                                    _pushRepyamentApi(data?.data?[index]);
                                  }
                                  break;
                                case PartPaymentType.full:
                                  _pushRepyamentApi(data?.data?[index]);
                                  break;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.secondColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Pay",
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.white, blurRadius: 0.3)
                                  ],
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(15)),
                            ),
                          ),
                        ),
                    ])),
          ),
          onTap: () {
            if (num.parse('${data?.data?[index].ltv}') >= 90) {
              ref.watch(selectedItem.notifier).state = data?.data?[index].id;
            }

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
      });
}
