import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:project_structure/config/app_string.dart';
import 'package:project_structure/view/Auth/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/global_variables.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.homeAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kWhite),
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor.withOpacity(0.3),
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backgroundColor,
            scrolledUnderElevation: 0.15
        ),
      ),
      home: SplashScreen(),
    );
  }}