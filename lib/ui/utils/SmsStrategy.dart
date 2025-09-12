import 'package:otp_autofill/otp_autofill.dart';

class Smsstrategy  extends OTPStrategy{
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'Your Apna Godam OTP is: ',
    );
  }
}