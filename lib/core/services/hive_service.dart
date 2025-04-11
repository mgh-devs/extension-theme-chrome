import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:new_tab_chrome/models/response_todo_list_model.dart';

import 'hive_adapters.dart';

class HiveServices {
  static late Box _myBox;

  static const String _myBoxKey = "myBoxKey";

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ToDoListModelAdapter());
    _myBox = await Hive.openBox<ToDoListModel>(_myBoxKey);
  }

  static void addTask(ToDoListModel task) {
    _myBox.add(task);
  }

  static List<ToDoListModel> get getAllTasks {
    return _myBox.values.cast<ToDoListModel>().toList();
  }

  static void clear() {
    _myBox.clear();
  }
}
