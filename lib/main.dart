import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/Screens/splash_screen.dart';
import 'package:sas/sharepreferences/share_preference.dart';
import 'package:sas/widgets/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceKeys.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 100),
        title: 'Smart Attendance System',
        theme: ThemeData(
          primaryColor: mainColor,
        ),
        home: const splashScreen());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
