import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:one_context/one_context.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:toastification/toastification.dart';

import 'Styles.dart';

roundedWidget({required Widget child, double width = 35, double height = 35}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorsConstant.secondColorDark,
          border: Border.all(color: ColorsConstant.primaryColor, width: 2),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: child,
        ));

roundedProfileImage(
        {required String imageUrl, double width = 100, double height = 100}) =>
    ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        imageBuilder: (context, imageProvider) => Container(
          padding: Pad(all: 10),
          decoration: BoxDecoration(
            color: ColorsConstant.secondColorDark,
            border: Border.all(color: ColorsConstant.primaryColor, width: 5),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        height: height,
        errorWidget: (context, url, stack) => Container(
          padding: Pad(all: 0),
          decoration: BoxDecoration(
            color: ColorsConstant.secondColorDark,
            border: Border.all(color: ColorsConstant.primaryColor, width: 5),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/placeholder.svg'),
        ),
        progressIndicatorBuilder: (context, _, l) => const SizedBox(
          height: 25,
          width: 25,
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );

emptyData() => SizedBox(
      height: MediaQuery.of(OneContext().context!).size.height / 2,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            LottieBuilder.asset(
              'assets/loading_finance.json',
              height: Adaptive.sh(20),
              fit: BoxFit.cover,
            ),
            Text(
              "No Data Found!",
              style: TextStyle(
                  fontSize: Adaptive.sp(20), fontWeight: FontWeight.bold),
            )
          ]),
    );

defaultLoader() => const CircularProgressIndicator.adaptive(
      backgroundColor: ColorsConstant.primaryColor,
    );

errorToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      alignment: Alignment.topRight,
      backgroundColor: Colors.red,
      primaryColor: Colors.red,
      style: ToastificationStyle.fillColored,
      applyBlurEffect: false,
      showProgressBar: false,

      autoCloseDuration: const Duration(seconds: 10),
    );

successToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.green,
      primaryColor: Colors.green,
      applyBlurEffect: false,
      alignment: Alignment.topRight,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 10),
    );

successToastIndefinite(BuildContext context, String text) =>
    toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.green,
      primaryColor: Colors.green,
      applyBlurEffect: true,
      alignment: Alignment.bottomCenter,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(hours: 1),
    );

showloader(
  BuildContext context,
) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: "Loading...",
      text: "Please wait...",
      showCancelBtn: false,
      showConfirmBtn: false,
      barrierDismissible: false,
      disableBackBtn: true,
      widget: const Text(''),
    );

showVerificationDialog(BuildContext context,
        {required String titleText,
        required String messageText,
        required VoidCallback action}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      barrierDismissible: true,
      showCancelBtn: true,
      showConfirmBtn: true,
      confirmBtnText: "Verify",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: action,
      widget: const Text(''),
    );

showLogoutDialog(BuildContext context, VoidCallback action) => QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: 'Logout?',
      text: 'Are you sure you want to logout?',
      barrierDismissible: false,
      showCancelBtn: true,
      showConfirmBtn: true,
      confirmBtnText: "Logout",
      confirmBtnColor: Colors.red,
      onConfirmBtnTap: action,
      onCancelBtnTap: () {
        hideLoader(context);
      },
      widget: const Text(''),
    );

showAccountVerificationDialog(BuildContext context,
        {required String titleText,
        required String messageText,
        required VoidCallback action}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      barrierDismissible: false,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Ok",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: action,
      widget: const Text(''),
    );

showHelpDialog(BuildContext context,
        {required String titleText,
        required String messageText,
        required VoidCallback action}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      barrierDismissible: true,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Okay",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: action,
      widget: ColumnSuper(children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'How to Verify?',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        RowSuper(fill: true, children: [
          ColumnSuper(children: [
            CircleButton(
              onTap: () async {},
              icon: const Icon(
                LucideIcons.file_down,
              ),
              border: Border.all(color: ColorsConstant.primaryColor),
            ),
            Text(
              'Download \nAgreement',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700),
            )
          ]),
          const Divider(
            thickness: 1.0,
          ),
          ColumnSuper(children: [
            CircleButton(
              icon: const Icon(
                LucideIcons.stamp,
              ),
              border: Border.all(color: ColorsConstant.primaryColor),
            ),
            Text('Stamp \nAgreement',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
          ]),
          const Divider(
            thickness: 1.0,
          ),
          ColumnSuper(children: [
            CircleButton(
              icon: const Icon(
                LucideIcons.cloud_upload,
              ),
              border: Border.all(color: ColorsConstant.primaryColor),
            ),
            Text('Upload \nAgreement',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
          ]),
        ]),
        const SizedBox(
          height: 10,
        ),
      ]),
    );

hideLoader(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).pop('dialog');

showErrorDialog(BuildContext context,
        {required String titleText,
        required String messageText,
        VoidCallback? action}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Okay",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: () {
        hideLoader(context);

        // action!();
      },
      widget: const Text(''),
    );

showForceLogoutDialog(BuildContext context,
        {required String titleText,
        required String messageText,
        VoidCallback? action}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Okay",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: () {
        action!();
        hideLoader(context);
      },
      widget: const Text(''),
    );

showCustomAlertDialog(BuildContext context, Widget child, String title) =>
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
          ),
          Divider(
            endIndent: 150,
            thickness: 4,
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: child,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          style: buttonStyle,
        )
      ],
    );

var downloadProgressProvider = StateProvider((ref) => "0");
var isFileDownloading = StateProvider((ref) => false);
var downloadFilePath = StateProvider<File?>((ref) => null);

class ImagePickerWidget extends ConsumerWidget {
  ImagePickerWidget(
      {super.key, required this.onImageSelection, required this.title});
  Function(XFile) onImageSelection;
  String title = '';
  final refImage = StateProvider<XFile?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(refImage) == null
        ? ElevarmInputFileCard(
            onTap: () {
              showImageSourceFilePickerDialog(context, (result) {
                ref.read(refImage.notifier).state = result;
                onImageSelection(result);
              });
            },
            clickToUploadLabel: '$title',
            orDragAndDropLabel: ', Tap to Upload $title Image',
            subtitle: 'PNG, JPG, JPEG (maks. 800x400px)',
            textColor: ColorsConstant.primaryColor,
          )
        : ElevarmFileUploadCard(
            title: '${ref.read(refImage)?.name}',
            subtitle: '${ref.read(refImage)?.name}',
            actionIconAssetName: Icons.remove_red_eye,
            iconColor: ColorsConstant.primaryColor,
            iconBackgroundColor: ColorsConstant.primaryColor.withOpacity(0.1),
            onTap: () {
                 showImageSourceFilePickerDialog(context, (result) {
                ref.read(refImage.notifier).state = result;
              });
            },
            onTapAction: () {
              showImagePopup(context, File(ref.watch(refImage)?.path ?? ""));
            },
          );
  }
}

Future<void> showImageSourceFilePickerDialog(
    BuildContext context, Function(XFile) onImagePicked) async {
  final ImagePicker picker = ImagePicker();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.of(context, rootNavigator: false)
                    .pop(); // Close the dialog
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  onImagePicked(image);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Storage'),
              onTap: () async {
                Navigator.of(context, rootNavigator: false)
                    .pop(); // Close the dialog

                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                );
                if (result != null) {
                  onImagePicked(XFile(result.files.single.path!));
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

void showImagePopup(BuildContext context, dynamic imageSource) {
  ImageProvider imageProvider;

  if (imageSource is String) {
    if (imageSource.startsWith('http')) {
      imageProvider = NetworkImage(imageSource);
    } else {
      imageProvider = AssetImage(imageSource);
    }
  } else if (imageSource is File) {
    imageProvider = FileImage(imageSource);
  } else if (imageSource is ImageProvider) {
    imageProvider = imageSource;
  } else {
    throw ArgumentError('Unsupported image type: $imageSource');
  }

  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InteractiveViewer(
                child: Image(image: imageProvider, fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              margin: Pad(all: 5),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3), shape: BoxShape.circle),
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () =>
                    Navigator.of(context, rootNavigator: false).pop(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class Downloader extends ConsumerWidget {
  Downloader({super.key, required this.fileName, required this.url});

  final String? fileName;
  final String? url;

  // State providers for download progress and status
  final isFileDownloading = StateProvider((ref) => false);
  final progressProvider = StateProvider((ref) => 0.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDownloading = ref.watch(isFileDownloading);
    final progress = ref.watch(progressProvider);

    return Container(
      alignment: Alignment.center,
      child: isDownloading
          ? CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorsConstant.primaryColor),
            )
          : ElevarmLinkPrimaryButton.icon(
              text: 'Download',
              onPressed: () async {
                await _startDownload(context, ref);
              },
              leadingIconAssetName: null,
              trailingIconAssetName: Icons.download_outlined,
            ),
    );
  }

  Future<void> _startDownload(BuildContext context, WidgetRef ref) async {
    ref.read(isFileDownloading.notifier).state = true;

    try {
      // Define the download directory
      final Directory documents = Directory('/storage/emulated/0/Download');
      final String filePath = documents.path;

      // Configure and start the download
      final FileDownloader downloader = FileDownloader()
        ..configureNotification(
          running: TaskNotification(
            'Downloading',
            'File: $fileName',
          ),
          complete: TaskNotification(
            'Download finished',
            'File: $fileName',
          ),
          progressBar: true,
          tapOpensFile: true,
        );

      final DownloadTask task = DownloadTask(
        headers: {
          'Authorization':
              "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
        },
        url: url ?? "",
        filename: "$fileName.pdf",
        updates: Updates.statusAndProgress,
        requiresWiFi: false,
        retries: 5,
        directory: filePath,
        allowPause: true,
      );

      final result = await downloader.download(
        task,
        onProgress: (progress) {
          ref.read(progressProvider.notifier).state = progress;
        },
        onStatus: (status) {
          debugPrint('Download Status: $status');
        },
      );

      // Handle the result based on the task status
      await _handleDownloadResult(context, ref, result, documents);
    } catch (e) {
      // Handle errors gracefully
      ref.read(isFileDownloading.notifier).state = false;
      errorToast(context, 'Download failed: ${e.toString()}');
    }
  }

  Future<void> _handleDownloadResult(
    BuildContext context,
    WidgetRef ref,
    TaskStatusUpdate result,
    Directory documents,
  ) async {
    switch (result.status) {
      case TaskStatus.complete:
        ref.read(isFileDownloading.notifier).state = false;

        // Copy the file to the desired location
        final String? filePath = await result.task.filePath();
        if (filePath != null) {
          final File file = File(filePath);
          await file.copy("${documents.path}/$fileName.pdf");
          await file.delete();

          successToast(context, 'File downloaded successfully');
        } else {
          errorToast(context, 'File path not found');
        }
        break;

      case TaskStatus.failed:
        ref.read(isFileDownloading.notifier).state = false;
        errorToast(context, 'Download failed');
        break;

      case TaskStatus.canceled:
        ref.read(isFileDownloading.notifier).state = false;
        errorToast(context, 'Download canceled');
        break;

      case TaskStatus.notFound:
        ref.read(isFileDownloading.notifier).state = false;
        errorToast(context, 'File not found');
        break;

      default:
        ref.read(isFileDownloading.notifier).state = false;
        errorToast(context, 'Unexpected error occurred');
        break;
    }
  }
}

Future<bool> isLocationPermissionGranted() async {
  LocationPermission permission = await Geolocator.checkPermission();
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}

Future<bool> requestLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    //Fluttertoast.showToast(msg: "Location Services are disabled.");
    Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Fluttertoast.showToast(msg: "Location permission denied.");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    Geolocator.openLocationSettings();
    return false;
  }

  return true;
}

Widget buildRichText({
  required String mainText,
  required TextStyle mainTextStyle,
  List<InlineSpan>? children,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text.rich(
    TextSpan(
      text: mainText,
      style: mainTextStyle,
      children: children,
    ),
    textAlign: textAlign,
  );
}
