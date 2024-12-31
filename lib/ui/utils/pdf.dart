import 'dart:io';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import 'package:background_downloader/background_downloader.dart';
import 'package:path_provider/path_provider.dart';

import 'package:file_support/file_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as htmltoPdf;
import 'package:one_context/one_context.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/utils/widgets.dart';

part 'pdf.g.dart';

@riverpod
Future<File?> convertAndDownloadHtmlPdf(ConvertAndDownloadHtmlPdfRef ref,
    {String? data}) async {
  File? file;
  final font = await rootBundle.load("assets/fonts/FreeSerif.ttf");
  final fontData = htmltoPdf.Font.ttf(font);
  Directory documents = await getApplicationCacheDirectory();

  var filePath = '';
  filePath = documents.path;

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
  )
      .then((video) async {
    ref.watch(isFileDownloading.notifier).state = false;
    ;

    if (video != null) {
      final params = SaveFileDialogParams(sourceFilePath: video.path);
      await FlutterFileDialog.saveFile(params: params).then((value) {
        successToast(OneContext().context!, 'File saved successfully');
      });

      ref.watch(downloadFilePath.notifier).state = video;
    }

    file = video;
  }).onError((error, stackTrace) {
    ref.watch(isFileDownloading.notifier).state = false;
  });

  return file;
}

@riverpod
Future<File?> downloadFileBG(DownloadFileBGRef ref,
    {required String? fileName, required String? url}) async {
  File? file;

  var filePath = '';
  Directory documents = Directory('/storage/emulated/0/Download');

  filePath = documents.path;

  FileDownloader()
      .configureNotification(
          running: TaskNotification('Downloading', 'file: ${fileName}'),
          complete: TaskNotification('Download finished', 'file: ${fileName}'),
          progressBar: true,
          tapOpensFile: true)
      .download(
          DownloadTask(
            url: url ?? "",

            filename: "${fileName}.pdf",
            updates: Updates.statusAndProgress,
            // request status and progress updates
            requiresWiFi: false,
            retries: 5,
            baseDirectory: BaseDirectory.applicationSupport,
            allowPause: true,
          ),
          onProgress: (progress) => print('Progress: ${progress * 100}%'),
          onStatus: (status) => print('Status: $status'))
      .then((value) async {
    switch (value.status) {
      case TaskStatus.enqueued:
      case TaskStatus.running:
      case TaskStatus.complete:
        var filePath = await value.task.filePath();
        final params = SaveFileDialogParams(sourceFilePath: filePath);
        FlutterFileDialog.saveFile(params: params).then((value) {
          successToast(OneContext().context!, 'File saved successfully');
        });
      // successToast(OneContext().context!, 'File Downloaded successfully');
      // file =
      //     await File("/data/user/0/com.swfl.swfl/app_flutter/${fileName}.pdf")
      //         .copy('/storage/emulated/0/Download/${fileName}.pdf');

      case TaskStatus.notFound:
      case TaskStatus.failed:
      case TaskStatus.canceled:
      case TaskStatus.waitingToRetry:
      case TaskStatus.paused:
    }
  });

  return file;
}

@riverpod
Future<File?> downloadFileBGAgreement(DownloadFileBGAgreementRef ref,
    {required String? fileName, required String? url}) async {
  File? file;

  var filePath = '';
  Directory documents = Directory('/storage/emulated/0/Download');

  filePath = documents.path;

  FileDownloader()
      .configureNotification(
          running: TaskNotification('Downloading', 'file: ${fileName}'),
          complete: TaskNotification('Download finished', 'file: ${fileName}'),
          progressBar: true,
          tapOpensFile: true)
      .download(
          DownloadTask(
            url: url ?? "",

            filename: "${fileName}.pdf",
            updates: Updates.statusAndProgress,
            // request status and progress updates
            requiresWiFi: false,
            retries: 0,
            baseDirectory: BaseDirectory.applicationSupport,
            allowPause: false,
          ),
          onProgress: (progress) => print('Progress: ${progress * 100}%'),
          onStatus: (status) => print('Status: $status'))
      .then((value) async {
    switch (value.status) {
      case TaskStatus.enqueued:
      case TaskStatus.running:
      case TaskStatus.complete:
        var filePath = await value.task.filePath();
        final params = SaveFileDialogParams(sourceFilePath: filePath);
        FlutterFileDialog.saveFile(params: params).then((value) {
          successToast(OneContext().context!, 'File saved successfully');
        });
      // successToast(OneContext().context!, 'File Downloaded successfully');
      // file =
      //     await File("/data/user/0/com.swfl.swfl/app_flutter/${fileName}.pdf")
      //         .copy('/storage/emulated/0/Download/${fileName}.pdf');

      case TaskStatus.notFound:
      case TaskStatus.failed:
      case TaskStatus.canceled:
      case TaskStatus.waitingToRetry:
      case TaskStatus.paused:
    }
  });

  return file;
}

@riverpod
Future<File?> downloadFile(DownloadFileRef ref,
    {required String? fileName, required String? url}) async {
  var filePath = '';
  Directory documents = await getApplicationCacheDirectory();
  filePath = documents.path + "/";

  ref.watch(isFileDownloading.notifier).state = true;

  await FileSupport()
      .downloadCustomLocation(
    url: url,
    path: filePath,
    filename: '${fileName.toString().toLowerCase().replaceAll(' ', '_')}',
    extension: ".pdf",
    progress: (progress) async {
      debugPrint(progress);
    },
  )
      .then((file) async {
    ref.watch(isFileDownloading.notifier).state = false;

    final params = SaveFileDialogParams(sourceFilePath: file?.path);
    await FlutterFileDialog.saveFile(params: params).then((value) {
      successToast(OneContext().context!, 'File saved successfully');
    });
    return file;
  }).onError((error, stackTrace) {
    ref.watch(isFileDownloading.notifier).state = false;

    return null;
  });
}
