import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/event.dart';
import 'package:enntly/core/widght/text_filed.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
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
                        Expanded(
              child: ListView.separated(
                itemCount: 16,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemBuilder: (context, index) {
                  return Event(
                    event: EventModel(
                      catigory: CategoryModel.subCategory?[0],
                      titile: "Meeting for Updating The Development Method ",
                      date: DateTime.now(),
                      description:
                          "Meeting for Updating The Development Method ",
                      time: TimeOfDay.now(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
