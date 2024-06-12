import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swfl/ui/splash/onboarding_screen.dart';
import 'package:swfl/ui/utils/colors.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          home: MyApp(),
        );
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.quicksand().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorsConstant.secondColorDark),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
    );
  }
}
