import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/Model/SanctionLimitListModel.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/pdf.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../utils/colors.dart';
import '../../../utils/routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanctioned Amount'),
      ),
      body: ListView(
        children: [
          ref.watch(appliedListProvider).when(
              data: (data) =>(data.data??[]).isEmpty ?emptyData():
                  ListView.builder(
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
                              color: appliedData?.status.toString() == "0"
                                  ? Colors.red
                                  : appliedData?.status.toString() == "1"
                                  ? ColorsConstant.secondColorUltraDark
                                  : appliedData?.status.toString() == "2"
                                  ? ColorsConstant.primaryColor
                                  : appliedData?.status.toString() ==
                                  "3"
                                  ? ColorsConstant
                                  .secondColorUltraDark
                                  : appliedData?.status
                                  .toString() ==
                                  "6"
                                  ? ColorsConstant.primaryColor
                                  : ColorsConstant
                                  .secondColorUltraDark,
                            )),
                        elevation: 6,
                        color: Colors.white,
                        margin: const Pad(all: 10),
                        child: Padding(
                          padding: const Pad(all: 10),
                          child: ColumnSuper(children: [
                            Text(
                              '${appliedData?.uniqueId}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: Adaptive.sp(18),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RowSuper(fill: true, children: [
                              Text(
                                'Scheme Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.schemeName}',
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
                                'Interest Rate',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.interestRate}%',
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
                                'Processing Fee',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.processingFee}%',
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
                                'Loan per Total Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${appliedData?.ltp}',
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
                                '${currencyFormat.format(int.parse(
                                    "${appliedData?.requestedAmount}"))}',
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
                                '${currencyFormat.format(int.parse(
                                    appliedData?.approvedAmount.toString() ??
                                        "0"))}',
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
                                '${appliedData?.verifiedDate ?? "--"}',
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
                                'Status: ${appliedData?.status.toString() == "0"
                                    ? "Rejected"
                                    : appliedData?.status.toString() == "1"
                                    ? "Pending"
                                    : appliedData?.status.toString() == "2"
                                    ? "Approved"
                                    : appliedData?.status.toString() == "3"
                                    ? "Upload Document"
                                    : appliedData?.status.toString() == "4"
                                    ? "Document Verification Pending"
                                    : appliedData?.status.toString() == "5"
                                    ? "Approval Pending"
                                    : appliedData?.status.toString() == "6"
                                    ? "Limit Sanctioned"
                                    : "--"}',
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
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
                                        .primaryColor
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
                                        : ColorsConstant
                                        .secondColorUltraDark,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      );
                    },
                  ),
              error: (e, s) => Text(e.toString()),
              loading: () => SizedBox(height: MediaQuery.of(context).size.height,child: Center(child: defaultLoader(),),)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  downloadUploadAgreementLayout(Datum? appliedData, BuildContext context) =>
      ColumnSuper(children: [
        Row(children: [
          Expanded(
              child: Text(
                'Sanction Letter',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
              )),
          IconButton(
              onPressed: () async {
                
                ref
                    .watch(downloadFileProvider(
                    fileName: "Sanction Letter",
                    url: "${ref.watch(dioProvider).options.baseUrl}sanction_letter_download/${appliedData?.id}")
                    .future)
                    .then((value) {
                  if (value != null) {
                    successToast(context,
                        "${basename(
                            value.path)} successfully downloaded at ${value
                            .path}");
                  }
                });
              },
              icon: const Icon(
                LucideIcons.cloud_download,
                size: 15,
              )),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Expanded(
              child: Text(
                'PDC',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
              )),
          IconButton(
              onPressed: () {
                ref
                    .watch(downloadFileProvider(
                    fileName: "PDC", url: "${ref.watch(dioProvider).options.baseUrl}pdc_download/${appliedData?.id}")
                    .future)
                    .then((value) {
                  if (value != null) {
                    successToast(context,
                        "${basename(
                            value.path)} successfully downloaded at ${value .path}");
                  }
                });
              },
              icon: const Icon(
                LucideIcons.cloud_download,
                size: 15,
              )),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Expanded(
              child: Text(
                'Loan Agreement',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
              )),
          IconButton(
              onPressed: () {
                ref
                    .watch(downloadFileProvider(
                    fileName: "Loan Agreement",
                    url: "${ref.watch(dioProvider).options.baseUrl}loan_agr_download/${appliedData?.id}")
                    .future)
                    .then((value) {
                  if (value != null) {
                    successToast(context,
                        "${basename(
                            value.path)} successfully downloaded at ${value
                            .path}");
                  }
                });
              },
              icon: const Icon(
                LucideIcons.cloud_download,
                size: 15,
              )),
        ]),
        Row(children: [
          Expanded(
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                      type: FileType.custom,allowedExtensions: ['pdf'],);

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    ref
                        .watch(itrFile1.notifier)
                        .state = file;
                  } else {}
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [6, 6, 6, 6],
                    color: ColorsConstant.primaryColor,
                    child: Padding(
                      padding: const Pad(all: 20),
                      child: Center(
                        child: ref.watch(itrFile1) != null
                            ? ColumnSuper(
                            alignment: Alignment.center, children: [
                          const Icon(
                            LucideIcons.file,
                            color: ColorsConstant.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "${basename(ref
                                  .watch(itrFile1)
                                  ?.path ?? "")}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          )
                        ])
                            : ColumnSuper(children: [
                          const Icon(LucideIcons.file),
                          const SizedBox(
                            height: 10,
                          ),
                          TextOneLine('Sanction Letter*',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)))
                        ]),
                      ),
                    )),
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                      type: FileType.custom,allowedExtensions: ['pdf'],);

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    ref
                        .watch(itrFile2.notifier)
                        .state = file;
                  } else {}
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [6, 6, 6, 6],
                    color: ColorsConstant.primaryColor,
                    child: Padding(
                      padding: const Pad(all: 20),
                      child: Center(
                        child: ref.watch(itrFile2) != null
                            ? ColumnSuper(
                            alignment: Alignment.center, children: [
                          const Icon(
                            LucideIcons.file,
                            color: ColorsConstant.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "${basename(ref
                                  .watch(itrFile2)
                                  ?.path ?? "")}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          )
                        ])
                            : ColumnSuper(children: [
                          const Icon(LucideIcons.file),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('PDC*',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)))
                        ]),
                      ),
                    )),
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                      type: FileType.custom,allowedExtensions: ['pdf'],);

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    ref
                        .watch(itrFile3.notifier)
                        .state = file;
                  } else {}
                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [6, 6, 6, 6],
                    color: ColorsConstant.primaryColor,
                    child: Padding(
                      padding: const Pad(all: 20),
                      child: Center(
                        child: ref.watch(itrFile3) != null
                            ? ColumnSuper(
                            alignment: Alignment.center, children: [
                          const Icon(
                            LucideIcons.file,
                            color: ColorsConstant.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "${basename(ref
                                  .watch(itrFile3)
                                  ?.path ?? "")}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          )
                        ])
                            : ColumnSuper(children: [
                          const Icon(LucideIcons.file),
                          const SizedBox(
                            height: 10,
                          ),
                          TextOneLine('Loan agreement*',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)))
                        ]),
                      ),
                    )),
              ))
        ]),
        const SizedBox(
          height: 10,
        ),
        ref.watch(itrFile1) == null ||
            ref.watch(itrFile2) == null ||
            ref.watch(itrFile3) == null
            ? SizedBox()
            : SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ElevatedButton(
            onPressed: () async {
              showloader(context);
              ref.watch(submitSanctionDocumentsProvider(id: "${appliedData?.id}",
                  triAgreement: ref.watch(itrFile1),
                  pdc: ref.watch(itrFile2),
                  agreement: ref.watch(itrFile3)).future).then((value) {
                hideLoader(context);
                if (value['status'].toString() == "1") {
                 ref.invalidate(appliedListProvider);
                  successToast(context,
                      value['message'].toString());
                } else {
                  errorToast(context,
                      value['message'].toString());
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
}
