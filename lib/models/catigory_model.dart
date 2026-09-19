import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class CategoryModel {
  CategoryModel({required this.name, required this.icon, required this.id});

  int id;
  String? name;
  IconData? icon;

  static List<CategoryModel> getSubCategory(BuildContext context) {
    return [
      CategoryModel(name: AppLocalizations.of(context)!.all, icon: Icons.all_inclusive, id: 1),
      CategoryModel(name: AppLocalizations.of(context)!.sprts, icon: Icons.sports, id: 2),
      CategoryModel(name: AppLocalizations.of(context)!.birthday, icon: Icons.celebration, id: 3),
      CategoryModel(name: AppLocalizations.of(context)!.meting, icon: Icons.meeting_room, id: 4),
      CategoryModel(name: AppLocalizations.of(context)!.bookClub, icon: Icons.book, id: 5),
    ];
  }
}
