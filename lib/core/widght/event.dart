import 'package:enntly/core/Colors/colors_maneger_light.dart';
import 'package:enntly/models/event_model.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final EventModel event;

  const Event({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 193,
      decoration: BoxDecoration(
        image: DecorationImage(
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
            child: 
            Card(
              child: Text(
                event.date.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Spacer(),
          Card(
            color: ColorsManegerLightMode.backGround,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${event.titile}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_border,
                  color: ColorsManegerLightMode.darkBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
