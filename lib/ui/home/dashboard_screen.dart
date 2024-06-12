import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/home/home_screen.dart';
import 'package:swfl/ui/utils/colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            DrawerHeader(
                decoration: BoxDecoration(),
                child: RowSuper(
                  fill: true,
                  children: [
                    CircleAvatar(
                      radius: Adaptive.h(5),
                      backgroundColor: ColorsConstant.secondColorDark,
                    ),
                    ColumnSuper(alignment: Alignment.centerLeft, children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Adaptive.sp(16)),
                      ),
                      Text("+919001155788",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: Adaptive.sp(16)))
                    ])
                  ],
                ))
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}
