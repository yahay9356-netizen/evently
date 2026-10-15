import 'package:enntly/models/catigory_model.dart';
import 'package:flutter/material.dart';

class EventModel {

  CategoryModel? catigory;
  String? id;
  String? titile;
  String? description;
  String? date;
  TimeOfDay? time;

  EventModel({
    required this.catigory,
    required this.titile,
    required this.date,
    required this.description,
    required this.id,
    required this.time,
  });

   factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      titile: json['titile'] as String?,
      description: json['description'] as String?,
      catigory: CategoryModel(name: json['catigory'] as String? ?? "", icon: null, id: 0),
      time: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? "",
      "date": date ?? "",
      "time": time != null ? "${time!.hour}:${time!.minute}" : "",
      "description": description ?? "",
      "catigory": catigory?.name ?? "",
      "titile": titile ?? "",
    };
  }
}
