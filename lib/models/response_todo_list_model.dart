import 'dart:ui';

import 'package:hive_ce/hive.dart';

class ToDoListModel extends HiveObject {
  final String title;
  final String description;
  final Color color;

  ToDoListModel(
      {required this.title, required this.description, required this.color});
}
