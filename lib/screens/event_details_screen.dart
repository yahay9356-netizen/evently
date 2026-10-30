import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/l10n/app_localizations.dart';
import 'package:enntly/models/event_model.dart';
import 'package:enntly/screens/edit_event_screen.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String name = "EventDetails";
  final EventModel event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n?.eventTitle ?? "Event Details",
          style: TextStyle(
            color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEventScreen(event: event),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/image 8.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              event.titile ?? "",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
              ),
            ),
            const SizedBox(height: 16),
            if (event.catigory?.name != null && event.catigory!.name!.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark
                      ? ColorsManegerDark.surfaceColor
                      : ColorsManegerLightMode.darkBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? ColorsManegerDark.storke
                        : ColorsManegerLightMode.darkBlue,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      event.catigory?.icon ?? Icons.event,
                      color: isDark
                          ? Colors.white
                          : ColorsManegerLightMode.darkBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      event.catigory?.name ?? "",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? Colors.white
                            : ColorsManegerLightMode.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),

            // Date Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark
                    ? ColorsManegerDark.surfaceColor
                    : ColorsManegerLightMode.input,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? ColorsManegerDark.storke
                      : ColorsManegerLightMode.storke,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManegerLightMode.darkBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n?.eventDate ?? "Event Date",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? Colors.white60
                              : ColorsManegerLightMode.secText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        event.date ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? Colors.white
                              : ColorsManegerLightMode.mainText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Time Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark
                    ? ColorsManegerDark.surfaceColor
                    : ColorsManegerLightMode.input,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? ColorsManegerDark.storke
                      : ColorsManegerLightMode.storke,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManegerLightMode.darkBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.access_time_filled_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n?.eventTime ?? "Event Time",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? Colors.white60
                              : ColorsManegerLightMode.secText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        event.time != null
                            ? "${event.time!.hourOfPeriod.toString().padLeft(2, '0')}:${event.time!.minute.toString().padLeft(2, '0')} ${event.time!.period == DayPeriod.am ? 'AM' : 'PM'}"
                            : "Not specified",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? Colors.white
                              : ColorsManegerLightMode.mainText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              l10n?.description ?? "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              event.description ?? "",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: isDark ? Colors.white70 : ColorsManegerLightMode.mainText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
