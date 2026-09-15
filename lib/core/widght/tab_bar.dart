import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    super.key,
    required this.selelectedColor,
    required this.unselelectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.isSelelected,
    required this.icon,
    required this.text,
    // ignore: non_constant_identifier_names
    required this.SelectedFgColor,
    // ignore: non_constant_identifier_names
    required this.UnSelectedFgColor,
  });

  Color? selelectedColor;
  Color? unselelectedColor;
  Color? selectedTextColor;
  Color? unselectedTextColor;
  // ignore: non_constant_identifier_names
  Color ?SelectedFgColor;
  // ignore: non_constant_identifier_names
  Color ?UnSelectedFgColor;
  bool isSelelected;

  IconData? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelelected ? selelectedColor : unselelectedColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelelected ? SelectedFgColor : UnSelectedFgColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            "$text",
            style: GoogleFonts.poppins(
              color: isSelelected ? selectedTextColor : unselectedTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
