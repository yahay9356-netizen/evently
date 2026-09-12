import 'package:flutter/material.dart';

class Boutton extends StatelessWidget {
  const Boutton({
    super.key,
    required this.name,
    required this.color,
    required this.image,
    required this.textColor,
    required this.onDo
  });
  final String? name;
  final Color color;
  final String image;
  final Color textColor;
    final void Function() onDo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onDo,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image.isEmpty ? SizedBox() : Image.asset(image),
          Text(
            "$name",
            style:
            TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
