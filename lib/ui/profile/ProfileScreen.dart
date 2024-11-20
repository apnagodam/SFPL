import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';

import '../utils/colors.dart';

class Profilescreen extends ConsumerStatefulWidget {
  const Profilescreen({super.key});

  @override
  ConsumerState<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends ConsumerState<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const Pad(all: 10),
        child: ListView(
          children: [
            Container(
              height: Adaptive.sp(35),
              width: Adaptive.sp(35),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.profileImage ??
                            "",
                      ),
                      repeat: ImageRepeat.repeat,
                      fit: BoxFit.contain)),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
                onPressed: null,
                child: Text(
                    "${(ref.watch(sharedUtilityProvider).getUser()?.verifiedAccount ?? false) ? "Account Verified" : "Verification Pending"}",
                    style: TextStyle(
                        color: (ref
                                    .watch(sharedUtilityProvider)
                                    .getUser()
                                    ?.verifiedAccount ??
                                false)
                            ? ColorsConstant.primaryColor
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(17)))),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
                onPressed: null,
                child: Text('Personal Details',
                    style: TextStyle(
                        color: ColorsConstant.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(17)))),
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref.watch(sharedUtilityProvider).getUser()?.name ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Firm Name:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.firmName ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Pan Card Number:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.pancardNo ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Aadhar Card No:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.aadharNo ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref.watch(sharedUtilityProvider).getUser()?.address ??
                              "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Pan Card Image:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InstaImageViewer(
                            child: Image.network(
                          height: Adaptive.sh(5),
                          width: Adaptive.sw(5),
                          '${ref.watch(sharedUtilityProvider).getUser()?.pancardImage}',
                          errorBuilder: (context, ob, s) =>
                              Icon(LucideIcons.circle_stop),
                          fit: BoxFit.cover,
                        )),
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Aadhar Card Image:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InstaImageViewer(
                            child: Image.network(
                          height: Adaptive.sh(5),
                          width: Adaptive.sw(5),
                          '${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}',
                          errorBuilder: (context, ob, s) =>
                              Icon(LucideIcons.circle_stop),
                          fit: BoxFit.cover,
                        )),
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Aadhar Card Image(Back):',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InstaImageViewer(
                            child: Image.network(
                          height: Adaptive.sh(5),
                          width: Adaptive.sw(5),
                          '${ref.watch(sharedUtilityProvider).getUser()?.aadharBackImage}',
                          errorBuilder: (context, ob, s) =>
                              Icon(LucideIcons.circle_stop),
                          fit: BoxFit.cover,
                        )),
                      ],
                    )),
              ],
            ),
            CupertinoButton(
                onPressed: null,
                child: Text('Bank Details',
                    style: TextStyle(
                        color: ColorsConstant.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(17)))),
            const SizedBox(
              height: 10,
            ),
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Bank Name:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.bankName ??
                              "N/A",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Bank Account Number:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.bankAccNo ??
                              "N/A",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Bank Branch:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.bankBranch ??
                              "N/A",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Bank IFSC Code:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${ref.watch(sharedUtilityProvider).getUser()?.bankIfscCode ?? "N/A"}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Cheque Image:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InstaImageViewer(
                            child: Image.network(
                          height: Adaptive.sh(5),
                          width: Adaptive.sw(5),
                          '${ref.watch(sharedUtilityProvider).getUser()?.chequeImage}',
                          errorBuilder: (context, ob, s) =>
                              Icon(LucideIcons.circle_stop),
                          fit: BoxFit.cover,
                        )),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
                onPressed: null,
                child: Text('Document Details',
                    style: TextStyle(
                        color: ColorsConstant.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Adaptive.sp(17)))),
            const SizedBox(
              height: 10,
            ),
            CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Proprietorship Doc Type:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofDoc ?? "N/A"}")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      fitHorizontally: true,
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Proprietorship Doc No: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofNo ?? "N/A"}")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          'Proprietorship Image:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InstaImageViewer(
                            child: Image.network(
                          height: Adaptive.sh(5),
                          width: Adaptive.sw(5),
                          '${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofDoc}',
                          errorBuilder: (context, ob, s) =>
                              Icon(LucideIcons.circle_stop),
                          fit: BoxFit.cover,
                        )),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
