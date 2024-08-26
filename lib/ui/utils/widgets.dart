import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

errorToast(BuildContext context, String text) => toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.red,
      primaryColor: Colors.red,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
    );

successToast(BuildContext context, String text) => toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text(text),
      backgroundColor: Colors.green,
      primaryColor: Colors.green,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
);
