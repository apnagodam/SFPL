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
            CircleAvatar(
              foregroundImage: NetworkImage(
                  ref.watch(sharedUtilityProvider).getUser()?.profileImage ??
                      "",
                  scale: 0.5),
              radius: Adaptive.sh(10),
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
                        const Text('Name:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref.watch(sharedUtilityProvider).getUser()?.name ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Firm Name:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.firmName ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Pan Card Number:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.pancardNo ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Aadhar Card No:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.aadharNo ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Address:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.address ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Pan Card Image:'),
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
                        const Text('Aadhar Card Image:'),
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
                        const Text('Aadhar Card Image(Back):'),
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
                        const Text('Bank Name:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.bankName ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Bank Account Number:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.bankAccNo ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Bank Branch:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.bankBranch ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Bank IFSC Code:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.bankIfscCode ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Cheque Image:'),
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
                        const Text('Proprietorship Doc Type:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.proprietorshipProofDoc ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      fitHorizontally: true,
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Proprietorship Doc No: '),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(ref
                                .watch(sharedUtilityProvider)
                                .getUser()
                                ?.proprietorshipProofNo ??
                            "")
                      ],
                    )),
                CupertinoActionSheetAction(
                    onPressed: () {},
                    child: RowSuper(
                      mainAxisSize: MainAxisSize.max,
                      alignment: Alignment.centerLeft,
                      children: [
                        const Text('Proprietorship Image:'),
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
