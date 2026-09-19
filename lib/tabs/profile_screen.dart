import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 26),
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset("assets/Route profile.png"),
              ),
              SizedBox(height: 16),
              Text(
                "yahay Mohamed",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 4),
              Text(
                "yahayMohamed@gmail.com",
                style: GoogleFonts.poppins(
                  color: ColorsManegerLightMode.secText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: 400,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    Text(
                    AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    FlutterSwitch(
                      value: isDarkMode,
                      onToggle: (value) {
                        setState(() => isDarkMode = value);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    PopupMenuButton<String>(
                      onSelected: (value) {

                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: "English",
                            child: Text("English"),
                          ),
                          PopupMenuItem<String>(
                            value: "Arabic",
                            child: Text("Arabic"),
                          ),
                        ];
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorsManegerLightMode.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.logout,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.door_back_door,
                      color: ColorsManegerLightMode.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}