import 'dart:ui';

import 'package:hive_ce/hive.dart';
import 'package:new_tab_chrome/models/response_todo_list_model.dart';


part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<ToDoListModel>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}