import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/Domain/AuthenticationService/AuthenticationService.dart';
import 'package:swfl/ui/auth/BnplAadharRegistration.dart';
import 'package:swfl/ui/utils/routes_strings.dart';

import '../utils/colors.dart';

class Bnplupdateaddress extends ConsumerStatefulWidget {
  const Bnplupdateaddress({super.key});

  @override
  ConsumerState<Bnplupdateaddress> createState() => _BnplupdateaddressState();
}

class _BnplupdateaddressState extends ConsumerState<Bnplupdateaddress> {
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final districtController = TextEditingController();
  final pincodeController = TextEditingController();

  final addressKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      addressController.text =
      "${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.house},${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.street},${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.vtc},${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.po},${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.landmark},${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.subdist}";

      stateController.text =
      "${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.state}";

      districtController.text =
      "${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.dist}";

      pincodeController.text =
      "${ref.watch(sharedUtilityProvider).aadharUserData()?.address?.zip}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: addressKey,
              child: Padding(padding: Pad(all: 10),child: ListView(

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
                      "Is this address correct?",
                      style: TextStyle(
                          color: ColorsConstant.secondColorSuperDark,
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(20)),
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(5),
                  ),
                  TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    maxLines: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input Valid address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Address",
                        label: const Text("Enter Address"),
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
                    controller: stateController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input Valid State';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter State",
                        label: const Text("Enter State"),
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
                    controller: districtController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input Valid District';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter District",
                        label: const Text("Enter District"),
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
                    controller: pincodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 6) {
                        return 'Please input Valid pincode';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter pincode",
                        label: const Text("Enter pincode"),
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
                        if(addressKey.currentState!.validate()){
                          ref.watch(updateAddressProvider(
                              address: addressController.text,
                              stateAddress: stateController.text,
                              district: districtController.text,
                              pincode: pincodeController.text
                          ).future).then((value){
                            if(value.status.toString()=="1"){
                              context.go(RoutesStrings.dashboard);
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
                        "Submit",
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
                ],
              ),))),
    );
  }
}
