import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:one_context/one_context.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/LoanService/LoanService.dart';
import 'package:swfl/ui/utils/pdf.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../Data/Model/WspListModel.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';

class Verification extends ConsumerStatefulWidget {
  const Verification({super.key});

  @override
  ConsumerState<Verification> createState() => _VerificationState();
}

class _VerificationState extends ConsumerState<Verification> {
  var wspProvider = StateProvider<Datum?>((ref) => null);

  var triPartyImageProvider = StateProvider<File?>((ref) => null);

  var isAgreementDownloading = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Agreement'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const Pad(all: 10),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select WSP',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ref.watch(wspAgreementListProvider).when(
                data: (data) => DropdownSearch<Datum?>(
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
                                        "${terminal?.legalName}",
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
                              'Select WSP',
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

                      items: data.data ?? [],
                      itemAsString: (Datum? u) => u?.legalName ?? "",
                      onChanged: (Datum? data) =>
                          ref.watch(wspProvider.notifier).state = data,
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            contentPadding: Pad(left: 10, bottom: 5, top: 5),
                            hintText: "Select Wsp",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    color:
                                        ColorsConstant.secondColorUltraDark))),
                      ),
                    ),
                error: (e, s) => Container(),
                loading: () => const Center(
                      child: CupertinoActivityIndicator(),
                    )),
            Visibility(
                visible: ref.watch(wspProvider) != null,
                child: IconsButton(
                  onPressed: () async {
                    if (!ref.watch(isFileDownloading)) {
                      // ref.watch(isAgreementDownloading.notifier).state = true;
                      ref
                          .watch(wspAgreementProvider(
                                  wspId: "${ref.watch(wspProvider)?.id ?? ""}")
                              .future)
                          .then((value) async {
                        ref.watch(isAgreementDownloading.notifier).state =
                            false;

                        if (value.data != null) {
                          context.goNamed(
                              RoutesStrings.surepassWebviewScreenVerification,
                              extra: {
                                'url': value.data,
                                'docName': 'triparty_agreement'
                              });
                          // var downloadedFile = await ref
                          //     .watch(downloadFileBGProvider(
                          //             fileName: 'tp agreement', url: value.data)
                          //         .future)
                          //     .onError((e, s) {
                          //   ref.watch(isAgreementDownloading.notifier).state =
                          //       false;
                          //   errorToast(context, e.toString());
                          // });

                          // showBarModalBottomSheet(
                          //     context: context,
                          //     builder: (context) => Padding(
                          //           padding: Pad(all: 10),
                          //           child: ListView(
                          //             children: [HtmlWidget(value.data ?? "")],
                          //           ),
                          //         ));
                        }
                      });
                    }
                  },
                  text: ref.watch(isFileDownloading)
                      ? "Downloading...${ref.watch(downloadProgressProvider)}"
                      : 'Download Agreement',
                  iconData: Icons.cloud_download,
                  color: ColorsConstant.primaryColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                )),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload Agreement',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['pdf']);

                if (result != null) {
                  File file = File(result.files.single.path!);
                  ref.watch(triPartyImageProvider.notifier).state = file;
                } else {
                  errorToast(context, result.toString());
                }
              },
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [5, 5, 5, 5],
                  color: ColorsConstant.primaryColor,
                  child: Padding(
                    padding: const Pad(all: 20),
                    child: Center(
                      child: ref.watch(triPartyImageProvider) != null
                          ? Text(
                              "${basename(ref.watch(triPartyImageProvider)?.path ?? "")}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsConstant.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            )
                          : ColumnSuper(children: [
                              const Icon(
                                LucideIcons.cloud_upload,
                                color: ColorsConstant.primaryColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Select Agreement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(16)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Upload Agreement,\n  Supports PDF",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsConstant.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Adaptive.sp(13)),
                              )
                            ]),
                    ),
                  )),
            ),
            IconsButton(
              onPressed: () async {
                // print(ref.watch(wspProvider)?.id.toString());
                showloader(context);
                ref
                    .watch(uploadPdfProvider(
                            wspId: "${ref.watch(wspProvider)?.id.toString()}",
                            agreementFile: ref.watch(triPartyImageProvider))
                        .future)
                    .then((value) {
                  hideLoader(context);
                  if (value['status'].toString() == "1") {
                    ref.watch(goRouterProvider).go(RoutesStrings.dashboard);
                    successToast(context, value['message'].toString());
                  } else {
                    errorToast(context, value['message'].toString());
                  }
                }).onError((e, s) {
                  hideLoader(context);
                });
              },
              text: 'Upload',
              iconData: Icons.cloud_upload,
              color: ColorsConstant.primaryColor,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: 'Having trouble uploading docs?',
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: Adaptive.sp(15)),
                children: [
                  TextSpan(
                      text: 'click here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showHelpDialog(context,
                              titleText: '', messageText: '', action: () {
                            hideLoader(context);
                          });
                          // tripartyDialog(context, ref);
                        },
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorsConstant.secondColorSuperDark,
                          fontSize: Adaptive.sp(15)))
                ])),
          ],
        ),
      )),
    );
  }
}
