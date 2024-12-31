import 'dart:io';

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:one_context/one_context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swfl/Domain/Dio/DioProvider.dart';
import 'package:swfl/ui/utils/MyHttpOverrides.dart';
import 'package:swfl/ui/utils/colors.dart';
import 'package:swfl/ui/utils/notification_service.dart';
import 'package:swfl/ui/utils/routes.dart';
import 'package:toastification/toastification.dart';

import 'Data/SharedPrefs/SharedUtility.dart';

WebViewEnvironment? webViewEnvironment;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();
  await NotificationService.init();
  ElevarmFontFamilies.init(
    allowRuntimeFetching: true,
  );

  var token = await FirebaseMessaging.instance.getToken();
  print(token);
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
        return ToastificationWrapper(
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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    /// Foreground notification handler
    FirebaseMessaging.onMessage.listen((message) async {
      await FlutterLocalNotificationsPlugin().initialize(
        const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        ),
        onDidReceiveNotificationResponse: (response) {
          debugPrint(response.toString());
        },
      );
    });

    /// Background notification handler
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await FlutterLocalNotificationsPlugin().initialize(
        const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        ),
        onDidReceiveNotificationResponse: (response) {
          debugPrint(response.toString());
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: ref.watch(goRouterProvider),
        title: 'SFPL',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          appBarTheme: AppBarTheme(
              color: Colors.grey.shade100,
              iconTheme: IconThemeData(color: ColorsConstant.primaryColor),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(18),
                  color: Colors.black)),
          fontFamily: GoogleFonts.inter().fontFamily,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorsConstant.primaryColor),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
      ),
      if (ref.watch(dioProvider).options.baseUrl == ApiClient.testBaseUrl)
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.only(top: 55, right: 50),
            child: const Banner(
              message: "Testing",
              location: BannerLocation.bottomStart,
            ),
          ),
        ),
    ]);
  }
}
