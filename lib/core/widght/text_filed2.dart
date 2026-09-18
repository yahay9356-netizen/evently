import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:flutter/material.dart';

class TextFiled2 extends StatelessWidget {
  const TextFiled2({
    super.key,
    required this.text,
    required this.width,
    required this.hight,
  });
  final String text;
  final double width;
  final double hight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: hight,
        width: width,
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          textAlign: TextAlign.start,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            filled: true,
            hintText: text,
            fillColor: ColorsManegerLightMode.storke,
            hintStyle: TextStyle(
              color: ColorsManegerLightMode.secText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: ColorsManegerLightMode.input,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: ColorsManegerLightMode.input,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
