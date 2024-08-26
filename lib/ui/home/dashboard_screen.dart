import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dotted_border/dotted_border.dart' as dotted;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:path/path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:swfl/ui/utils/routes_strings.dart';

import '../../Domain/AuthenticationService/AuthenticationService.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

var triPartyImageProvider = StateProvider<File?>((ref) => null);

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(loginInfoProvider.future).then((value) async {
        if (value.data?.isLogin != false) {
          ref.watch(sharedUtilityProvider).setUser(value.data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/swfl.png',
          fit: BoxFit.contain,
          height: Adaptive.h(2.5),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.help))],
        iconTheme: IconThemeData(color: ColorsConstant.secondColorSuperDark),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.profile);
                    },
                    child: RowSuper(
                      alignment: Alignment.centerLeft,
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.profileImage ??
                              ""),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${ref.watch(sharedUtilityProvider).getUser()?.firmName}',
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ],
            ),
            CupertinoActionSheet(
              title:  Center(child: Text('Loan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: Adaptive.sp(16)),),),

              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    context.goNamed(RoutesStrings.applyForLoan);
                    // if (ref
                    //         .watch(sharedUtilityProvider)
                    //         .getUser()
                    //         ?.tryPartyStatus !=
                    //     2) {
                    //   tripartyDialog(context, ref);
                    // } else {
                    //
                    // }
                  },
                  child: Text('Apply For Loan',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.sanctionedAmount);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Sanctioned Amount',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            CupertinoActionSheet(
              title:  Center(child: Text('Wallet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: Adaptive.sp(16)),),),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.addMoney);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Add Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.moneyRequests);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Add Money Requests',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                CupertinoActionSheetAction(
                    onPressed: () {
                      context.goNamed(RoutesStrings.withdrawMoney);
                      // if (ref
                      //         .watch(sharedUtilityProvider)
                      //         .getUser()
                      //         ?.tryPartyStatus !=
                      //     2) {
                      //   tripartyDialog(context, ref);
                      // } else {
                      //   context.goNamed(RoutesStrings.sanctionedAmount);
                      // }
                    },
                    child: Text('Withdraw Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Adaptive.sp(16),
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () async {
                      ref.watch(logoutProvider.future).then((value) async {
                        await ref.watch(sharedPreferencesProvider).clear();
                        setState(() {});
                        ref
                            .watch(goRouterProvider)
                            .goNamed(RoutesStrings.login);
                      });
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: Adaptive.sp(16),
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            )
          ],
        ),
      ),
      body: const HomeScreen(),
    );
  }

  var activeStepProvider = StateProvider((ref) => 0);

  tripartyDialog(BuildContext context, WidgetRef ref) =>
      Dialogs.bottomMaterialDialog(
          context: context,
          title: 'Upload Documents',
          msg: "Please verify your account by uploading documents",
          titleStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
          msgStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16)),
          actions: [
            Consumer(
                builder: (context, ref, child) => Column(
                      children: [
                        RowSuper(fill: true, children: [
                          ColumnSuper(children: [
                            CircleButton(
                              onTap: () async {},
                              icon: Icon(
                                LucideIcons.file_down,
                              ),
                              border: Border.all(
                                  color: ColorsConstant.primaryColor),
                            ),
                            Text(
                              'Download \nAgreement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: Adaptive.sp(14),
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                          Divider(
                            thickness: 1.0,
                          ),
                          ColumnSuper(children: [
                            CircleButton(
                              icon: Icon(
                                LucideIcons.stamp,
                              ),
                              border: Border.all(
                                  color: ColorsConstant.primaryColor),
                            ),
                            Text('Stamp \nAgreement',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(14),
                                    fontWeight: FontWeight.w700))
                          ]),
                          Divider(
                            thickness: 1.0,
                          ),
                          ColumnSuper(children: [
                            CircleButton(
                              icon: Icon(
                                LucideIcons.cloud_upload,
                              ),
                              border: Border.all(
                                  color: ColorsConstant.primaryColor),
                            ),
                            Text('Upload \nAgreement',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(14),
                                    fontWeight: FontWeight.w700))
                          ]),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf']);

                            if (result != null) {
                              File file = File(result.files.single.path!);
                              ref.watch(triPartyImageProvider.notifier).state =
                                  file;
                            } else {}
                          },
                          child: dotted.DottedBorder(
                              borderType: dotted.BorderType.RRect,
                              dashPattern: const [6, 6, 6, 6],
                              color: ColorsConstant.primaryColor,
                              child: Padding(
                                padding: const Pad(all: 20),
                                child: Center(
                                  child: ref.watch(triPartyImageProvider) !=
                                          null
                                      ? ColumnSuper(
                                          alignment: Alignment.center,
                                          children: [
                                              const Icon(
                                                LucideIcons.file,
                                                color:
                                                    ColorsConstant.primaryColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Text(
                                                  "${basename(ref.watch(triPartyImageProvider)?.path ?? "")}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          Adaptive.sp(14)),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                              )
                                            ])
                                      : ColumnSuper(children: [
                                          const Icon(LucideIcons.file),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text('Tri Party Doc*',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Adaptive.sp(14)))
                                        ]),
                                ),
                              )),
                        ),
                        IconsButton(
                          onPressed: () async {},
                          text: 'Upload',
                          iconData: Icons.cloud_upload,
                          color: ColorsConstant.primaryColor,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: 'Having trouble uploading docs?',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Adaptive.sp(15)),
                            children: [
                              TextSpan(
                                  text: 'click here',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          ColorsConstant.secondColorSuperDark,
                                      fontSize: Adaptive.sp(15)))
                            ])),
                      ],
                    ))
          ]);
}
