import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/Data/SharedPrefs/SharedUtility.dart';
import 'package:swfl/ui/utils/widgets.dart';

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
      body: ListView(
        padding: const Pad(all: 20),
        children: [
          //  "${? "Account Verified" : "Verification Pending"}"
          Align(
            alignment: Alignment.center,
            child: roundedProfileImage(
              imageUrl:
                  ref.watch(sharedUtilityProvider).getUser()?.profileImage ??
                      "",
            ),
          ),
          if ((ref.watch(sharedUtilityProvider).getUser()?.verifiedAccount ??
              false))
            const SizedBox(
              height: 10,
            ),

          if ((ref.watch(sharedUtilityProvider).getUser()?.verifiedAccount ??
              false))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verified",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(16),
                      color: ColorsConstant.primaryColor),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.verified,
                    size: Adaptive.sp(18), color: ColorsConstant.primaryColor)
              ],
            ),

          const SizedBox(
            height: 10,
          ),
          Divider(),
          const SizedBox(
            height: 10,
          ),
          Text('Account Details',
              style: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(16))),

          Divider(
            endIndent: 200,
            thickness: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                ref.watch(sharedUtilityProvider).getUser()?.name ?? "",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Firm Name:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                ref.watch(sharedUtilityProvider).getUser()?.firmName ?? "",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pan Card Number:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.pancardNo ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aadhar Card No:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.aadharNo ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.address ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pan Card Image:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              roundedWidget(
                  child: InstaImageViewer(
                      child: Image.network(
                height: Adaptive.sh(5),
                width: Adaptive.sw(5),
                '${ref.watch(sharedUtilityProvider).getUser()?.pancardImage}',
                errorBuilder: (context, ob, s) =>
                    const Icon(LucideIcons.circle_stop),
                fit: BoxFit.cover,
              ))),
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aadhar Card Image:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              roundedWidget(
                child: InstaImageViewer(
                    child: Image.network(
                  height: Adaptive.sh(5),
                  width: Adaptive.sw(5),
                  '${ref.watch(sharedUtilityProvider).getUser()?.aadharImage}',
                  errorBuilder: (context, ob, s) =>
                      const Icon(LucideIcons.circle_stop),
                  fit: BoxFit.cover,
                )),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aadhar Card Image(Back):',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              roundedWidget(
                child: InstaImageViewer(
                    child: Image.network(
                  height: Adaptive.sh(5),
                  width: Adaptive.sw(5),
                  '${ref.watch(sharedUtilityProvider).getUser()?.aadharBackImage}',
                  errorBuilder: (context, ob, s) =>
                      const Icon(LucideIcons.circle_stop),
                  fit: BoxFit.cover,
                )),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Bank Details',
              style: TextStyle(
                  color: ColorsConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(16))),

          Divider(
            endIndent: 200,
            thickness: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank Name:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.bankName ?? "N/A",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank Account Number:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.bankAccNo ?? "N/A",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank Branch:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ref.watch(sharedUtilityProvider).getUser()?.bankBranch ?? "N/A",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank IFSC Code:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${ref.watch(sharedUtilityProvider).getUser()?.bankIfscCode ?? "N/A"}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cheque Image:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              roundedWidget(
                  child: InstaImageViewer(
                      child: Image.network(
                height: Adaptive.sh(5),
                width: Adaptive.sw(5),
                '${ref.watch(sharedUtilityProvider).getUser()?.chequeImage}',
                errorBuilder: (context, ob, s) =>
                    const Icon(LucideIcons.circle_stop),
                fit: BoxFit.cover,
              ))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (ref
                  .watch(sharedUtilityProvider)
                  .getUser()
                  ?.constitution
                  .toString() ==
              "2")
            Text('Document Details',
                style: TextStyle(
                    color: ColorsConstant.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Adaptive.sp(16))),

          Divider(
            endIndent: 200,
            thickness: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          if (ref
                  .watch(sharedUtilityProvider)
                  .getUser()
                  ?.constitution
                  .toString() ==
              "2")
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proprietorship Doc Type:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofDoc ?? "N/A"}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proprietorship Doc No: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofNo ?? "N/A"}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proprietorship Image:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    roundedWidget(
                        child: InstaImageViewer(
                            child: Image.network(
                      height: Adaptive.sh(5),
                      width: Adaptive.sw(5),
                      '${ref.watch(sharedUtilityProvider).getUser()?.proprietorshipProofDoc}',
                      errorBuilder: (context, ob, s) =>
                          const Icon(LucideIcons.circle_stop),
                      fit: BoxFit.cover,
                    ))),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
