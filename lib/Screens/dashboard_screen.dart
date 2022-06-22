import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sas/widgets/colors.dart';
import 'package:sas/widgets/custom_button.dart';

import 'scanning_screen.dart';

class Dashboard extends StatefulWidget {
  final String company_id;
  final String comapny_logo;
  final String company_name;

  const Dashboard(
      {Key? key,
      required this.company_id,
      required this.company_name,
      required this.comapny_logo})
      : super(key: key);

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
            child: Column(children: [
              SizedBox(
                height: Get.height / 20,
              ),
              firstContainer(),
              SizedBox(
                height: Get.height / 10,
              ),
              Image.network(
                widget.comapny_logo,
                colorBlendMode: BlendMode.colorDodge,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Text("Welcome " + widget.company_name,
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
                        companyId: widget.company_id,
                      ),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(seconds: 1)),
                  color: mainColor,
                  radius: 8,
                  buttonHeight: Get.height / 14,
                  buttonWidth: Get.width / 2,
                  labelColor: textColor),
            ]),
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
