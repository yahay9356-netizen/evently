import 'package:enntly/core/Colors/colors_maneger_dark.dart';
import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/models/event_model.dart';
import 'package:enntly/screens/event_details_screen.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final EventModel event;

  const Event({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(event: event),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 193,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/image 8.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: isDark ? ColorsManegerDark.surfaceColor : ColorsManegerLightMode.input,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    event.date.toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
                        ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Card(
              color: isDark ? ColorsManegerDark.surfaceColor : ColorsManegerLightMode.backGround,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.titile ?? "",
                        style: TextStyle(
                          color: isDark ? Colors.white : ColorsManegerLightMode.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.favorite_border,
                      color: isDark ? Colors.white : ColorsManegerLightMode.darkBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
