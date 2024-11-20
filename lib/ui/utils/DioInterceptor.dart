import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/ui/auth/BnplAadharRegistration.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

class Diointerceptor extends InterceptorsWrapper {
  Diointerceptor(this.ref);
  DioRef ref;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data['status'].toString() == '3') {
      showErrorDialog(OneContext().context!,
          titleText: 'You have been Logged out!',
          messageText: "Please Login Again!", action: () {
        ref.watch(goRouterProvider).goNamed(RoutesStrings.login);
        ref.watch(sharedUtilityProvider).sharedPreferences.clear();
      });
    } else if (response.data['status'] == "0") {
      if (response.data['message']
          .toString()
          .contains('Triparty Agreement Not Verify.') || response.data['message'].toString().contains('Please submit Triparty Agreement.')) {
        showVerificationDialog(OneContext().context!,
            titleText: "Verify Tri-Party Agreement",
            messageText: "tri party agreement pending", action: () {
          hideLoader(OneContext().context!);

          ref.watch(goRouterProvider).goNamed(RoutesStrings.verfication);
        });
        debugPrint(" \x1B[31m${response.data}\x1B[0m");
        return;
      }
      debugPrint(" \x1B[31m${response.data}\x1B[0m");
      errorToast(OneContext().context!, '${response.data['message']}');
    } else {
      debugPrint(" \x1B[32m${response.data}\x1B[0m");
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        showErrorDialog(OneContext().context!,
            titleText: 'Connection Timeout!',
            messageText: "please check you internet connection!", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.sendTimeout:
        showErrorDialog(OneContext().context!,
            titleText: 'Connection Timeout!',
            messageText: "please check you internet connection!", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.receiveTimeout:
        showErrorDialog(OneContext().context!,
            titleText: 'Connection Timeout!',
            messageText: "please check you internet connection!", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.badCertificate:
        showErrorDialog(OneContext().context!,
            titleText: 'Server error!',
            messageText: "${err.message}", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.badResponse:
        showErrorDialog(OneContext().context!,
            titleText: 'Server error!',
            messageText: "${err.message}", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.cancel:
        showErrorDialog(OneContext().context!,
            titleText: 'Server error!',
            messageText: "${err.message}", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.connectionError:
        showErrorDialog(OneContext().context!,
            titleText: 'Server error!',
            messageText: "${err.message}", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
      case DioExceptionType.unknown:
        showErrorDialog(OneContext().context!,
            titleText: 'Server error!',
            messageText: "${err.message}", action: () {
              Navigator.of(OneContext().context!,rootNavigator: false).pop();
        });
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(" \x1B[32m${options.baseUrl}${options.path}\x1B[0m");
    debugPrint(" \x1B[32m${options.headers}\x1B[0m");
        debugPrint(" \x1B[32m${options.queryParameters}\x1B[0m");


    super.onRequest(options, handler);
  }
}
