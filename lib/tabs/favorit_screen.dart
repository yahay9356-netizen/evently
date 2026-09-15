import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});
  static const name = "favorite";
  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: ColorsManegerLightMode.storke,
                  hintText: "Search for event",
                  hintStyle: GoogleFonts.poppins(
                    color: ColorsManegerLightMode.secText,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
