import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sas/widgets/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText2;
  // final TextEditingController txtController;
  final bool obscuretext, enable;
  final TextInputType textInputType;
  // final IconButton iconButton;
  // final GestureDetector ontap;
  const CustomTextField({
    // required this.txtController,
    required this.hintText2,
    required this.obscuretext,
    required this.textInputType,
    // required this.iconButton,
    required this.enable,
    // required this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // readOnly: enable,
      obscureText: obscuretext,
      // controller: txtController,
      // onTap: ontap,
      keyboardType: textInputType,
      cursorColor: mainColor,

      style: GoogleFonts.montserrat(color: textColor),

      decoration: InputDecoration(
        alignLabelWithHint: false,
        // isCollapsed: true,
        isDense: true,

        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: textColor)),

        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: textColor)),
        hintText: hintText2,
        // prefixIcon: iconButton,
        hintStyle: const TextStyle(
          color: Color(0xffC9C9C9),
          fontSize: 14,
          fontFamily: 'SanFrancisco',
        ),
        // enabledBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,

        focusColor: textColor,

        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        fillColor: Colors.transparent,
        filled: false,
      ),
    );
  }
}
