import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Data/Model/DistrictsResponseModel.dart';
import '../../Data/Model/StatesResponseModel.dart';
import '../utils/colors.dart';
import '../utils/enums.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

var statesProvider = StateProvider<Datum?>((ref) => null);

var districtProvider = StateProvider<StateDatum?>((ref) => null);
var propProvider = StateProvider<int?>((ref) => null);
var propNameProvider = StateProvider((ref) => "Select Constitution");
var propTypeList = ['Individual', "Proprietorship Firm", "Partnership Firm"];
var regTypeList = ['Commodity Finance', "BNPL"];
var regNameProvider = StateProvider((ref) => "Select Registration type");

var registrationTypeProvider = StateProvider<RegistrationType?>((ref) => null);
var constitutionTypeProvider = StateProvider<ConstitutionType?>((ref) => null);

class _RegistrationscreenState extends ConsumerState<Registrationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
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
                  "Register As",
                  style: TextStyle(
                      color: ColorsConstant.secondColorSuperDark,
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(20)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // DropdownSearch<RegistrationType?>(
              //   popupProps: PopupProps.menu(
              //       searchFieldProps: const TextFieldProps(
              //           autofocus: true,
              //           cursorColor: ColorsConstant.primaryColor,
              //           padding: Pad(left: 10, right: 10),
              //           decoration: InputDecoration(
              //             contentPadding: Pad(left: 10, right: 10),
              //             focusedErrorBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //             disabledBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //             errorBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //             focusedBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //             border: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //             enabledBorder: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                     style: BorderStyle.solid,
              //                     color: ColorsConstant.primaryColor)),
              //           )),
              //       menuProps: MenuProps(
              //           shape: RoundedRectangleBorder(
              //               side: const BorderSide(
              //                   color: ColorsConstant.primaryColor),
              //               borderRadius: BorderRadius.circular(8))),
              //       itemBuilder: (context, terminal, isVisible) =>
              //           ColumnSuper(alignment: Alignment.centerLeft, children: [
              //             Padding(
              //               padding: const Pad(all: 10),
              //               child: Text(
              //                 "${terminal?.label}",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: Adaptive.sp(16)),
              //               ),
              //             ),
              //             Container(
              //               height: 1,
              //               color: Colors.grey.withOpacity(0.3),
              //             ),
              //           ]),
              //       isFilterOnline: true,
              //       title: Padding(
              //         padding: const Pad(all: 10),
              //         child: Text(
              //           'Select Product Type',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       showSearchBox: true,
              //       searchDelay: const Duration(microseconds: 500)),
              //   items: RegistrationType.values,
              //   itemAsString: (RegistrationType? u) => u!.label,
              //   onChanged: (RegistrationType? data) =>
              //       ref.watch(registrationTypeProvider.notifier).state = data,
              //   dropdownDecoratorProps: const DropDownDecoratorProps(
              //     dropdownSearchDecoration: InputDecoration(
              //         contentPadding: Pad(left: 10, bottom: 5, top: 5),
              //         hintText: "Select Product Type",
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(8)),
              //             borderSide: BorderSide(
              //                 color: ColorsConstant.secondColorUltraDark))),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              DropdownSearch<ConstitutionType?>(
                popupProps: PopupProps.menu(
                    searchFieldProps: const TextFieldProps(
                        autofocus: true,
                        cursorColor: ColorsConstant.primaryColor,
                        padding: Pad(left: 10, right: 10),
                        decoration: InputDecoration(
                          contentPadding: Pad(left: 10, right: 10),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: ColorsConstant.primaryColor)),
                        )),
                    menuProps: MenuProps(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: ColorsConstant.primaryColor),
                            borderRadius: BorderRadius.circular(8))),
                    itemBuilder: (context, terminal, isVisible) =>
                        ColumnSuper(alignment: Alignment.centerLeft, children: [
                          Padding(
                            padding: const Pad(all: 10),
                            child: Text(
                              "${terminal?.label}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(16)),
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ]),
                    isFilterOnline: true,
                    title: Padding(
                      padding: const Pad(all: 10),
                      child: Text(
                        'Select Constitution',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    showSearchBox: true,
                    searchDelay: const Duration(microseconds: 500)),
                items: ConstitutionType.values ?? [],
                itemAsString: (ConstitutionType? u) => u!.label,
                onChanged: (ConstitutionType? data) =>
                ref
                    .watch(constitutionTypeProvider.notifier)
                    .state = data,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: Pad(left: 10, bottom: 5, top: 5),
                      hintText: "Select Constitution",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: ColorsConstant.secondColorUltraDark))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (ref.watch(registrationTypeProvider) ==
                        RegistrationType.defaultType) {
                      errorToast(context, 'Please select Registration type');
                    }
                    if (ref.watch(constitutionTypeProvider) ==
                        ConstitutionType.defaultType) {
                      errorToast(context, 'Please select Constitution');
                    } else {
                      if (ref.watch(registrationTypeProvider) ==
                          RegistrationType.bnpl) {
                        context.goNamed(RoutesStrings.bnplRegistration, extra: {
                          'reg_type':
                          "${ref
                              .watch(registrationTypeProvider)
                              ?.type}",
                          'cons_type': "${ref
                              .watch(constitutionTypeProvider)
                              ?.type}"
                        });
                      } else {
                        if (ref.watch(constitutionTypeProvider) ==
                            ConstitutionType.individual) {
                          context.goNamed(RoutesStrings.individualRegistration);
                        } else if (ref.watch(constitutionTypeProvider) ==
                            ConstitutionType.proprietorship) {
                          context.goNamed(RoutesStrings.propRegistration);
                        } else {
                          showAccountVerificationDialog(
                              context, titleText: "Please verify From administration!",
                              messageText: "Please Verify account from administration by calling our support",
                              action: ()async{
                                  await launchUrl(Uri.parse('tel:+91 7733901154'));
                                  hideLoader(context);
                              });
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: ColorsConstant.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Next",
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
          ),
        ));
  }
}
