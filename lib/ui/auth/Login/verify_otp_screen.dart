import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:swfl/ui/utils/SmsStrategy.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/debouncer.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/AuthenticationService/AuthenticationService.dart';
import '../../../Domain/Dio/DioProvider.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({super.key, required this.panCard});

  final String panCard;

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  late OTPInteractor _otpInteractor;
  OTPTextEditController? controller;
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _initializeOtpListener();
  }

  Future<void> _initializeOtpListener() async {
    await _otpInteractor.getAppSignature();

    var smsPermission = await Permission.sms.status;
    if (!smsPermission.isGranted) {
      final result = await Permission.sms.request();
      if (!result.isGranted) {
        return;
      }
    }

    _startListening();
  }

  void _startListening() {
    controller = OTPTextEditController(
      codeLength: 6,
      otpInteractor: _otpInteractor,
      onCodeReceive: (code) {
        final otp = code.trim();
        if (otp.isNotEmpty) {
          otpController.text = otp;
        }
        setState(() {});
      },
      onTimeOutException: _startListening,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [Smsstrategy()],
      );
  }

  void _onOtpCompleted(String pin) {
    if (pin.length != 6) return;

    Debouncer(delay: const Duration(milliseconds: 500)).call(() {
      showloader(context);
      ref
          .watch(verifyOtpProvider(panCard: widget.panCard, otp: pin).future)
          .then((value) {
        Navigator.of(context, rootNavigator: true).pop('dialog');

        if (value.status.toString() == "1") {
          ref.watch(dioProvider).options.headers.addAll({
            "Authorization":
                "Bearer ${ref.watch(sharedUtilityProvider).getToken()}",
          });
          context.go(RoutesStrings.dashboard);
        } else {
          errorToast(context, value.message ?? "Invalid OTP");
        }
      }).onError((error, stack) {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        errorToast(context, "Something went wrong");
      });
    });
  }

  void _resendOtp() {
    ref.watch(loginProvider(panNumber: widget.panCard).future).then((value) {
      if (value['status'].toString() == "1") {
        successToast(context, value['message'].toString());
        _startListening(); // Restart listener on resend
      }
    }).onError((e, s) {
      errorToast(context, "Failed to resend OTP");
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: ListView(
            children: [
              SizedBox(height: Adaptive.h(25)),
              Center(child: Image.asset('assets/swfl.png', fit: BoxFit.cover)),
              Center(
                child: Text(
                  "Verification",
                  style: TextStyle(
                      color: ColorsConstant.secondColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(22)),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Enter the code sent to the number",
                  style: TextStyle(
                      color: ColorsConstant.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Adaptive.sp(18)),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  widget.panCard,
                  style: TextStyle(
                      color: ColorsConstant.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(16)),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Pinput(
                  autofocus: true,
                  controller: otpController,
                  length: 6,
                  onCompleted: _onOtpCompleted,
                  defaultPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsConstant.primaryColor.withOpacity(0.1),
                      border: Border.all(
                        color: ColorsConstant.primaryColor.withOpacity(0.1),
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsConstant.primaryColor.withOpacity(0.1),
                      border: Border.all(color: ColorsConstant.secondColorDark),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't Receive the OTP?",
                      style: TextStyle(
                          color: ColorsConstant.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                    TextButton(
                      onPressed: _resendOtp,
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                ColorsConstant.secondColorSuperDark,
                            color: ColorsConstant.secondColorSuperDark,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(16)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
