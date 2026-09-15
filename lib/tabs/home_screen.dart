import 'package:enntly/core/colors_maneger_light.dart';
import 'package:enntly/core/widght/event.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  static const String name = "Home screen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController _controller;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Welcome Back ✨",
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
              tabs: CategoryModel.subCategory!.asMap().entries.map((entry) {
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
                  return Event();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
