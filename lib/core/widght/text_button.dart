import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({
    super.key, 
    required this.nameOFText,
    required this.onDo,
  });

  final String nameOFText;
  final void Function() onDo; 

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onDo,
      child: Text(
        "$nameOFText ",
        style:
        TextStyle(
          color: ColorsManegerLightMode.darkBlue,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}