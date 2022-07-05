import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/controller/api_services.dart';
import 'package:sas/sharepreferences/share_preference.dart';

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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isRememberMeCheck = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // height: Get.height,
          padding: const EdgeInsets.only(left: 20, right: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                Center(
                    child: Text('SASWES',
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
                EmailTextField(
                  enable: false,
                  obscuretext: false,
                  txtController: emailController,
                  hintText2: 'email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                PasswordTextField(
                  enable: false,
                  obscuretext: true,
                  hintText2: 'Password',
                  textInputType: TextInputType.text,
                  txtController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      focusColor: Colors.green,
                      //activeColor: Colors.amber,
                      value: isRememberMeCheck,
                      onChanged: (change) async {
                        setState(() {
                          isRememberMeCheck = !isRememberMeCheck;
                        });
                      },
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height / 15,
                ),
                CustomButton(
                  lable: 'Sign In',
                  labelColor: textColor,
                  color: mainColor,
                  radius: 8,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      onloginSccess(
                        emailController.text,
                        passwordController.text,
                      );
                    } else {
                      (Get.snackbar("Error", "Something is Wrong",
                          backgroundColor: mainColor, colorText: textColor));
                    }
                  },
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

  void onloginSccess(String em, String pas) async {
    var response = await ApiServices().onLogin(em, pas);
    Map signinData = {};
    signinData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (signinData == {} || signinData["status"] == "false") {
        Get.snackbar(
          "Try Again",
          "Email or Password is Wrong",
          backgroundColor: mainColor,
          colorText: textColor,
        );
      } else {
        try {
          if (isRememberMeCheck == true) {
            await SharedPreferenceKeys.setUserLoginRememberMeInfo(true);
            await SharedPreferenceKeys.setUserLoginInfo(
              signinData['org_id'],
              signinData['org_name'],
              signinData['logo'],
            );
          } else {
            await SharedPreferenceKeys.setUserLoginRememberMeInfo(false);
            await SharedPreferenceKeys.setUserLoginInfo(
              signinData['org_id'],
              signinData['org_name'],
              signinData['logo'],
            );
          }
          Get.offAll(const Dashboard());
        } on Exception catch (_) {
          Get.snackbar("Try Again", "Email or Password is Wrong",
              backgroundColor: mainColor, colorText: textColor);
        }
      }
    } else {
      Get.snackbar("Error", "something is wrong");
    }
  }
}
