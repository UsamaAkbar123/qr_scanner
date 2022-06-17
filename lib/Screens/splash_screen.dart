// ignore_for_file: camel_case_types

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/Screens/dashboard_screen.dart';
import 'package:sas/widgets/colors.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Get.offAll(() =>const Dashboard());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              shadows: [
                const Shadow(
                  blurRadius: 5.0,
                  color: Colors.white,
                  offset: Offset(0, 0),
                ),
              ],
              color: textColor,
              textStyle: Theme.of(context).textTheme.headline4,
            ),
            child: AnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Smart \n Attendance \n System",
                    speed:const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
