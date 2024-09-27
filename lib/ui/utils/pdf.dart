import 'dart:io';

import 'package:file_support/file_support.dart';
import 'package:flutter/services.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as htmltoPdf;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf.g.dart';

@riverpod
Future<File?> convertAndDownloadHtmlPdf(ConvertAndDownloadHtmlPdfRef ref,
    {String? data}) async {
  File? file;
  final font = await rootBundle.load("assets/fonts/FreeSerif.ttf");
  final fontData = htmltoPdf.Font.ttf(font);

  var filePath = '';
  if(Platform.isAndroid){
    filePath = '/storage/emulated/0/Download/';
  }else{
    Directory documents = await getApplicationDocumentsDirectory();
    filePath = documents.path;
  }


  await FileSupport()
      .downloadCustomLocation(
    url: data,
    path: filePath,
    filename: '/agreement',
    extension: ".pdf",
    progress: (progress) async {},
  )
      .then((video) async {
    file = video;
  }).onError((error, stackTrace) {});

  return file;
}
