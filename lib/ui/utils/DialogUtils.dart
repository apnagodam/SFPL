import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

tripartyDialog(BuildContext context, WidgetRef ref) => showBarModalBottomSheet(
    context: context,
    builder: (context) => ColumnSuper(children: [
      const SizedBox(
        height: 10,
      ),
      Text(
        'How to Verify?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      RowSuper(fill: true, children: [
        ColumnSuper(children: [
          CircleButton(
            onTap: () async {},
            icon: const Icon(
              LucideIcons.file_down,
            ),
            border: Border.all(color: ColorsConstant.primaryColor),
          ),
          Text(
            'Download \nAgreement',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700),
          )
        ]),
        const Divider(
          thickness: 1.0,
        ),
        ColumnSuper(children: [
          CircleButton(
            icon: const Icon(
              LucideIcons.stamp,
            ),
            border: Border.all(color: ColorsConstant.primaryColor),
          ),
          Text('Stamp \nAgreement',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
        ]),
        const Divider(
          thickness: 1.0,
        ),
        ColumnSuper(children: [
          CircleButton(
            icon: const Icon(
              LucideIcons.cloud_upload,
            ),
            border: Border.all(color: ColorsConstant.primaryColor),
          ),
          Text('Upload \nAgreement',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Adaptive.sp(14), fontWeight: FontWeight.w700))
        ]),
      ]),
      const SizedBox(
        height: 10,
      ),
    ]));
