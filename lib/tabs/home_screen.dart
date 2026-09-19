import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/event.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  static const String name = "Home screen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController _controller;
  int tabIndex = 0;
String time=DateFormat.d().add_MMM().format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getSubCategory(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: ColorsManegerLightMode.darkBlue,
        child: Icon(Icons.add, color: ColorsManegerLightMode.input),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
        AppLocalizations.of(context)!.welcome_back,
                          style: TextStyle(
                            color: ColorsManegerLightMode.secText,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "yahay Mohamed",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.light_mode_outlined,
                  color: ColorsManegerLightMode.darkBlue,
                ),
                Card(
                  color: ColorsManegerLightMode.darkBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    child: Text(
                      "En",
                      style: TextStyle(color: ColorsManegerLightMode.input),
                    ),
                  ),
                ),
              ],
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
              tabs: CategoryModel.getSubCategory(context).asMap().entries.map((entry) {
                int index = entry.key;
                var category = entry.value;
                return CustomTabBar(
                  selelectedColor: ColorsManegerLightMode.darkBlue,
                  unselelectedColor: ColorsManegerLightMode.input,
                  selectedTextColor: ColorsManegerLightMode.input,
                  unselectedTextColor: ColorsManegerLightMode.mainText,
                  isSelelected: tabIndex == index,
                  icon: category.icon,
                  text: category.name,
                  SelectedFgColor: ColorsManegerLightMode.input,
                  UnSelectedFgColor: ColorsManegerLightMode.darkBlue,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 16,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemBuilder: (context, index) {
                  return Event(
                    event: EventModel(
                      catigory: CategoryModel.getSubCategory(context)[0],
                      titile: "Meeting for Updating The Development Method ",
                      date:time,
                      description:
                          "Meeting for Updating The Development Method ",
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
