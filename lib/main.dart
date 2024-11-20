import 'dart:io';

import 'package:double_back_to_exit/double_back_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:one_context/one_context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swfl/ui/utils/MyHttpOverrides.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:toastification/toastification.dart';

import 'Data/SharedPrefs/SharedUtility.dart';
import 'package:double_back_to_exit/double_back_to_exit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();

  if (Platform.isAndroid) {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // Perform immediate update
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
            }
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          //Perform flexible update
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    });
  }

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return  ToastificationWrapper(
            child: MaterialApp(
              // Configure Navigator key
              navigatorKey: OneContext().key,

              // Configure [OneContext] to dialogs, overlays, snackbars, and ThemeMode
              builder: OneContext().builder,
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
    return
      MaterialApp.router(
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
              TargetPlatform.android:FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
      );
  }
}
