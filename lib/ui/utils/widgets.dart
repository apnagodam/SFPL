import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:toastification/toastification.dart';

errorToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.red,
      primaryColor: Colors.red,
      style: ToastificationStyle.fillColored,
      applyBlurEffect: true,
      autoCloseDuration: const Duration(seconds: 5),
    );

successToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.green,
      primaryColor: Colors.green,
      applyBlurEffect: true,
      alignment: Alignment.bottomCenter,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
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

showloader(BuildContext context,
       ) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: "Loading...",
      text:"Please wait...",
      showCancelBtn: false,
      showConfirmBtn: false,
      widget: Text(''),
    );

showVerificationDialog(BuildContext context,
        {required String titleText, required String messageText}) =>
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      headerBackgroundColor: ColorsConstant.primaryColor,
      title: titleText,
      text: messageText,
      barrierDismissible: false,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Verify",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: () {
        hideLoader(context);
        context.goNamed(RoutesStrings.bnplAadharRegistration);
      },
      widget: Text(''),
    );

hideLoader(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).pop('dialog');


showErrorDialog(BuildContext context,
    {required String titleText, required String messageText}) =>
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
                context.goNamed(RoutesStrings.bnplAadharRegistration);
          },
          widget: Text(''),
    );