import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/Screens/test_screen.dart';
import 'package:sas/widgets/colors.dart';
import 'package:sas/widgets/custom_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // late Image image1;

  @override
  void initState() {
    super.initState();
    //image1 = Image.asset("images/barcode_cartoon.png");
  }

  // @override
  // void didChangeDependencies() {
  //   //precacheImage(image1.image, context);
  //   //precacheImage(const AssetImage("images/barcode_cartoon.png"), context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    //precacheImage(image1.image, context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SizedBox(
          width: Get.width,
          child: Column(children: [
            SizedBox(
              height: Get.height / 20,
            ),
            firstContainer(),
            SizedBox(
              height: Get.height / 10,
            ),
            SizedBox(
              width: Get.width / 1.2,              
              child: Image.asset("assets/images/barcode_cartoon.png",
                  colorBlendMode: BlendMode.colorDodge, scale: 10),              
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            CustomButton(
                lable: "Scan Now",
                onPress: () => Get.to(const QRViewExample(),
                    transition: Transition.rightToLeftWithFade,
                    duration:const Duration(seconds: 1)),
                color: mainColor,
                radius: 8,
                buttonHeight: Get.height / 15,
                buttonWidth: Get.width / 2,
                labelColor: textColor),
          ]),
        ),
      ),
    );
  }

  Container firstContainer() {
    return Container(
      height: Get.height / 7,
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
            Text("Scan QR Code to make your attendance",
                style: GoogleFonts.montserrat(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                textAlign: TextAlign.center),
          ]),
    );
  }
}
