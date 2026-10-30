import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/core/widght/elvatet_boutton.dart';
import 'package:enntly/core/widght/tab_bar.dart';
import 'package:enntly/core/widght/text_button.dart';
import 'package:enntly/core/widght/text_filed2.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/models/catigory_model.dart';
import 'package:enntly/models/event_model.dart';
import 'package:enntly/serves/db_serves.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel event;

  const EditEventScreen({super.key, required this.event});

  static const String name = "EditEventScreen";

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();

  int tabindex = 0;
  late final TabController controller;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event.titile);
    descriptionController =
        TextEditingController(text: widget.event.description);
    controller = TabController(length: 5, vsync: this);
    selectedTime = widget.event.time;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getSubCategory(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Event"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
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
                  tabs: categories.asMap().entries.map(
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
                        l10n?.title ?? "Title",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                TextFiled2(
                  text: l10n?.eventTitle ?? "Event title",
                  width: 343,
                  hight: 43,
                  controller: titleController,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        l10n?.description ?? "Description",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextFiled2(
                  controller: descriptionController,
                  text: l10n?.eventDescription ?? "Event description",
                  width: 343,
                  hight: 192,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_calendar,
                      color: ColorsManegerLightMode.darkBlue,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n?.eventDate ?? "Event Date",
                      style: const TextStyle(
                        color: ColorsManegerLightMode.mainText,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Textbutton(
                      nameOFText: selectedDate == null
                          ? (widget.event.date ?? "Choose date")
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                      onDo: () async {
                        DateTime? newdate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (newdate == null) return;
                        setState(() {
                          selectedDate = newdate;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: ColorsManegerLightMode.darkBlue,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      l10n?.eventTime ?? "Event Time",
                      style: const TextStyle(
                        color: ColorsManegerLightMode.mainText,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Spacer(),
                    Textbutton(
                      nameOFText: selectedTime == null
                          ? "Choose time"
                          : selectedTime!.format(context),
                      onDo: () async {
                        final newTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime ?? TimeOfDay.now(),
                        );
                        if (newTime == null) return;
                        setState(() {
                          selectedTime = newTime;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Boutton(
                    color: ColorsManegerLightMode.darkBlue,
                    name: "Update Event",
                    image: "",
                    textColor: Colors.white,
                    onDo: () async {
                      widget.event.titile = titleController.text;
                      widget.event.description = descriptionController.text;
                      if (selectedDate != null) {
                        widget.event.date =
                            DateFormat('dd/MM/yyyy').format(selectedDate!);
                      }
                      if (selectedTime != null) {
                        widget.event.time = selectedTime;
                      }
                      if (categories.isNotEmpty && tabindex < categories.length) {
                        widget.event.catigory = categories[tabindex];
                      }

                      await DbServes.updateEvent(widget.event);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Event updated successfully!"),
                          ),
                        );
                        Navigator.pop(context, widget.event);
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
