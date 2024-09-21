import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/auth/BnplRegistration.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';

import '../../Domain/AuthenticationService/AuthenticationService.dart';
import '../utils/colors.dart';
import '../utils/debouncer.dart';
import '../utils/widgets.dart';

class Bnplaadharregistration extends ConsumerStatefulWidget {
  const Bnplaadharregistration({super.key});

  @override
  ConsumerState<Bnplaadharregistration> createState() =>
      _BnplaadharregistrationState();
}

final bnplAdharKey = GlobalKey<FormState>();

class _BnplaadharregistrationState
    extends ConsumerState<Bnplaadharregistration> {
  final bnplKey = GlobalKey<FormState>();
  TextEditingController aadharController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController firmController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  var isSentOtp = StateProvider((ref) => false);
  var clientIdProvider = StateProvider((ref) => "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Pad(all: 10),
        child: Form(
            key: bnplAdharKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Adaptive.h(5),
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
                Center(
                  child: Text(
                    "Verify Your Account",
                    style: TextStyle(
                        color: ColorsConstant.secondColorSuperDark,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(20)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: aadharController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isValidAadharNumber()) {
                      return 'Please input Valid Aadhar Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Aadhar Number",
                      label: const Text("Enter Aadhar Number"),
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
                ref.watch(isSentOtp)
                    ? SizedBox()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            showloader(context);
                            ref
                                .watch(sendAadharOtpProvider(
                                        aadharNo: aadharController.text)
                                    .future)
                                .then((value) {
                              hideLoader(context);
                              if (value.status.toString() == "1") {
                                ref.watch(isSentOtp.notifier).state = true;
                                ref.watch(clientIdProvider.notifier).state =
                                    value.data ?? "";
                              }
                              successToastIndefinite(
                                  context, value.message ?? "");
                            }).onError((e, s) {});
                            if (bnplKey.currentState!.validate()) {}
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              backgroundColor: ColorsConstant.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Send Otp",
                            style: TextStyle(
                                color: Colors.white,
                                shadows: const [
                                  Shadow(color: Colors.white, blurRadius: 0.3)
                                ],
                                fontWeight: FontWeight.w700,
                                fontSize: Adaptive.sp(16)),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                ref.watch(isSentOtp)
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Pinput(
                            autofocus: true,
                            length: 6,
                            defaultPinTheme: PinTheme(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorsConstant.primaryColor
                                        .withOpacity(0.1),
                                    border: Border.all(
                                        color: ColorsConstant.primaryColor
                                            .withOpacity(0.1)))),
                            focusedPinTheme: PinTheme(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorsConstant.primaryColor
                                        .withOpacity(0.1),
                                    border: Border.all(
                                        color:
                                            ColorsConstant.secondColorDark))),
                            onCompleted: (pin) {
                              if (pin.length == 6) {
                                Debouncer(
                                        delay:
                                            const Duration(milliseconds: 500))
                                    .call(() {
                                  showloader(context);
                                  ref
                                      .watch(verifyAadharOtpProvider(
                                              clientId:
                                                  ref.watch(clientIdProvider),
                                              otp: pin,
                                              aadharNumber:
                                                  aadharController.text)
                                          .future)
                                      .then((value) {
                                    hideLoader(context);

                                    if (value.status.toString() == "1") {
                                      ref
                                          .watch(sharedUtilityProvider)
                                          .setAadharUserData(value.data);

                                      context.goNamed(RoutesStrings.bnplUpdateAddress);


                                      ref.invalidate(isSentOtp);
                                    }
                                  });
                                });
                              }
                            },
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      )),
    );
  }
}
