import 'package:enntly/models/catigory_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  CategoryModel? catigory;
  String? titile;
  String? description;
  DateTime? date;
  TimeOfDay? time;
  EventModel({
    required this.catigory,
    required this.titile,
    required this.date,
    required this.description,
    required this.time,
  });
}
