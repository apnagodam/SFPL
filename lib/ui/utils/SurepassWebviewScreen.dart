import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/utils/pdf.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Surepasswebviewscreen extends ConsumerStatefulWidget {
  const Surepasswebviewscreen(
      {super.key, required this.url, required this.docName});
  final String url;
  final String docName;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SurepasswebviewscreenState();
}

class _SurepasswebviewscreenState extends ConsumerState<Surepasswebviewscreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print(url);
            if (url.toLowerCase().contains('signature')) {
              successToast(context, url);
              ref
                  .watch(downloadFileBGAgreementProvider(
                          fileName: widget.docName, url: url)
                      .future)
                  .then((file) {
                if (file != null) {
                  successToast(context, 'File saved at ${file.path}');
                } else {
                  errorToast(context, 'something went wrong');
                }
              });
            } else if (url.contains('success-esign')) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          },
          onPageFinished: (String url) {
            if (url.toLowerCase().contains('signature')) {
              successToast(context, url);
              ref
                  .watch(downloadFileBGAgreementProvider(
                          fileName: widget.docName, url: url)
                      .future)
                  .then((file) {
                if (file != null) {
                  successToast(context, 'File saved at ${file.path}');
                } else {
                  errorToast(context, 'something went wrong');
                }
              });
            } else if (url.contains('success-esign')) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            print(url);
          },
          onHttpError: (HttpResponseError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            if (request.url.toLowerCase().contains('signature')) {
              successToast(context, request.url);
              ref
                  .watch(downloadFileBGAgreementProvider(
                          fileName: widget.docName, url: request.url)
                      .future)
                  .then((file) {
                if (file != null) {
                  successToast(context, 'File saved at ${file.path}');
                } else {}
              });

              return NavigationDecision.prevent;
            } else if (request.url.contains('success-esign')) {
              context.pop();
              return NavigationDecision.prevent;
            }
            //success-esign
            // if (request.url
            //     .startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('${widget.url}'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          ElevarmConfirmAlertDialog(
                  title: 'Confirmation Dialog',
                  subtitle:
                      'Are your sure you want to exit E-Signing Process??',
                  onPositiveButton: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context, rootNavigator: false).pop();
                  },
                  onNegativeButton: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  positiveText: 'Yes',
                  negativeText: 'No',
                  variant: ElevarmDialogVariant.danger)
              .show(context);
          ;
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('E-Signing'),
          ),
          body: WebViewWidget(controller: controller),
        ));
  }
}
