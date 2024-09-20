import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../utils/colors.dart';

class Applyforloan extends ConsumerStatefulWidget {
  const Applyforloan({super.key});

  @override
  ConsumerState<Applyforloan> createState() => _ApplyforloanState();
}

class _ApplyforloanState extends ConsumerState<Applyforloan> {
  var loanTypeProvider = StateProvider((ref) => "Select Loan Type");
  var loanTypeList = ['Commodity Finance'];
  final formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();

  var itrFile1 = StateProvider<File?>((ref) => null);
  var itrFile2 = StateProvider<File?>((ref) => null);
  var itrFile3 = StateProvider<File?>((ref) => null);

  var bsFile1 = StateProvider<File?>((ref) => null);
  var bsFile2 = StateProvider<File?>((ref) => null);
  var bsFile3 = StateProvider<File?>((ref) => null);
  var schemeActionProvider = StateProvider<String>((ref) => '');
  var checkBoxValueProvider = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply for loan'),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const Pad(all: 10),
            child: ListView(
              children: [
                CupertinoButton(
                    child: Text('Select Loan Type',
                        style: TextStyle(
                            color: ColorsConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    onPressed: () => null),
                DropdownSearch<String>(
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
                                    "${terminal}",
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
                          'Select Loan Type',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      showSearchBox: true,
                      searchDelay: const Duration(microseconds: 500)),
                  items: loanTypeList ?? [],
                  itemAsString: (String? u) => u ?? "",
                  onChanged: (String? data) =>
                      ref.watch(loanTypeProvider.notifier).state = data ?? "",
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        contentPadding: Pad(left: 10, bottom: 5, top: 5),
                        hintText: "Select Loan Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: ColorsConstant.secondColorUltraDark))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                    child: Text('Enter Amount',
                        style: TextStyle(
                            color: ColorsConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    onPressed: () => null),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value == "0") {
                      return 'Please input Valid amount';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Amount",
                      label: const Text("Enter Amount"),
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
                CupertinoButton(
                    child: Text('ITR last 3 years',
                        style: TextStyle(
                            color: ColorsConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf']);

                      if (result != null) {
                        File file = File(result.files.single.path!);
                      } else {}
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf']);

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        ref.watch(itrFile1.notifier).state = file;
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
                                    alignment: Alignment.center,
                                    children: [
                                        const Icon(
                                          LucideIcons.file,
                                          color: ColorsConstant.primaryColor,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            "${basename(ref.watch(itrFile1)?.path ?? "")}",
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
                                    Text('ITR File 1*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(14)))
                                  ]),
                          ),
                        )),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf']);

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        ref.watch(itrFile2.notifier).state = file;
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
                                    alignment: Alignment.center,
                                    children: [
                                        const Icon(
                                          LucideIcons.file,
                                          color: ColorsConstant.primaryColor,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            "${basename(ref.watch(itrFile2)?.path ?? "")}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(14)),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        )
                                      ])
                                : ColumnSuper(children: [
                                    const Icon(
                                      LucideIcons.file,
                                      color: ColorsConstant.primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'ITR File 2*',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(14)),
                                    )
                                  ]),
                          ),
                        )),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf']);

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        ref.watch(itrFile3.notifier).state = file;
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
                                    alignment: Alignment.center,
                                    children: [
                                        const Icon(
                                          LucideIcons.file,
                                          color: ColorsConstant.primaryColor,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            "${basename(ref.watch(itrFile3)?.path ?? "")}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(14)),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        )
                                      ])
                                : ColumnSuper(children: [
                                    const Icon(
                                      LucideIcons.file,
                                      color: ColorsConstant.primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'ITR File 3*',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Adaptive.sp(14)),
                                    )
                                  ]),
                          ),
                        )),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                CupertinoButton(
                    child: Text('Balance Sheet last 3 years',
                        style: TextStyle(
                            color: ColorsConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    onPressed: () async {}),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          ref.watch(bsFile1.notifier).state = file;
                        } else {}
                      },
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [6, 6, 6, 6],
                          color: ColorsConstant.primaryColor,
                          child: Padding(
                            padding: const Pad(all: 20),
                            child: Center(
                              child: ref.watch(bsFile1) != null
                                  ? ColumnSuper(
                                      alignment: Alignment.center,
                                      children: [
                                          const Icon(
                                            LucideIcons.file,
                                            color: ColorsConstant.primaryColor,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              "${basename(ref.watch(bsFile1)?.path ?? "")}",
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
                                      Text('Balance Sheet File 1*',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(14)))
                                    ]),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          ref.watch(bsFile2.notifier).state = file;
                        } else {}
                      },
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [6, 6, 6, 6],
                          color: ColorsConstant.primaryColor,
                          child: Padding(
                            padding: const Pad(all: 20),
                            child: Center(
                              child: ref.watch(bsFile2) != null
                                  ? ColumnSuper(
                                      alignment: Alignment.center,
                                      children: [
                                          const Icon(
                                            LucideIcons.file,
                                            color: ColorsConstant.primaryColor,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              "${basename(ref.watch(bsFile2)?.path ?? "")}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Adaptive.sp(14)),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            ),
                                          )
                                        ])
                                  : ColumnSuper(children: [
                                      const Icon(
                                        LucideIcons.file,
                                        color: ColorsConstant.primaryColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('Balance Sheet File 2*',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(14)))
                                    ]),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          ref.watch(bsFile3.notifier).state = file;
                        } else {}
                      },
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [6, 6, 6, 6],
                          color: ColorsConstant.primaryColor,
                          child: Padding(
                            padding: const Pad(all: 20),
                            child: ref.watch(bsFile3) != null
                                ? ColumnSuper(
                                    alignment: Alignment.center,
                                    children: [
                                        const Icon(
                                          LucideIcons.file,
                                          color: ColorsConstant.primaryColor,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Text(
                                            "${basename(ref.watch(itrFile3)?.path ?? "")}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(14)),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        )
                                      ])
                                : Center(
                                    child: ColumnSuper(children: [
                                      const Icon(
                                        LucideIcons.file,
                                        color: ColorsConstant.primaryColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('Balance Sheet File 3*',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Adaptive.sp(14)))
                                    ]),
                                  ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                    child: Text('Select Scheme',
                        style: TextStyle(
                            color: ColorsConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    onPressed: () async {}),
                Container(
                  padding: const Pad(all: 10),
                  color: ColorsConstant.secondColorDark,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Adaptive.sp(14),
                              shadows: const [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 1,
                                    offset: Offset(0.2, 0.2))
                              ],
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )),
                        Expanded(
                            child: Text(
                          "Scheme Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Adaptive.sp(14),
                              shadows: const [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 1,
                                    offset: Offset(0.2, 0.2))
                              ],
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )),
                        Expanded(
                            child: Text("Processing Fee(%)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(14),
                                    shadows: const [
                                      Shadow(
                                          color: Colors.white,
                                          blurRadius: 1,
                                          offset: Offset(0.2, 0.2))
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800))),
                        Expanded(
                            child: Text("Interest Rate(%)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(14),
                                    shadows: const [
                                      Shadow(
                                          color: Colors.white,
                                          blurRadius: 1,
                                          offset: Offset(0.2, 0.2))
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800))),
                        Expanded(
                            child: Text("Loan To Value(%)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(14),
                                    shadows: const [
                                      Shadow(
                                          color: Colors.white,
                                          blurRadius: 1,
                                          offset: Offset(0.2, 0.2))
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800))),
                        Expanded(
                            child: Text("Days",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(13),
                                    shadows: const [
                                      Shadow(
                                          color: Colors.white,
                                          blurRadius: 1,
                                          offset: Offset(0.2, 0.2))
                                    ],
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)))
                      ]),
                ),
                ref.watch(schemesProvider).when(
                    data: (data) => ListView.builder(
                          itemCount: data.data?.length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            color: index % 2 == 0
                                ? Colors.grey.withOpacity(0.1)
                                : Colors.white,
                            child: Padding(
                              padding: const Pad(all: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Radio<String?>(
                                        activeColor:
                                            ColorsConstant.primaryColor,
                                        value: data.data?[index].id.toString(),
                                        groupValue: ref
                                            .watch(schemeActionProvider)
                                            .toString(),
                                        onChanged: (String? value) {
                                          ref
                                              .watch(
                                                  schemeActionProvider.notifier)
                                              .state = value.toString();
                                          successToast(
                                              context, value.toString());
                                        },
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                            data.data?[index].schemeName ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.white,
                                                      blurRadius: 1,
                                                      offset: Offset(0.2, 0.2))
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800))),
                                    Expanded(
                                        child: Text(
                                            data.data?[index].processingFee ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.white,
                                                      blurRadius: 1,
                                                      offset: Offset(0.2, 0.2))
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800))),
                                    Expanded(
                                        child: Text(
                                            data.data?[index].interestRate ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.white,
                                                      blurRadius: 1,
                                                      offset: Offset(0.2, 0.2))
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800))),
                                    Expanded(
                                        child: Text(
                                            data.data?[index]
                                                    .loanPerTotalAmount ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.white,
                                                      blurRadius: 1,
                                                      offset: Offset(0.2, 0.2))
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800))),
                                    Expanded(
                                        child: Text(
                                            data.data?[index].loanPassDays ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(15),
                                                shadows: const [
                                                  Shadow(
                                                      color: Colors.white,
                                                      blurRadius: 1,
                                                      offset: Offset(0.2, 0.2))
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800)))
                                  ]),
                            ),
                          ),
                        ),
                    error: (e, s) => Text(e.toString()),
                    loading: () => const CupertinoActivityIndicator()),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (ref.watch(loanTypeProvider) == "Select Loan Type") {
                        errorToast(context, "Please select loan type");
                      } else {
                        if (formKey.currentState!.validate()) {
                          if (ref.watch(itrFile1) == null) {
                            errorToast(context, 'Select ITR of last 3 year');
                          } else if (ref.watch(itrFile2) == null) {
                            errorToast(context, 'Select ITR of last 2 year');
                          } else if (ref.watch(itrFile2) == null) {
                            errorToast(context, 'Select ITR of last 1 year');
                          } else if (ref.watch(bsFile1) == null) {
                            errorToast(
                                context, 'Select Balance Sheet of last 3 year');
                          } else if (ref.watch(bsFile2) == null) {
                            errorToast(
                                context, 'Select Balance Sheet of last 2 year');
                          } else if (ref.watch(bsFile3) == null) {
                            errorToast(
                                context, 'Select Balance Sheet of last 1 year');
                          } else {
                            termsLayout(context);
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
                            const Shadow(color: Colors.white, blurRadius: 0.3)
                          ],
                          fontWeight: FontWeight.w700,
                          fontSize: Adaptive.sp(16)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  termsLayout(BuildContext context) => showBarModalBottomSheet(

      context: context,
      expand: true,
      builder: (context) => ref.watch(termsProvider).when(data: (data)=>Consumer(
          builder: (context, ref, child) => Padding(
            padding: const Pad(all: 10),
            child: ListView(
              children: [
                 HtmlWidget(data.view??""),
                RowSuper(children: [
                  Checkbox(
                      value: ref.watch(checkBoxValueProvider),
                      onChanged: (value) {
                        ref.watch(checkBoxValueProvider.notifier).state =
                            value ?? false;
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
                      ref
                          .watch(applyForLoanProvider(
                          amount: amountController.text.toString(),
                          loanType: ref.watch(loanTypeProvider) ==
                              "Commodity Finance"
                              ? "1"
                              : "2",
                          schemeId: ref.watch(schemeActionProvider),
                          itr1: ref.watch(itrFile1),
                          itr2: ref.watch(itrFile2),
                          itr3: ref.watch(itrFile3),
                          bs1: ref.watch(bsFile1),
                          bs2: ref.watch(bsFile2),
                          bs3: ref.watch(bsFile3))
                          .future)
                          .then((value) {
                        if (value['status'].toString() == "1") {
                          ref.watch(goRouterProvider).pop();
                          successToast(
                              context, value['message'].toString());
                        } else {
                          errorToast(context, value['message'].toString());
                        }
                      }).onError((e, s) {});
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
          )), error: (e,s)=>Container(), loading: ()=>CupertinoActivityIndicator()));
}
