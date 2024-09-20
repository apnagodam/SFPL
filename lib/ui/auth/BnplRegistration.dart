import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/utils/extensions.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../Domain/Dio/DioProvider.dart';
import '../utils/colors.dart';
import '../utils/debouncer.dart';

class Bnplregistration extends ConsumerStatefulWidget {
  const Bnplregistration(
      {super.key,
      required this.typeOfRegistration,
      required this.constitutiontype});

  final String typeOfRegistration;
  final String constitutiontype;

  @override
  ConsumerState<Bnplregistration> createState() => _BnplregistrationState();
}

class _BnplregistrationState extends ConsumerState<Bnplregistration> {
  final bnplKey = GlobalKey<FormState>();
  TextEditingController panController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController firmController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  var isOtpSent = StateProvider((ref)=>false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.typeOfRegistration);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Pad(all: 10),
        child: Form(
            key: bnplKey,
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
                    widget.constitutiontype.toString() == "1" ?"Individual Details":"Firm Details",
                    style: TextStyle(
                        color: ColorsConstant.secondColorSuperDark,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(20)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget.constitutiontype.toString() == "1"
                    ? TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input valid name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Full Name",
                            label: const Text("Enter Full Name"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )
                    : TextFormField(
                        keyboardType: TextInputType.text,
                        controller: firmController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input valid firm name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Firm Name",
                            label: const Text("Enter Firm Name"),
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
                TextFormField(
                  controller: panController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isValidPanCardNo()) {
                      return 'Please input Valid Pan Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter PAN Number",
                      label: const Text("Enter PAN Number"),
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty && value.length != 10) {
                      return 'Please input valid phone';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      label: const Text("Enter Phone Number"),
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
                    onPressed: () async {
                      if (bnplKey.currentState!.validate()) {
                        ref
                            .watch(registerBnplProvider(
                                    constitution: widget.constitutiontype,
                                    phoneNo: phoneController.text.toString(),
                                    pancardNo: panController.text.toString(),
                                    bnplName: firmController.text.toString(),
                                    type: widget.typeOfRegistration)
                                .future)
                            .then((value) {
                          if (value.status.toString() == "1") {
                            successToast(context, value.message.toString());
                            ref.watch(isOtpSent.notifier).state = true;

                          }
                          else{
                            errorToast(context, value.message.toString());
                          }
                        });
                      }
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


                SizedBox(height: 10,),
                ref.watch(isOtpSent)
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
                              ref.watch(verifyOtpProvider(
                                panCard: panController.text.toString(),
                                otp: pin
                              ).future).then((value){
                                if(value.status.toString()=="1"){
                                  ref
                                      .watch(sharedUtilityProvider)
                                      .setToken(value.data?.token ?? "");
                                  ref
                                      .watch(sharedUtilityProvider)
                                      .setUser(value.data);

                                  ref.invalidate(dioProvider);
                                  context.go(RoutesStrings.dashboard);
                                }
                              });
                          });
                        }
                      },
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            )),
      )),
    );
  }
}
