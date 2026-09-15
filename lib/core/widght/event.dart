import 'package:enntly/core/colors_maneger_light.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
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
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                color: ColorsManegerLightMode.backGround,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                "21 Jan",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Spacer(),
          Card(
            color: ColorsManegerLightMode.backGround,
            child: Row(
              children: [
                Text(
                  "Meeting for Updating The Development Method ",
                  style: Theme.of(context).textTheme.labelSmall,
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
