import 'dart:io';

import 'package:file_support/file_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as htmltoPdf;
import 'package:one_context/one_context.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/ui/utils/widgets.dart';

part 'pdf.g.dart';

@riverpod
Future<File?> convertAndDownloadHtmlPdf(ConvertAndDownloadHtmlPdfRef ref,
    {String? data}) async {
  File? file;
  final font = await rootBundle.load("assets/fonts/FreeSerif.ttf");
  final fontData = htmltoPdf.Font.ttf(font);

  var filePath = '';
  if (Platform.isAndroid) {
    filePath = '/storage/emulated/0/Download/';
  } else {
    Directory documents = await getApplicationDocumentsDirectory();
    filePath = documents.path;
  }
  
  ref.invalidate(downloadProgressProvider);
  ref.watch(isFileDownloading.notifier).state = true;
   FileSupport()
      .downloadCustomLocation(
    url: data,
    path: filePath,
    filename: '/agreement',
    extension: ".pdf",
    progress: (progress) async {
      print(progress);
      ref.watch(downloadProgressProvider.notifier).state = progress;
        
      },
  ) .then((video) async {
          ref.watch(isFileDownloading.notifier).state = false;;

    if(video!=null){
             successToast(OneContext().context!, 'File Downloaded at ${video?.path}');

    ref.watch(downloadFilePath.notifier).state = video;
    }
   

    file = video;
  }).onError((error, stackTrace) {
      ref.watch(isFileDownloading.notifier).state = false;

  });

  return file;
}

@riverpod
Future<File?> downloadFile(DownloadFileRef ref,
    {required String? fileName, required String? url}) async {
  var filePath = '';
  if (Platform.isAndroid) {
    filePath = '/storage/emulated/0/Download/';
  } else {
    Directory documents = await getApplicationDocumentsDirectory();
    filePath = documents.path;
  }

  return await FileSupport()
      .downloadCustomLocation(
    url: url,
    path: filePath,
    filename: '${fileName.toString().toLowerCase().replaceAll(' ', '_') }',
    extension: ".pdf",
    progress: (progress) async {
      debugPrint(progress);
    },
  )
      .then((video) async {
    return video;
  }).onError((error, stackTrace) {
    return null;
  });
}
