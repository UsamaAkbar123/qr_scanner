import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/Screens/signin_screen.dart';
import 'package:sas/sharepreferences/share_preference.dart';

import 'package:sas/widgets/colors.dart';
import 'package:sas/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'scanning_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                firstContainer(),
                SizedBox(
                  height: Get.height / 10,
                ),
                Image.network(
                  SharedPreferenceKeys.getCompanyLogo(),
                  colorBlendMode: BlendMode.colorDodge,
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Text("Welcome " + SharedPreferenceKeys.getCompanyName(),
                    style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                SizedBox(
                  height: Get.height / 20,
                ),
                CustomButton(
                  lable: "Scan Now",
                  onPress: () => Get.to(
                      ScanningScreen(
                        companyId: SharedPreferenceKeys.getCompanyId(),
                      ),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(seconds: 1)),
                  color: mainColor,
                  radius: 8,
                  buttonHeight: Get.height / 14,
                  buttonWidth: Get.width / 2,
                  labelColor: textColor,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  lable: "LogOut",
                  onPress: () async {
                    await SharedPreferenceKeys.resetPreferenceValue();
                    Get.offAll(const SignInScreen());
                  },
                  color: mainColor,
                  radius: 8,
                  buttonHeight: Get.height / 14,
                  buttonWidth: Get.width / 2,
                  labelColor: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container firstContainer() {
    return Container(
      height: Get.height / 6,
      width: Get.width / 1.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mainColor,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Scan QR Code",
                style: GoogleFonts.montserrat(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            Text("Scan QR Code to mark your attendance",
                style: GoogleFonts.montserrat(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                textAlign: TextAlign.center),
          ]),
    );
  }
}
