import 'dart:io';

import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swfl/ui/utils/MyHttpOverrides.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:toastification/toastification.dart';

import 'Data/SharedPrefs/SharedUtility.dart';
import 'package:double_back_to_exit/double_back_to_exit.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const ToastificationWrapper(
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        ));
      },
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleBackToExit(snackBarMessage: "Press back again to exit", child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider),
      title: 'SFPL',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: ColorsConstant.primaryColor),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Adaptive.sp(18),
                color: Colors.black)),
        fontFamily: GoogleFonts.manrope().fontFamily,
        colorScheme:
        ColorScheme.fromSeed(seedColor: ColorsConstant.secondColorDark),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android:CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
    ));
  }
}
