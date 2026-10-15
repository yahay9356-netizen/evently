import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/event.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
import 'package:enntly/screens/add_event.dart';
import 'package:enntly/serves/db_serves.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:enntly/l10n/app_localizations.dart';
import '../provider/config_provider.dart';

class Homescreen extends StatefulWidget {
  static const String name = "Home screen";

  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController _controller;
  int tabIndex = 0;
  String time = DateFormat.d().add_MMM().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ConfigProvider provider = Provider.of<ConfigProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEvent()),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: ColorsManegerLightMode.darkBlue,
        child: const Icon(Icons.add, color: ColorsManegerLightMode.input),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: TextStyle(
                          color: isDark
                              ? Colors.white70
                              : ColorsManegerLightMode.secText,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "yahay Mohamed",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isDark
                              ? Colors.white
                              : ColorsManegerLightMode.mainText,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      provider.changeTheme(
                        isDark ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    icon: Icon(
                      isDark
                          ? Icons.wb_sunny_outlined
                          : Icons.light_mode_outlined,
                      color: isDark
                          ? Colors.amber
                          : ColorsManegerLightMode.darkBlue,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (provider.currentLanguage == "en") {
                        provider.changeLanguage("ar");
                      } else {
                        provider.changeLanguage("en");
                      }
                    },
                    child: Card(
                      color: ColorsManegerLightMode.darkBlue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        child: Text(
                          provider.currentLanguage.toUpperCase(),
                          style: const TextStyle(color: ColorsManegerLightMode.input),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              isScrollable: true,
              controller: _controller,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: CategoryModel.getSubCategory(context).asMap().entries.map((
                entry,
              ) {
                int index = entry.key;
                var category = entry.value;
                return CustomTabBar(
                  selelectedColor: ColorsManegerLightMode.darkBlue,
                  unselelectedColor: isDark
                      ? ColorsManegerDark.surfaceColor
                      : ColorsManegerLightMode.input,
                  selectedTextColor: ColorsManegerLightMode.input,
                  unselectedTextColor: isDark
                      ? Colors.white
                      : ColorsManegerLightMode.mainText,
                  isSelelected: tabIndex == index,
                  icon: category.icon,
                  text: category.name,
                  SelectedFgColor: ColorsManegerLightMode.input,
                  UnSelectedFgColor: isDark
                      ? Colors.white
                      : ColorsManegerLightMode.darkBlue,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: DbServes.getEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  List<EventModel> events = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.separated(
                      itemCount: events.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Event(
                          event: events[index],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
