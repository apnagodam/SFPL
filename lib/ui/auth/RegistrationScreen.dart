import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/utils/routes_strings.dart';
import 'package:toastification/toastification.dart';

import '../../Data/Model/DistrictsResponseModel.dart';
import '../../Data/Model/StatesResponseModel.dart';
import '../utils/colors.dart';

class Registrationscreen extends ConsumerStatefulWidget {
  const Registrationscreen({super.key});

  @override
  ConsumerState<Registrationscreen> createState() => _RegistrationscreenState();
}

var statesProvider = StateProvider<Datum?>((ref) => null);

var districtProvider = StateProvider<StateDatum?>((ref) => null);
var propProvider = StateProvider<int?>((ref) => null);
var propNameProvider = StateProvider((ref) => "Select Constitution");
var propTypeList = ['Individual', "Proprietorship Firm"];

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
          DropdownSearch<String>(
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
                          "${terminal}",
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
            items: propTypeList ?? [],
            itemAsString: (String? u) => u ?? "",
            onChanged: (String? data) =>
                ref.watch(propNameProvider.notifier).state = data ?? "",
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
                if (ref.watch(propNameProvider) == 'Select Constitution') {
                  toastification.show(
                    style: ToastificationStyle.fillColored,
                    title: Text('Please select firm type'),
                    backgroundColor: Colors.red,
                  );
                } else {
                  if (ref.watch(propNameProvider) == 'Individual Firm') {
                    context.goNamed(RoutesStrings.individualRegistration);
                  } else {
                    context.goNamed(RoutesStrings.propRegistration);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: ColorsConstant.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Register",
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
