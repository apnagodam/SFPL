import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:one_context/one_context.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/auth/BnplAadharRegistration.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:toastification/toastification.dart';

emptyData()=>SizedBox(height: MediaQuery.of(OneContext().context!).size.height/2,child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
LottieBuilder.asset('assets/loading_finance.json',height: Adaptive.sh(20),fit: BoxFit.cover,),
Text("No Data Found!",style: TextStyle(fontSize: Adaptive.sp(20),fontWeight: FontWeight.bold),)
]),);

defaultLoader()=> const CircularProgressIndicator.adaptive(backgroundColor:ColorsConstant.primaryColor,);

errorToast(BuildContext context, String text) => toastification.show(
      context: context,
      // optional if you use ToastificationWrapper
      title: Text(text),
      alignment: Alignment.topRight,
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
      alignment: Alignment.topRight,
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
      widget: Text(''),
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
      barrierDismissible: false,
      showCancelBtn: false,
      showConfirmBtn: true,
      confirmBtnText: "Verify",
      confirmBtnColor: ColorsConstant.primaryColor,
      onConfirmBtnTap: action,
      widget: Text(''),
    );


showLogoutDialog(BuildContext context,  VoidCallback action )=> QuickAlert.show(
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
  onCancelBtnTap: (){
    hideLoader(context);
  },
  widget: Text(''),
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
      widget: Text(''),
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
        action!();
        hideLoader(context);
      },
      widget: Text(''),
    );


var downloadProgressProvider = StateProvider((ref)=>"0");
var isFileDownloading = StateProvider((ref)=>false);
var downloadFilePath = StateProvider<File?>((ref)=>null);