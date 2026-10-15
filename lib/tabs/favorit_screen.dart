import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/event.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:enntly/l10n/app_localizations.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});
  static const name = "favorite";
  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  String time = DateFormat.d().add_MMM().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                style: TextStyle(
                  color: isDark ? Colors.white : ColorsManegerLightMode.mainText,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark ? ColorsManegerDark.surfaceColor : ColorsManegerLightMode.storke,
                  hintText: AppLocalizations.of(context)!.searchForEvent,
                  hintStyle: GoogleFonts.poppins(
                    color: isDark ? Colors.white60 : ColorsManegerLightMode.secText,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white70 : ColorsManegerLightMode.secText,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                      color: isDark ? ColorsManegerDark.storke : Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white38 : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 16,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemBuilder: (context, index) {
                  return Event(
                    event: EventModel(
                      id: null,
                      catigory: CategoryModel.getSubCategory(context)[0],
                      titile: "Meeting for Updating The Development Method ",
                      date: time,
                      description: "Meeting for Updating The Development Method ",
                      time: TimeOfDay.now(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
