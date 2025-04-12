import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/core/services/hive_service.dart';
import 'package:new_tab_chrome/models/response_event_day_model.dart';
import 'package:new_tab_chrome/models/response_weather_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:intl/intl.dart' as inh;
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
    clock.value = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    getWeather(lat: '31.8565792', long: '54.3296297');
    super.onInit();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
  var isGetWeatherLoading = false.obs;
  Rx<Jalali> s = Jalali.now().obs;
  ResponseEventDayModel responseEventDay =
      ResponseEventDayModel(isHoliday: false, events: []);
  ResponseWeatherModel? weather;
  RxList<ToDoListModel> tasks=<ToDoListModel>[].obs;
  Rx<Color> selectedColor=Colors.red.obs;
  final  titleTextEditingController=TextEditingController();
  final  descriptionTextEditingController=TextEditingController();
  RxList<int>selectedShowDescription=<int>[].obs;
   RxString clock=''.obs;
  late Timer _timer;


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
  Future<void> getWeather({
    required String lat,
    required String long,
  }) async {
    isGetWeatherLoading.value = true;
    try {
      var response = await _dio.get(
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current_weather=true&daily=temperature_2m_max,temperature_2m_min&timezone=auto",
      );
     weather=ResponseWeatherModel.fromJson(response.data);
      isGetWeatherLoading.value = false;
    } on DioException catch (e) {
      isGetWeatherLoading.value = false;
    }
  }

  void getAllTasks(){
    tasks.assignAll(HiveServices.getAllTasks);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
      clock.value = formattedDateTime;

  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  String convertDate(String inputDate, {bool isJalali = false}) {
    DateTime date = DateTime.parse(inputDate);

    if (isJalali) {
      final jalali = Jalali.fromDateTime(date);
      final weekDay = _getPersianWeekday(jalali.weekDay);
      return '$weekDay ${_convertToPersianNumber(jalali.day)}';
    } else {
      final weekDay = inh.DateFormat('E').format(date); // مثل Sat
      final day = date.day;
      return '$weekDay $day';
    }
  }

  String _getPersianWeekday(int weekDay) {
    const days = {
      1: 'شنبه',
      2: 'یک‌شنبه',
      3: 'دوشنبه',
      4: 'سه‌شنبه',
      5: 'چهارشنبه',
      6: 'پنج‌شنبه',
      7: 'جمعه',
    };
    return days[weekDay] ?? '';
  }

  String _convertToPersianNumber(int number) {
    const english = ['0','1','2','3','4','5','6','7','8','9'];
    const persian = ['۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'];

    return number
        .toString()
        .split('')
        .map((e) => persian[english.indexOf(e)])
        .join();
  }

}
