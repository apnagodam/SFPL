import 'dart:io';

import 'package:file_support/file_support.dart';
import 'package:flutter/services.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as htmltoPdf;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf.g.dart';

@riverpod
Future<File?> convertAndDownloadHtmlPdf(ConvertAndDownloadHtmlPdfRef ref,
    {String? data}) async {
  File? file;
  final font = await rootBundle.load("assets/fonts/FreeSerif.ttf");
  final fontData = htmltoPdf.Font.ttf(font);
  var filePath = '/storage/emulated/0/Download/';

  await FileSupport()
      .downloadCustomLocation(
    url: data,
    path: filePath,
    filename: 'agreement',
    extension: ".pdf",
    progress: (progress) async {},
  )
      .then((video) async {
    file = video;
  }).onError((error, stackTrace) {});

  return file;
}
