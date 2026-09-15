import 'package:enntly/tabs/favorit_screen.dart';
import 'package:enntly/tabs/home_screen.dart';
import 'package:enntly/tabs/profile_screen.dart';
import 'package:flutter/material.dart';

class Mainlayout extends StatefulWidget {
  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  int index = 0;

  List<Widget> tabs = [Homescreen(), FavoritScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(index == 0 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(index == 1 ? Icons.favorite : Icons.favorite_border),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(index == 2 ? Icons.person : Icons.person_2_outlined),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
