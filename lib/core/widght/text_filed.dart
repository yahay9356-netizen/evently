import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';

class Textfiled extends StatelessWidget {
  const Textfiled({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      decoration:
      InputDecoration(
        filled: true,
        fillColor: ColorsManegerLightMode.storke,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: ColorsManegerLightMode.secText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}