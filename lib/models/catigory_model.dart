import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({required this.name, required this.icon, required this.id});

  int id;
  String? name;
  IconData? icon;
  static List<CategoryModel>? subCategory = [
    CategoryModel(name: "All", icon: Icons.all_inclusive, id: 1),
    CategoryModel(name: "Sports", icon: Icons.sports, id: 2),
    CategoryModel(name: "Birthday", icon: Icons.celebration, id: 3),
    CategoryModel(name: "Meetings", icon: Icons.meeting_room, id: 4),
    CategoryModel(name: "BookClub", icon: Icons.book , id: 5),
  ];
}
