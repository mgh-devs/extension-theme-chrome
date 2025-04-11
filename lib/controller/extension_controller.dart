import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/core/services/hive_service.dart';
import 'package:new_tab_chrome/models/response_event_day_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../models/response_todo_list_model.dart';

class ExtensionController extends GetxController {
  @override
  void onInit() {
    getEventDay(
      year: Jalali.now().year.toString(),
      month: Jalali.now().month.toString(),
      day: Jalali.now().day.toString(),
    );
    getAllTasks();
    super.onInit();
  }

  final Dio _dio = Dio();
  var isVisiblyToDoList = false.obs;
  var isHoveredButton = false.obs;
  var isHoveredToDoBox = false.obs;
  var isHoveredToDoBoxIndex = -1.obs;
  var isHoveredEditBtn = false.obs;
  var isHoveredDeleteBtn = false.obs;
  var isHoveredCustomLinkBtn = false.obs;
  var isHoveredWhereCustomLinkBtn = "".obs;
  var isExpanded = false.obs;
  var isForecast = false.obs;
  var isGetEventDayLoading = false.obs;
  Rx<Jalali> s = Jalali.now().obs;
  ResponseEventDayModel responseEventDay =
      ResponseEventDayModel(isHoliday: false, events: []);
  RxList<ToDoListModel> tasks=<ToDoListModel>[].obs;
  Rx<Color> selectedColor=Colors.red.obs;
  final  titleTextEditingController=TextEditingController();
  final  descriptionTextEditingController=TextEditingController();
  RxList<int>selectedShowDescription=<int>[].obs;






  void toggle() => isExpanded.value = !isExpanded.value;

  Future<void> getEventDay({
    required String year,
    required String month,
    required String day,
  }) async {
    isGetEventDayLoading.value = true;
    try {
      var response = await _dio.get(
        "https://api.allorigins.win/raw?url=https://holidayapi.ir/jalali/$year/$month/$day",
      );
      responseEventDay = ResponseEventDayModel.fromJson(response.data);
      for (var i in responseEventDay.events) {}
      isGetEventDayLoading.value = false;
    } on DioException catch (e) {
      isGetEventDayLoading.value = false;
    }
  }


  void getAllTasks(){
    tasks.assignAll(HiveServices.getAllTasks);
  }

}
