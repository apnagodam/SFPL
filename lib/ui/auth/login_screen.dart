import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/auth/verify_otp_screen.dart';
import 'package:swfl/ui/home/dashboard_screen.dart';
import 'package:swfl/ui/utils/colors.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Adaptive.h(25),
          ),
          Center(
            child: Image.asset(
              'assets/swfl.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Login",
            style: TextStyle(
                color: ColorsConstant.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(20)),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    label: const Text("Enter Mobile Number"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    VerifyOtpScreen().launch(context);
                  },
                  child: ref.watch(isLoading)
                      ? const CircularProgressIndicator()
                      : Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: Adaptive.sp(16)),
                        ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstant.secondColorDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  var isLoading = StateProvider((ref) => false);
}
