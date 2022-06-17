import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/widgets/colors.dart';

class Scanning extends StatefulWidget {
  const Scanning({Key? key}) : super(key: key);

  @override
  State<Scanning> createState() => _ScanningState();
}

class _ScanningState extends State<Scanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Container(
        width: Get.width / 1.2,
        height: Get.height / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 40,
            ),
            Text(
              "Scanning QR Code",
              style: GoogleFonts.montserrat(
                  color: mainColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
