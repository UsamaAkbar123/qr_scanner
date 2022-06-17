import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/widgets/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.lable,
      required this.onPress,
      required this.color,
      required this.radius,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.labelColor});

  final String lable;
  final VoidCallback onPress;
  final Color color, labelColor;
  final double radius, buttonHeight, buttonWidth;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ))),

          // ignore: sort_child_properties_last
          child: Center(
            child: Text(
              lable,
              style: GoogleFonts.montserrat(
                  color: labelColor, fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: onPress),
    );
  }
}
