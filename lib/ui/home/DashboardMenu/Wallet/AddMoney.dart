import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/WalletService/WalletService.dart';
import 'package:swfl/ui/utils/widgets.dart';

import '../../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../utils/colors.dart';
import '../../../utils/routes.dart';
import '../../../utils/routes_strings.dart';

class Addmoney extends ConsumerStatefulWidget {
  const Addmoney({super.key});

  @override
  ConsumerState<Addmoney> createState() => _AddmoneyState();
}

class _AddmoneyState extends ConsumerState<Addmoney> {
  final moneyForm = GlobalKey<FormState>();
  final amountController = TextEditingController();

  var paymentTypeProvider = StateProvider<PaymentType?>((ref) => null);
  var paymentImageProvider = StateProvider<File?>((ref) => null);
  var isLoading = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Money'),
        actions: [IconButton(onPressed: (){
          context.goNamed(RoutesStrings.moneyRequests);

        }, icon: Icon(Icons.wallet))],
      ),
      body: SafeArea(
          child: Form(
              key: moneyForm,
              child: Padding(
                padding: Pad(all: 10),
                child: Column(
                  children: [
                    // DropdownSearch<PaymentType?>(
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
                    //           ColumnSuper(
                    //               alignment: Alignment.centerLeft,
                    //               children: [
                    //                 Padding(
                    //                   padding: const Pad(all: 10),
                    //                   child: Text(
                    //                     "${terminal?.title}",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         fontSize: Adaptive.sp(16)),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 1,
                    //                   color: Colors.grey.withOpacity(0.3),
                    //                 ),
                    //               ]),
                    //       isFilterOnline: true,
                    //       title: Padding(
                    //         padding: const Pad(all: 10),
                    //         child: Text(
                    //           'Select Payment Type',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               fontSize: Adaptive.sp(16),
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       showSearchBox: true,
                    //       searchDelay: const Duration(microseconds: 500)),
                    //   // filterFn: (user, filter) =>
                    //   // user?.districtFilterByName(filter) ?? false,
                    //   // asyncItems: (String filter) => getData(filter),

                    //   items: PaymentType.values,
                    //   itemAsString: (PaymentType? u) => u?.type ?? "",
                    //   onChanged: (PaymentType? data) =>
                    //       ref.watch(paymentTypeProvider.notifier).state = data,
                    //   dropdownDecoratorProps: const DropDownDecoratorProps(
                    //     dropdownSearchDecoration: InputDecoration(
                    //         contentPadding: Pad(left: 10, bottom: 5, top: 5),
                    //         hintText: "Select Payment type",
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(8)),
                    //             borderSide: BorderSide(
                    //                 color:
                    //                     ColorsConstant.secondColorUltraDark))),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   controller: amountController,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter amount';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //       prefixIcon: Icon(
                    //         Icons.currency_rupee,
                    //         size: Adaptive.sp(17),
                    //       ),
                    //       hintText: "Enter Applied Amount",
                    //       label: const Text("Enter Applied Amount"),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       disabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10))),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: InkWell(
                    //     onTap: () async {
                    //       ImagePicker()
                    //           .pickImage(source: ImageSource.gallery)
                    //           .then((value) {
                    //         if (value != null) {
                    //           ref.watch(paymentImageProvider.notifier).state =
                    //               File(value.path);
                    //         }
                    //       });
                    //     },
                    //     child: DottedBorder(
                    //         borderType: BorderType.RRect,
                    //         dashPattern: const [5, 5, 5, 5],
                    //         color: ColorsConstant.primaryColor,
                    //         child: Padding(
                    //           padding: const Pad(all: 20),
                    //           child: Center(
                    //             child: ref.watch(paymentImageProvider) != null
                    //                 ? Stack(
                    //                     children: [
                    //                       Image.file(
                    //                           ref.watch(paymentImageProvider) ??
                    //                               File('path')),
                    //                       Container(
                    //                         decoration: BoxDecoration(
                    //                             color: Colors.black
                    //                                 .withOpacity(0.6),
                    //                             shape: BoxShape.circle),
                    //                         child: IconButton(
                    //                             onPressed: () {
                    //                               ref.invalidate(
                    //                                   paymentImageProvider);
                    //                             },
                    //                             icon: const Icon(
                    //                               Icons.close,
                    //                               color: Colors.white,
                    //                             )),
                    //                       )
                    //                     ],
                    //                   )
                    //                 : ColumnSuper(children: [
                    //                     Icon(
                    //                       LucideIcons.cloud_upload,
                    //                       color: ColorsConstant.primaryColor,
                    //                     ),
                    //                     SizedBox(
                    //                       height: 5,
                    //                     ),
                    //                     Text(
                    //                       "Select Payment Image",
                    //                       textAlign: TextAlign.center,
                    //                       style: TextStyle(
                    //                           color:
                    //                               ColorsConstant.primaryColor,
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: Adaptive.sp(16)),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 5,
                    //                     ),
                    //                     Text(
                    //                       "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                    //                       textAlign: TextAlign.center,
                    //                       style: TextStyle(
                    //                           color:
                    //                               ColorsConstant.primaryColor,
                    //                           fontWeight: FontWeight.w700,
                    //                           fontSize: Adaptive.sp(13)),
                    //                     )
                    //                   ]),
                    //           ),
                    //         )),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // ref.watch(isLoading)
                    //     ? CupertinoActivityIndicator()
                    //     : ElevatedButton(
                    //         onPressed: () {
                    //           if (moneyForm.currentState!.validate()) {
                    //             if (ref.watch(paymentTypeProvider) == null) {
                    //               errorToast(
                    //                   context, 'Please Select payment type');
                    //             }
                    //             if (ref.watch(paymentImageProvider) == null) {
                    //               errorToast(context, 'Please Select Image');
                    //             } else {
                    //               ref.watch(isLoading.notifier).state = true;
                    //               ref
                    //                   .watch(addMoneyProvider(
                    //                           amount: amountController.text
                    //                               .toString(),
                    //                           image: ref
                    //                               .watch(paymentImageProvider),
                    //                           paymentType: ref
                    //                               .watch(paymentTypeProvider)
                    //                               ?.type)
                    //                       .future)
                    //                   .then((value) {
                    //                 ref.watch(isLoading.notifier).state = false;
                    //                 if (value['status'].toString() == "1") {
                    //                   ref.watch(goRouterProvider).pop();
                    //                   successToast(
                    //                       context, value['message'].toString());
                    //                 } else {
                    //                   errorToast(
                    //                       context, value['message'].toString());
                    //                 }
                    //               }).onError((e, s) {
                    //                 ref.watch(isLoading.notifier).state = false;
                    //                 errorToast(context, e.toString());
                    //               });
                    //             }
                    //           }
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //             backgroundColor: ColorsConstant.secondColorDark,
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10))),
                    //         child: Text(
                    //           'Add Money',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               shadows: [
                    //                 const Shadow(
                    //                     color: Colors.white, blurRadius: 0.3)
                    //               ],
                    //               fontWeight: FontWeight.w700,
                    //               fontSize: Adaptive.sp(16)),
                    //         ),
                    //       ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: Pad(all: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorsConstant.secondColorSuperDark,
                              width: 2),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [
                                0,
                                0,
                                1,
                                2,
                                3
                              ],
                              colors: [
                                Colors.transparent.withOpacity(0.8),
                                ColorsConstant.primaryColor,
                                ColorsConstant.secondColorDark,
                                ColorsConstant.secondColorSuperDark,
                                ColorsConstant.primaryColor,
                              ])),
                      child: ColumnSuper(children: [
                        Text(
                          'Bank Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              shadows: const [
                                Shadow(color: Colors.black, blurRadius: 2.0),
                                Shadow(color: Colors.black, blurRadius: 2.0)
                              ],
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(18)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RowSuper(fill: true, children: [
                          Text(
                            'Bank Name',
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          ),
                          Text(
                            "HDFC Bank",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 10.0),
                                  Shadow(color: Colors.black, blurRadius: 10.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        RowSuper(fill: true, children: [
                          Text(
                            'Account Number',
                            style: TextStyle(
                                shadows: const [
                                 Shadow(color: Colors.black, blurRadius: 5.0),
                                  Shadow(color: Colors.black, blurRadius: 5.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          ),
                          Text(
                            "SWFPLT${ref.watch(sharedUtilityProvider).getUser()?.phone?? ""}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                 Shadow(color: Colors.black, blurRadius: 10.0),
                                  Shadow(color: Colors.black, blurRadius: 10.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        RowSuper(fill: true, children: [
                          Text(
                            'IFSC Code',
                            style: TextStyle(
                                shadows: const [
                                 Shadow(color: Colors.black, blurRadius: 5.0),
                                  Shadow(color: Colors.black, blurRadius: 5.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          ),
                          Text(
                            "HDFC0000054",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 10.0),
                                  Shadow(color: Colors.black, blurRadius: 10.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        RowSuper(fill: true, children: [
                          Text(
                            'UPI Id',
                            style: TextStyle(
                                shadows: const [
                                 Shadow(color: Colors.black, blurRadius: 5.0),
                                  Shadow(color: Colors.black, blurRadius: 5.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          ),
                          Text(
                            "swfplt${ref.watch(sharedUtilityProvider).getUser()?.phone?? ""}@hdfcbank",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                 Shadow(color: Colors.black, blurRadius: 10.0),
                                  Shadow(color: Colors.black, blurRadius: 10.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(17)),
                          )
                        ]),
                      ]),
                    ),
                    Expanded(child: SizedBox(height: 10,)),
                    Row(children: [Text(
                      "Please Note:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 2,
                             
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(18)),
                          )],),
                    Text("*Virtual account is opened for each customer hence these account details are useful only for you. Account details of anyone else are not useful for you. Do not share your account details with anyone. After making payment using this account details you need not place any request on the app. Money will be automatically added to your wallet within 5 minutes. For further details please contact 7733901154.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 2,
                              
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(16)),
                          )
                  ],
                ),
              ))),
    );
  }
}

enum PaymentType {
  online('Online', "Online"),
  cheque('Cheques', 'Cheque');

  const PaymentType(this.type, this.title);

  final String type;
  final String title;
}
