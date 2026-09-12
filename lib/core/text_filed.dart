import 'package:enntly/core/colors_maneger_light.dart';
import 'package:flutter/material.dart';

class Textfiled extends StatelessWidget {
  const Textfiled({
    super.key,
    required this.hintText,
    this.nameoficon,
    this.name2ofiocn,
    required this.controller,
    required this.validator,
  });

  final String? hintText;
  final IconData? nameoficon;
  final IconData? name2ofiocn;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManegerLightMode.storke,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorsManegerLightMode.secText,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorsManegerLightMode.storke,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorsManegerLightMode.storke,
            width: 2,
          ),
        ),
        suffixIcon: nameoficon != null ? Icon(nameoficon) : null,
        prefixIcon: name2ofiocn != null ? Icon(name2ofiocn) : null,
      ),
    );
  }
}