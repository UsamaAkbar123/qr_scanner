import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/main.dart';
import 'package:sas/widgets/colors.dart';
import 'package:sas/widgets/custom_button.dart';
import 'package:sas/widgets/custom_text_field.dart';

import 'dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // height: Get.height,
          padding: EdgeInsets.only(left: 20, right: 25),
          child: Form(
            // key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                Center(
                    child: Text('SAS',
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontWeight: FontWeight.w500,
                            color: textColor))),
                SizedBox(
                  height: Get.height / 10,
                ),
                Text('Hello, \nWelcome!',
                    style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headline5,
                        fontWeight: FontWeight.w300,
                        color: textColor)),
                SizedBox(
                  height: Get.height / 20,
                ),
                const CustomTextField(
                  enable: false,
                  obscuretext: false,
                  // txtController: emailController,
                  hintText2: 'username',

                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                const CustomTextField(
                  enable: false,
                  obscuretext: true,
                  hintText2: 'Password',
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: Get.height / 15,
                ),
                CustomButton(
                  lable: 'Sign In',
                  labelColor: textColor,
                  color: mainColor,
                  radius: 8,
                  onPress: () =>
                      // Get.snackbar("Login", "Successfully You Login"),
                      Get.offAll(const Dashboard()),
                  // _onLogin(context),
                  buttonHeight: Get.height / 15,
                  buttonWidth: Get.width / 2,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
