import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:swfl/ui/utils/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Data/Model/DistrictsResponseModel.dart';
import '../../../Data/Model/StatesResponseModel.dart';
import '../../utils/colors.dart';
import '../../utils/enums.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends ConsumerState<Registrationscreen> {
  var statesProvider = StateProvider<Datum?>((ref) => null);

  var districtProvider = StateProvider<StateDatum?>((ref) => null);
  var propProvider = StateProvider<int?>((ref) => null);
  var propNameProvider = StateProvider((ref) => "Select Constitution");
  var propTypeList = ['Individual', "Proprietorship Firm", "Partnership Firm"];
  var regTypeList = ['Commodity Finance', "BNPL"];
  var regNameProvider = StateProvider((ref) => "Select Registration type");

  var registrationTypeProvider =
      StateProvider<RegistrationType?>((ref) => null);
  var constitutionTypeProvider =
      StateProvider<ConstitutionType?>((ref) => null);
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
          Text(
            "Welcome!",
            style: TextStyle(
                color: ColorsConstant.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(20)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Create your account to access Apnagodam's Financial Services",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(17)),
          ),
          const SizedBox(
            height: 20,
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
                        fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
                  ),
                ),
                showSearchBox: true,
                searchDelay: const Duration(microseconds: 500)),
            items: ConstitutionType.values ?? [],
            itemAsString: (ConstitutionType? u) => u!.label,
            onChanged: (ConstitutionType? data) =>
                ref.watch(constitutionTypeProvider.notifier).state = data,
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
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                switch (ref.watch(constitutionTypeProvider)) {
                  case null:
                    errorToast(context, 'Please select Constitution type');

                  case ConstitutionType.defaultType:
                    errorToast(context, 'Please select Constitution type');
                  case ConstitutionType.individual:
                    context.goNamed(RoutesStrings.individualRegistration);
                  case ConstitutionType.proprietorship:
                    context.goNamed(RoutesStrings.propRegistration);
                  case ConstitutionType.partnership:
                    ref
                        .watch(goRouterProvider)
                        .goNamed(RoutesStrings.partnershipRegistration);
                  case ConstitutionType.company:
                    ref
                        .watch(goRouterProvider)
                        .goNamed(RoutesStrings.companyRegistration);
                }
                // switch (ref.watch(registrationTypeProvider)) {
                //   case null:
                //     errorToast(context, 'Please select Product type');
                //   case RegistrationType.defaultType:
                //     errorToast(context, 'Please select Product type');
                //   case RegistrationType.commodityFinance:
                //     if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.individual) {
                //
                //     } else if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.proprietorship) {
                //     }
                //     else if (ref.watch(constitutionTypeProvider) == null ||
                //         ref.watch(constitutionTypeProvider) ==
                //             ConstitutionType.defaultType) {
                //       errorToast(context, 'Please select Constitution');
                //     }
                //     else {
                //       if(ref.watch(constitutionTypeProvider)==ConstitutionType.company){
                //       }else if(ref.watch(constitutionTypeProvider)==ConstitutionType.partnership){
                //       }
                //       // showAccountVerificationDialog(context,
                //       //     titleText: "Please contact administration!",
                //       //     messageText:
                //       //         "Please Verify account from administration by calling our support",
                //       //     action: () async {
                //       //   await launchUrl(Uri.parse('tel:+91 7733901154'));
                //       //   hideLoader(context);
                //       // });
                //     }
                //   case RegistrationType.bnpl:
                //     if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.individual) {
                //       context.goNamed(RoutesStrings.bnplRegistration, extra: {
                //         'reg_type':
                //         "${ref.watch(registrationTypeProvider)?.type}",
                //         'cons_type':
                //         "${ref.watch(constitutionTypeProvider)?.type}"
                //       });
                //     } else if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.proprietorship) {
                //       context.goNamed(RoutesStrings.bnplRegistration, extra: {
                //         'reg_type':
                //         "${ref.watch(registrationTypeProvider)?.type}",
                //         'cons_type':
                //         "${ref.watch(constitutionTypeProvider)?.type}"
                //       });
                //     }  else if (ref.watch(constitutionTypeProvider) == null ||
                //         ref.watch(constitutionTypeProvider) ==
                //             ConstitutionType.defaultType) {
                //       errorToast(context, 'Please select Constitution');
                //     }
                //
                //
                //     else{
                //       showAccountVerificationDialog(context,
                //           titleText: "Please contact administration!",
                //           messageText:
                //               "Please Verify account from administration by calling our support",
                //           action: () async {
                //         await launchUrl(Uri.parse('tel:+91 7733901154'));
                //         hideLoader(context);
                //       });
                //     }
                //   default:
                //     errorToast(context, 'Please select Product type');
                // }
                // if (ref.watch(registrationTypeProvider) == null ||
                //     ref.watch(registrationTypeProvider) ==
                //         RegistrationType.defaultType) {
                // } else if (ref.watch(constitutionTypeProvider) == null ||
                //     ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.defaultType) {
                //   errorToast(context, 'Please select Constitution');
                // } else {
                //   if (ref.watch(registrationTypeProvider) ==
                //       RegistrationType.bnpl) {
                //     context.goNamed(RoutesStrings.bnplRegistration, extra: {
                //       'reg_type':
                //           "${ref.watch(registrationTypeProvider)?.type}",
                //       'cons_type':
                //           "${ref.watch(constitutionTypeProvider)?.type}"
                //     });
                //   } else {
                //     if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.individual) {
                //       context.goNamed(RoutesStrings.individualRegistration);
                //     } else if (ref.watch(constitutionTypeProvider) ==
                //         ConstitutionType.proprietorship) {
                //       context.goNamed(RoutesStrings.propRegistration);
                //     } else {
                //       showAccountVerificationDialog(context,
                //           titleText: "Please contact administration!",
                //           messageText:
                //               "Please Verify account from administration by calling our support",
                //           action: () async {
                //         await launchUrl(Uri.parse('tel:+91 7733901154'));
                //         hideLoader(context);
                //       });
                //     }
                //   }
                // }
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
