import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed2.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:flutter/material.dart';

import '../core/widght/elvatet_boutton.dart';
import '../l10n/app_localizations.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  static const String name = "AddEvent";

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;
  late final TabController controller;
  DateTime dateTime = DateTime.now();
  TimeOfDay timeNow = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  SizedBox(width: 120),
                  Text(AppLocalizations.of(context)!.add_event),
                ],
              ),
              Container(
                width: 343,
                height: 193,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image 8.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(height: 16),
              TabBar(
                onTap: (index) {
                  setState(() {
                    tabindex = index;
                  });
                },
                isScrollable: true,
                controller: controller,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: CategoryModel.getSubCategory(context).asMap().entries.map(
                  (entry) {
                    int index = entry.key;
                    var category = entry.value;
                    return CustomTabBar(
                      selelectedColor: ColorsManegerLightMode.darkBlue,
                      unselelectedColor: ColorsManegerLightMode.input,
                      selectedTextColor: ColorsManegerLightMode.input,
                      unselectedTextColor: ColorsManegerLightMode.mainText,
                      isSelelected: tabindex == index,
                      icon: category.icon,
                      text: category.name,
                      SelectedFgColor: ColorsManegerLightMode.input,
                      UnSelectedFgColor: ColorsManegerLightMode.darkBlue,
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              TextFiled2(
                text: AppLocalizations.of(context)!.event_title,
                width: 343,
                hight: 43,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              TextFiled2(
                text: AppLocalizations.of(context)!.event_description,
                width: 343,
                hight: 192,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.edit_calendar,
                    color: ColorsManegerLightMode.darkBlue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.event_date,
                    style: TextStyle(
                      color: ColorsManegerLightMode.mainText,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),

                  Textbutton(
                    nameOFText: "Choose date",
                    onDo: () async {
                      DateTime? newdate = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: dateTime,
                        lastDate: DateTime(2000000000000000000),
                      );
                      if (newdate == null) {
                        return;
                      }
                      setState(() {
                        dateTime = newdate;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: ColorsManegerLightMode.darkBlue,
                  ),
                  SizedBox(width: 5),
                  Text(
                    AppLocalizations.of(context)!.event_time,
                    style: TextStyle(
                      color: ColorsManegerLightMode.mainText,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Spacer(),
                  Textbutton(
                    nameOFText: AppLocalizations.of(context)!.event_date,
                    onDo: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: timeNow,
                      );
                      if (newTime == null) {
                        return;
                      }
                      setState(() {
                        timeNow = newTime;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Boutton(
                  color: ColorsManegerLightMode.darkBlue,
                  name: AppLocalizations.of(context)!.add_event,
                  image: "",
                  textColor: Colors.white,
                  onDo: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
