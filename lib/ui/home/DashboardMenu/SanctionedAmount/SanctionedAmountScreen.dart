import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/BankListModel.dart';
import 'package:swfl/Data/Model/SanctionLimitListModel.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/main.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/LifeCycleWatcher.dart';
import 'package:swfl/ui/utils/pdf.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/colors.dart';

class Sanctionedamountscreen extends ConsumerStatefulWidget {
  const Sanctionedamountscreen({super.key});

  @override
  ConsumerState<Sanctionedamountscreen> createState() =>
      _SanctionedamountscreenState();
}

class _SanctionedamountscreenState
    extends ConsumerState<Sanctionedamountscreen> {
  var itrFile1 = StateProvider<File?>((ref) => null);
  var itrFile2 = StateProvider<File?>((ref) => null);
  var itrFile3 = StateProvider<File?>((ref) => null);
  var chequeFile1 = StateProvider<File?>((ref) => null);
  var chequeFile2 = StateProvider<File?>((ref) => null);
  final formKey = GlobalKey<FormState>();
  var bankProvider = StateProvider<BankDatum?>((ref) => null);
  final _bankAccountController = TextEditingController();
  final _bankBranchController = TextEditingController();
  final _chequeNumberOneController = TextEditingController();
  final _chequeNumberTwoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LifecycleWatcher(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sanctioned Amount'),
          ),
          body: ListView(
            children: [
              ref.watch(appliedListProvider).when(
                  data: (data) {
                    return (data.data ?? []).isEmpty
                        ? emptyData()
                        : ListView.builder(
                            itemCount: data.data?.length ?? 0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var appliedData = data.data?[index];
                              return Card(
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      width: 2,
                                      color: appliedData?.status.toString() ==
                                              "0"
                                          ? Colors.red
                                          : appliedData?.status.toString() ==
                                                  "1"
                                              ? ColorsConstant
                                                  .secondColorUltraDark
                                              : appliedData?.status
                                                          .toString() ==
                                                      "2"
                                                  ? ColorsConstant
                                                      .secondColorUltraDark
                                                  : appliedData?.status
                                                              .toString() ==
                                                          "3"
                                                      ? ColorsConstant
                                                          .secondColorUltraDark
                                                      : appliedData?.status
                                                                  .toString() ==
                                                              "6"
                                                          ? ColorsConstant
                                                              .primaryColor
                                                          : appliedData?.status
                                                                      .toString() ==
                                                                  "7"
                                                              ? Colors.red
                                                              : ColorsConstant
                                                                  .secondColorUltraDark,
                                    )),
                                elevation: 6,
                                color: Colors.white,
                                margin: const Pad(all: 10),
                                child: Padding(
                                  padding: const Pad(all: 10),
                                  child: ColumnSuper(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '${appliedData?.uniqueId}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: Adaptive.sp(18),
                                              fontWeight: FontWeight.bold),
                                        )),
                                        TextButton(
                                            onPressed: () {
                                              ref
                                                  .watch(sanctionSchemesProvider(
                                                          id: "${appliedData?.id}")
                                                      .future)
                                                  .then((data) {
                                                showBarModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        Consumer(
                                                            builder: (context,
                                                                    ref,
                                                                    child) =>
                                                                SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        padding:
                                                                            const Pad(all: 10),
                                                                        color: ColorsConstant
                                                                            .secondColorDark,
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                  child: Text(
                                                                                "Scheme Name",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    fontSize: Adaptive.sp(
                                                                                        14),
                                                                                    shadows: const [
                                                                                      Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))
                                                                                    ],
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.w800),
                                                                              )),
                                                                              Expanded(child: Text("Processing Fee(%)", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(14), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.white, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text("Interest Rate(%)", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(14), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.white, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text("Loan To Value(%)", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(14), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.white, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text("Tenor", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(14), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.white, fontWeight: FontWeight.w800))),
                                                                              // Expanded(
                                                                              //     child: Text("Days",
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: TextStyle(
                                                                              //             fontSize: Adaptive.sp(13),
                                                                              //             shadows: const [
                                                                              //               Shadow(
                                                                              //                   color: Colors.white,
                                                                              //                   blurRadius: 1,
                                                                              //                   offset: Offset(0.2, 0.2))
                                                                              //             ],
                                                                              //             color: Colors.white,
                                                                              //             fontWeight: FontWeight.w800)))
                                                                            ]),
                                                                      ),
                                                                      ListView
                                                                          .builder(
                                                                        itemCount: data
                                                                            .data
                                                                            ?.length,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context, schemeIndex) =>
                                                                                Container(
                                                                          color: schemeIndex % 2 == 0
                                                                              ? Colors.grey.withOpacity(0.1)
                                                                              : Colors.white,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const Pad(all: 10),
                                                                            child:
                                                                                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              Expanded(child: Text("${data.data?[schemeIndex].scheme?.schemeName ?? ""}", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(15), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.black, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text(data.data?[schemeIndex].processingFee ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(15), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.black, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text(data.data?[schemeIndex].interestRate ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(15), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.black, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text(data.data?[schemeIndex].scheme?.loanPerTotalAmount ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(15), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.black, fontWeight: FontWeight.w800))),
                                                                              Expanded(child: Text("${data.data?[schemeIndex].scheme?.tenor} ${data.data?[schemeIndex].scheme?.tenorType}", textAlign: TextAlign.center, style: TextStyle(fontSize: Adaptive.sp(15), shadows: const [Shadow(color: Colors.white, blurRadius: 1, offset: Offset(0.2, 0.2))], color: Colors.black, fontWeight: FontWeight.w800))),
                                                                              // Expanded(
                                                                              //     child: Text(
                                                                              //         data.data?[index]
                                                                              //                 .loanPassDays ??
                                                                              //             "",
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: TextStyle(
                                                                              //             fontSize: Adaptive.sp(15),
                                                                              //             shadows: const [
                                                                              //               Shadow(
                                                                              //                   color: Colors.white,
                                                                              //                   blurRadius: 1,
                                                                              //                   offset: Offset(
                                                                              //                       0.2, 0.2))
                                                                              //             ],
                                                                              //             color: Colors.black,
                                                                              //             fontWeight:
                                                                              //                 FontWeight.w800)))
                                                                            ]),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )));
                                              });
                                            },
                                            child: Text('view schemes'))
                                      ],
                                    ),

                                    // RowSuper(fill: true, children: [
                                    //   Text(
                                    //     'Scheme Name',
                                    //     textAlign: TextAlign.start,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   Text(
                                    //     '${appliedData?.schemeName}',
                                    //     textAlign: TextAlign.end,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.w500),
                                    //   )
                                    // ]),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    // RowSuper(fill: true, children: [
                                    //   Text(
                                    //     'Interest Rate',
                                    //     textAlign: TextAlign.start,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   Text(
                                    //     '${appliedData?.interestRate}%',
                                    //     textAlign: TextAlign.end,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.w500),
                                    //   )
                                    // ]),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    // RowSuper(fill: true, children: [
                                    //   Text(
                                    //     'Processing Fee',
                                    //     textAlign: TextAlign.start,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   Text(
                                    //     '${appliedData?.processingFee}%',
                                    //     textAlign: TextAlign.end,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.w500),
                                    //   )
                                    // ]),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    // RowSuper(fill: true, children: [
                                    //   Text(
                                    //     'Loan per Total Amount',
                                    //     textAlign: TextAlign.start,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   Text(
                                    //     '${appliedData?.ltp}',
                                    //     textAlign: TextAlign.end,
                                    //     style: TextStyle(
                                    //         fontSize: Adaptive.sp(15),
                                    //         fontWeight: FontWeight.w500),
                                    //   )
                                    // ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    if (appliedData?.type != null)
                                      RowSuper(fill: true, children: [
                                        Text(
                                          'Type	',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(15),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${appliedData?.type}',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(15),
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowSuper(fill: true, children: [
                                      Text(
                                        'Requested Amount(Lakh)	',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${currencyFormat.format(num.parse("${appliedData?.requestedAmount ?? "0"}"))}',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowSuper(fill: true, children: [
                                      Text(
                                        'Approved Amount(Lakh)		',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${currencyFormat.format(num.parse(appliedData?.approvedAmount.toString() ?? "0"))}',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RowSuper(fill: true, children: [
                                      Text(
                                        'Request Date',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        appliedData?.createdAt == null
                                            ? "--"
                                            : "${DateFormat('dd-MMMM-yyyy').format((appliedData?.createdAt as DateTime))}",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    appliedData?.status.toString() == "3"
                                        ? downloadUploadAgreementLayout(
                                            appliedData, context)
                                        : TextOneLine(
                                            'Status: ${appliedData?.status.toString() == "0" ? "Rejected" : appliedData?.status.toString() == "1" ? "Pending" : appliedData?.status.toString() == "2" ? "Pending" : appliedData?.status.toString() == "3" ? "Upload Document" : appliedData?.status.toString() == "4" ? "Document Verification Pending" : appliedData?.status.toString() == "5" ? "Approval Pending" : appliedData?.status.toString() == "6" ? "Limit Sanctioned" : appliedData?.status.toString() == "7" ? 'Limit Closed' : "--"}',
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(16),
                                                color: appliedData?.status
                                                            .toString() ==
                                                        "0"
                                                    ? Colors.red
                                                    : appliedData?.status
                                                                .toString() ==
                                                            "1"
                                                        ? ColorsConstant
                                                            .secondColorUltraDark
                                                        : appliedData
                                                                    ?.status
                                                                    .toString() ==
                                                                "2"
                                                            ? ColorsConstant
                                                                .secondColorUltraDark
                                                            : appliedData
                                                                        ?.status
                                                                        .toString() ==
                                                                    "3"
                                                                ? ColorsConstant
                                                                    .secondColorUltraDark
                                                                : appliedData
                                                                            ?.status
                                                                            .toString() ==
                                                                        "6"
                                                                    ? ColorsConstant
                                                                        .primaryColor
                                                                    : appliedData?.status.toString() ==
                                                                            "7"
                                                                        ? Colors
                                                                            .red
                                                                        : ColorsConstant
                                                                            .secondColorUltraDark,
                                                fontWeight: FontWeight.bold))
                                  ]),
                                ),
                              );
                            },
                          );
                  },
                  error: (e, s) => Text(e.toString()),
                  loading: () => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: defaultLoader(),
                        ),
                      )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        onResume: () {
          ref.invalidate(appliedListProvider);

          setState(() {});
        });
  }

  downloadUploadAgreementLayout(Datum? appliedData, BuildContext context) =>
      ColumnSuper(children: [
        SizedBox(
          height: 10,
        ),
        ElevarmDivider(),
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Expanded(
              child: Text(
            'Sanction Letter',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
          )),
          appliedData?.triAgreement != null
              ? const Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 15,
                )
              : ElevarmLinkPrimaryButton.icon(
                  text: 'Esign',
                  onPressed: () async {
                    showloader(context);
                    ref
                        .watch(surepassSanctionLetterProvider(
                                id: "${appliedData?.id}")
                            .future)
                        .then((value) async {
                      hideLoader(context);
                      if (value['status'].toString() == "1") {
                        context.goNamed(RoutesStrings.surepassWebviewScreen,
                            extra: {
                              'url': value['data'],
                              'docName': 'sanction_letter',
                             
                            });
                      } else {
                        errorToast(context, value['message'].toString());
                      }
                    });
                  },
                  leadingIconAssetName: null,
                  trailingIconAssetName: Icons.upload_file_outlined,
                )
        ]),
        const SizedBox(
          height: 10,
        ),
        if (appliedData?.triAgreement != null)
          Row(children: [
            Expanded(
                child: Text(
              'Loan Agreement',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
            )),
            appliedData?.agreement != null
                ? const Icon(
                    Icons.verified,
                    color: Colors.green,
                    size: 15,
                  )
                : ElevarmLinkPrimaryButton.icon(
                    text: 'Esign',
                    onPressed: () async {
                      showloader(context);
                      ref
                          .watch(surepassLoanAgreementProvider(
                                  id: "${appliedData?.id}")
                              .future)
                          .then((value) async {
                        hideLoader(context);
                        if (value['status'].toString() == "1") {
                          context.goNamed(RoutesStrings.surepassWebviewScreen,
                              extra: {
                                'url': value['data'],
                                'docName': 'loan_agreement',
                                
                              });
                        } else {
                          errorToast(context, value['message']);
                        }

                        // successToast(context, "${value['data']}");
                      });
                    },
                    leadingIconAssetName: null,
                    trailingIconAssetName: Icons.upload_file_outlined,
                  )
          ]),
        if ("${appliedData?.type}".toLowerCase() != ('renewal') &&
            appliedData?.triAgreement != null &&
            appliedData?.agreement != null)
          const SizedBox(
            height: 10,
          ),
        if ("${appliedData?.type}".toLowerCase() != ('renewal') &&
            appliedData?.triAgreement != null &&
            appliedData?.agreement != null)
          Row(children: [
            Expanded(
                child: Text(
              'PDC',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
            )),
            ElevarmLinkPrimaryButton.icon(
              text: 'Esign',
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'PDC Form',
                            style: TextStyle(
                                color: ColorsConstant.secondColorDark,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          content: pdcPopUpLayout(appliedData, dialogContext),
                        ));
              },
              leadingIconAssetName: null,
              trailingIconAssetName: Icons.upload_file_outlined,
            )
            // Downloader(
            //     fileName: 'PDC',
            //     url:
            //         "${ref.watch(dioProvider).options.baseUrl}pdc_download/${appliedData?.id}"),
          ]),
        if ("${appliedData?.type}".toLowerCase() != ('renewal') &&
            appliedData?.triAgreement != null &&
            appliedData?.agreement != null)
          const SizedBox(
            height: 10,
          ),
        Row(children: [
          // Expanded(
          //     child: InkWell(
          //   onTap: () async {
          //     FilePickerResult? result = await FilePicker.platform.pickFiles(
          //       type: FileType.custom,
          //       allowedExtensions: ['pdf'],
          //     );
          //
          //     if (result != null) {
          //       File file = File(result.files.single.path!);
          //       ref.watch(itrFile1.notifier).state = file;
          //     } else {}
          //   },
          //   child: DottedBorder(
          //       borderType: BorderType.RRect,
          //       dashPattern: const [6, 6, 6, 6],
          //       color: ColorsConstant.primaryColor,
          //       child: Padding(
          //         padding: const Pad(all: 20),
          //         child: Center(
          //           child: ref.watch(itrFile1) != null
          //               ? ColumnSuper(alignment: Alignment.center, children: [
          //                   const Icon(
          //                     LucideIcons.file,
          //                     color: ColorsConstant.primaryColor,
          //                   ),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   Center(
          //                     child: Text(
          //                       "${basename(ref.watch(itrFile1)?.path ?? "")}",
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: Adaptive.sp(14)),
          //                       textAlign: TextAlign.center,
          //                       maxLines: 2,
          //                     ),
          //                   )
          //                 ])
          //               : ColumnSuper(children: [
          //                   const Icon(LucideIcons.file),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   TextOneLine('Sanction Letter*',
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: Adaptive.sp(14)))
          //                 ]),
          //         ),
          //       )),
          // )),
          const SizedBox(
            width: 5,
          ),
          // if ("${appliedData?.type}".toLowerCase() != ('renewal') &&
          //     appliedData?.triAgreement != null &&
          //     appliedData?.agreement != null)
          //   Expanded(
          //       child: InkWell(
          //     onTap: () async {
          //       FilePickerResult? result = await FilePicker.platform.pickFiles(
          //         type: FileType.custom,
          //         allowedExtensions: ['pdf'],
          //       );

          //       if (result != null) {
          //         File file = File(result.files.single.path!);
          //         ref.watch(itrFile2.notifier).state = file;
          //       } else {}
          //     },
          //     child: DottedBorder(
          //         borderType: BorderType.RRect,
          //         dashPattern: const [6, 6, 6, 6],
          //         color: ColorsConstant.primaryColor,
          //         child: Padding(
          //           padding: const Pad(all: 20),
          //           child: Center(
          //             child: ref.watch(itrFile2) != null
          //                 ? ColumnSuper(alignment: Alignment.center, children: [
          //                     const Icon(
          //                       LucideIcons.file,
          //                       color: ColorsConstant.primaryColor,
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     Center(
          //                       child: Text(
          //                         "${basename(ref.watch(itrFile2)?.path ?? "")}",
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: Adaptive.sp(14)),
          //                         textAlign: TextAlign.center,
          //                         maxLines: 2,
          //                       ),
          //                     )
          //                   ])
          //                 : ColumnSuper(children: [
          //                     const Icon(LucideIcons.file),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     Text('PDC*',
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: Adaptive.sp(14)))
          //                   ]),
          //           ),
          //         )),
          //   )),
          const SizedBox(
            width: 5,
          ),
          //  Expanded(
          //     child: InkWell(
          //   onTap: () async {
          //     FilePickerResult? result = await FilePicker.platform.pickFiles(
          //       type: FileType.custom,
          //       allowedExtensions: ['pdf'],
          //     );
          //
          //     if (result != null) {
          //       File file = File(result.files.single.path!);
          //       ref.watch(itrFile3.notifier).state = file;
          //     } else {}
          //   },
          //   child: DottedBorder(
          //       borderType: BorderType.RRect,
          //       dashPattern: const [6, 6, 6, 6],
          //       color: ColorsConstant.primaryColor,
          //       child: Padding(
          //         padding: const Pad(all: 20),
          //         child: Center(
          //           child: ref.watch(itrFile3) != null
          //               ? ColumnSuper(alignment: Alignment.center, children: [
          //                   const Icon(
          //                     LucideIcons.file,
          //                     color: ColorsConstant.primaryColor,
          //                   ),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   Center(
          //                     child: Text(
          //                       "${basename(ref.watch(itrFile3)?.path ?? "")}",
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: Adaptive.sp(14)),
          //                       textAlign: TextAlign.center,
          //                       maxLines: 2,
          //                     ),
          //                   )
          //                 ])
          //               : ColumnSuper(children: [
          //                   const Icon(LucideIcons.file),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   TextOneLine('Loan agreement*',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: Adaptive.sp(14)))
          //                 ]),
          //         ),
          //       )),
          // ))
        ]),
        const SizedBox(
          height: 10,
        ),
        ref.watch(itrFile2) == null
            ? SizedBox()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    showloader(context);
                    ref
                        .watch(submitSanctionDocumentsProvider(
                                id: "${appliedData?.id}",
                                triAgreement: ref.watch(itrFile1),
                                pdc: ref.watch(itrFile2),
                                agreement: ref.watch(itrFile3))
                            .future)
                        .then((value) {
                      hideLoader(context);
                      if (value['status'].toString() == "1") {
                        ref.invalidate(appliedListProvider);
                        successToast(context, value['message'].toString());
                      } else {
                        errorToast(context, value['message'].toString());
                      }
                    }).onError((e, s) {
                      hideLoader(context);
                    });
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
                          const Shadow(color: Colors.white, blurRadius: 0.3)
                        ],
                        fontWeight: FontWeight.w700,
                        fontSize: Adaptive.sp(16)),
                  ),
                ),
              ),
      ]);

  Widget pdcPopUpLayout(dynamic appliedData, BuildContext dialogContext) =>
      Consumer(
          builder: (context, ref, _) => Form(
              key: formKey,
              child: SingleChildScrollView(
                  padding: Pad(all: 10),
                  child: ref.watch(bankListProvider).when(
                      data: (data) => Column(
                            children: [
                              DropdownSearch<BankDatum?>(
                                validator: (value) {
                                  if (value == null || value.bankName.isEmpty) {
                                    return 'Please input valid bank name';
                                  }
                                  return null;
                                },
                                popupProps: PopupProps.menu(
                                    searchFieldProps: const TextFieldProps(
                                        autofocus: true,
                                        cursorColor: ColorsConstant
                                            .primaryColor,
                                        padding: Pad(left: 10, right: 10),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              Pad(left: 10, right: 10),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
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
                                                color: ColorsConstant
                                                    .primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    itemBuilder:
                                        (context, terminal, isVisible) =>
                                            ColumnSuper(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Padding(
                                                    padding: const Pad(all: 10),
                                                    child: Text(
                                                      "${terminal?.bankName}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              Adaptive.sp(16)),
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
                                        'Select Bank',
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
                                    user?.stateFilterByName(filter) ?? false,
                                // asyncItems: (String filter) => getData(filter),

                                items: data.data ?? [],
                                itemAsString: (BankDatum? u) =>
                                    "${u?.bankName}",
                                onChanged: (BankDatum? data) => ref
                                    .watch(bankProvider.notifier)
                                    .state = data,
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      contentPadding:
                                          Pad(left: 10, bottom: 5, top: 5),
                                      hintText: "Select Bank",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: ColorsConstant
                                                  .secondColorUltraDark))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmTextInputField(
                                hintText: "Bank Account Number",
                                helperText: 'Please input bank account number',
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: _bankAccountController,
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please input valid value';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmTextInputField(
                                hintText: "Cheque Belonging Branch",
                                helperText: 'Input Cheque Belonging Branch',
                                isRequired: true,
                                controller: _bankBranchController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please input valid value';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmTextInputField(
                                hintText: "Cheque number 1",
                                helperText: 'Cheque number 1',
                                controller: _chequeNumberOneController,
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please input valid value';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmTextInputField(
                                hintText: "Cheque number 2",
                                helperText: 'Cheque number 2',
                                isRequired: true,
                                controller: _chequeNumberTwoController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please input valid value';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.image,
                                  );

                                  if (result != null) {
                                    File file = File(result.files.single.path!);
                                    ref.watch(chequeFile1.notifier).state =
                                        file;
                                  } else {}
                                },
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    dashPattern: const [6, 6, 6, 6],
                                    color: ColorsConstant.primaryColor,
                                    child: Padding(
                                      padding: const Pad(all: 20),
                                      child: Center(
                                        child: ref.watch(chequeFile1) != null
                                            ? ColumnSuper(
                                                alignment: Alignment.center,
                                                children: [
                                                    const Icon(
                                                      LucideIcons.file,
                                                      color: ColorsConstant
                                                          .primaryColor,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "${basename(ref.watch(chequeFile1)?.path ?? "")}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14)),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                      ),
                                                    )
                                                  ])
                                            : ColumnSuper(children: [
                                                const Icon(LucideIcons.file),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Cheque Image',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Adaptive.sp(14)))
                                              ]),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.image,
                                  );

                                  if (result != null) {
                                    File file = File(result.files.single.path!);
                                    ref.watch(chequeFile2.notifier).state =
                                        file;
                                  } else {}
                                },
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    dashPattern: const [6, 6, 6, 6],
                                    color: ColorsConstant.primaryColor,
                                    child: Padding(
                                      padding: const Pad(all: 20),
                                      child: Center(
                                        child: ref.watch(chequeFile2) != null
                                            ? ColumnSuper(
                                                alignment: Alignment.center,
                                                children: [
                                                    const Icon(
                                                      LucideIcons.file,
                                                      color: ColorsConstant
                                                          .primaryColor,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "${basename(ref.watch(chequeFile2)?.path ?? "")}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14)),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                      ),
                                                    )
                                                  ])
                                            : ColumnSuper(children: [
                                                const Icon(LucideIcons.file),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Stamp Image',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Adaptive.sp(14)))
                                              ]),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevarmPrimaryButton.text(
                                text: "Submit",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (ref.watch(chequeFile1) == null) {
                                      errorToast(context,
                                          'Please select cheque image');
                                    } else {
                                      showloader(context);
                                      ref
                                          .watch(surepassPdcProvider(
                                                  id: "${appliedData?.id}",
                                                  bankName: ref
                                                      .watch(bankProvider)
                                                      ?.bankName,
                                                  accountNumber:
                                                      _bankAccountController
                                                          .text,
                                                  bankBranch:
                                                      _bankBranchController
                                                          .text,
                                                  chequeNo1:
                                                      _chequeNumberOneController
                                                          .text,
                                                  chequeNo2:
                                                      _chequeNumberTwoController
                                                          .text,
                                                  chequeImage:
                                                      ref.watch(chequeFile1),
                                                  stampImage:
                                                      ref.watch(chequeFile2))
                                              .future)
                                          .then((value) async {
                                        hideLoader(context);
                                        if (value['status'].toString() == "1") {
                                          Navigator.of(dialogContext,
                                                  rootNavigator: false)
                                              .pop([
                                            ref.watch(goRouterProvider).goNamed(
                                                RoutesStrings
                                                    .surepassWebviewScreen,
                                                extra: {
                                                  'url': value['data'],
                                                  'docName': 'pdc',
                                                 
                                                })
                                          ]);
                                          successToast(context,
                                              value['message'].toString());
                                        } else {
                                          errorToast(context,
                                              value['message'].toString());
                                        }

                                        // successToast(context, "${value['data']}");
                                      }).onError((e, s) {
                                        hideLoader(context);
                                        showErrorDialog(context,
                                            titleText: 'Error',
                                            messageText: "${e}");
                                      });
                                    }
                                  }
                                },
                                buttonThemeData: ElevarmPrimaryButtonThemeData(
                                    primaryColor: ColorsConstant.primaryColor),
                              )
                            ],
                          ),
                      error: (e, s) => Container(),
                      loading: () => Center(
                            child: defaultLoader(),
                          )))));
}
