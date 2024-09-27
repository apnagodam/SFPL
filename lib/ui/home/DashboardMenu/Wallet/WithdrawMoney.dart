import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Domain/WalletService/WalletService.dart';

import '../../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../utils/colors.dart';
import '../../../utils/routes.dart';
import '../../../utils/routes_strings.dart';
import '../../../utils/widgets.dart';

class Withdrawmoney extends ConsumerStatefulWidget {
  const Withdrawmoney({super.key});

  @override
  ConsumerState<Withdrawmoney> createState() => _WithdrawmoneyState();
}

class _WithdrawmoneyState extends ConsumerState<Withdrawmoney> {
  final moneyForm = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final remarkController = TextEditingController();

  var isLoading = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw Money'),
        actions: [IconButton(onPressed: (){
          context.goNamed(RoutesStrings.withdrawRequests);
        }, icon: Icon(Icons.wallet))],
      ),
      body: SafeArea(
          child: Form(
              key: moneyForm,
              child: Padding(
                padding: Pad(all: 10),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            size: Adaptive.sp(17),
                          ),
                          hintText: "Enter Amount",
                          label: const Text("Enter Amount"),
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
                      keyboardType: TextInputType.text,
                      controller: remarkController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter remark';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          hintText: "Enter Remark ",
                          label: const Text("Enter Remark"),
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
                    ref.watch(isLoading)
                        ? CupertinoActivityIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (moneyForm.currentState!.validate()) {
                                ref.watch(isLoading.notifier).state = true;

                                ref
                                    .watch(withdrawMoneyProvider(
                                            amount: amountController.text
                                                .toString(),
                                            remark: remarkController.text
                                                .toString())
                                        .future)
                                    .then((value) {
                                  ref.watch(isLoading.notifier).state = false;
                                  if (value['status'].toString() == "1") {
                                    ref.watch(goRouterProvider).pop();
                                    successToast(
                                        context, value['message'].toString());
                                  } else {
                                    errorToast(
                                        context, value['message'].toString());
                                  }
                                }).onError((e, s) {
                                  ref.watch(isLoading.notifier).state = false;
                                  errorToast(context, e.toString());
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsConstant.secondColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Withdraw Money',
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.white, blurRadius: 0.3)
                                  ],
                                  fontWeight: FontWeight.w700,
                                  fontSize: Adaptive.sp(16)),
                            ),
                          ),
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
                                ColorsConstant.primaryColor.withOpacity(0.8),
                                ColorsConstant.secondColorDark,
                                ColorsConstant.secondColorSuperDark,
                                ColorsConstant.primaryColor.withOpacity(0.8),
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
                                fontSize: Adaptive.sp(15)),
                          ),
                          Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.bankName ?? ""}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Adaptive.sp(15)),
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
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(15)),
                          ),
                          Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.bankAccNo ?? ""}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Adaptive.sp(15)),
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
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(15)),
                          ),
                          Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.bankIfscCode ?? ""}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Adaptive.sp(15)),
                          )
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        RowSuper(fill: true, children: [
                          Text(
                            'Branch',
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(15)),
                          ),
                          Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.bankBranch ?? ""}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 2.0),
                                  Shadow(color: Colors.black, blurRadius: 2.0)
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Adaptive.sp(15)),
                          )
                        ]),
                      ]),
                    ),
                  ],
                ),
              ))),
    );
  }
}
