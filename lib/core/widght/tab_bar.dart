import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTabBar extends StatefulWidget {
  CustomTabBar({
    super.key,
    required this.selelectedColor,
    required this.unselelectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.isSelelected,
    required this.icon,
    required this.text,
    required this.SelectedFgColor,
    required this.UnSelectedFgColor,
  });

  Color? selelectedColor;
  Color? unselelectedColor;
  Color? selectedTextColor;
  Color? unselectedTextColor;
  Color ?SelectedFgColor;
  Color ?UnSelectedFgColor;
  bool isSelelected;

  IconData? icon;
  String? text;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.isSelelected ? widget.selelectedColor : widget.unselelectedColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: widget.isSelelected ? widget.SelectedFgColor : widget.UnSelectedFgColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            "${widget.text}",
            style: GoogleFonts.poppins(
              color: widget.isSelelected ? widget.selectedTextColor : widget.unselectedTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
