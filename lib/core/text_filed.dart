import 'package:enntly/core/colors_maneger_light.dart';
import 'package:flutter/material.dart';

class Textfiled extends StatelessWidget {
  const Textfiled({
    super.key,
    required this.hintText,
    required this.nameoficon,
    required this.name2ofiocn,
  });
  final String? hintText;
  final IconData? nameoficon;
  final IconData? name2ofiocn;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManegerLightMode.storke,
        hintText: "$hintText",
        hintStyle: TextStyle(
          color: ColorsManegerLightMode.secText,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: ColorsManegerLightMode.storke,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
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
