import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed2.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../serves/db_serves.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  static const String name = "AddEvent";

  @override
  State<AddEvent> createState() => _AddEventState();
}

TextEditingController EventTitle = TextEditingController();
TextEditingController EventDescription = TextEditingController();
GlobalKey<FormState> EventKey = GlobalKey<FormState>();

class _AddEventState extends State<AddEvent>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;
  late final TabController controller;
  DateTime dateTime = DateTime.now();
  TimeOfDay timeNow = TimeOfDay.now();
  bool isDateSelected = false;
  bool isTimeSelected = false;

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
    final categories = CategoryModel.getSubCategory(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: EventKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 120),
                    Text(AppLocalizations.of(context)!.addEvent),
                  ],
                ),
                Container(
                  width: 343,
                  height: 193,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/image 8.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 10),
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
                  text: AppLocalizations.of(context)!.eventTitle,
                  width: 343,
                  hight: 43,
                  controller: EventTitle,
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
                const SizedBox(height: 10),
                TextFiled2(
                  controller: EventDescription,
                  text: AppLocalizations.of(context)!.eventDescription,
                  width: 343,
                  hight: 192,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_calendar,
                        color: ColorsManegerLightMode.darkBlue,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context)!.eventDate,
                        style: const TextStyle(
                          color: ColorsManegerLightMode.mainText,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        child: Textbutton(
                          nameOFText: isDateSelected
                              ? DateFormat('dd/MM/yyyy').format(dateTime)
                              : AppLocalizations.of(context)!.chooseDate,
                          onDo: () async {
                            DateTime? newdate = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (newdate == null) {
                              return;
                            }
                            setState(() {
                              dateTime = newdate;
                              isDateSelected = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: ColorsManegerLightMode.darkBlue,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.eventTime,
                        style: const TextStyle(
                          color: ColorsManegerLightMode.mainText,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        child: Textbutton(
                          nameOFText: isTimeSelected
                              ? timeNow.format(context)
                              : AppLocalizations.of(context)!.choseeTime,
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
                              isTimeSelected = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Boutton(
                    color: ColorsManegerLightMode.darkBlue,
                    name: AppLocalizations.of(context)!.addEvent,
                    image: "",
                    textColor: Colors.white,
                    onDo: () async {
                      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
                      await DbServes.addEvent(
                        EventModel(
                          catigory: categories[tabindex],
                          titile: EventTitle.text,
                          date: formattedDate,
                          description: EventDescription.text,
                          id: null,
                          time: timeNow,
                        ),
                      );
                      if (context.mounted) {
                        EventTitle.clear();
                        EventDescription.clear();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
