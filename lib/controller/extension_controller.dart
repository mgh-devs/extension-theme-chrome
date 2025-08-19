import 'dart:async';
import 'dart:ui';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/core/services/hive_service.dart';
import 'package:new_tab_chrome/models/response_event_day_model.dart';
import 'package:new_tab_chrome/models/response_location_model.dart';
import 'package:new_tab_chrome/models/response_weather_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:intl/intl.dart' as inh;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../models/response_todo_list_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class ExtensionController extends GetxController {
  @override
  void onInit() {
    searchTextController.addListener(_updateTextAlign);
    getEventDay(
      year: Jalali.now().year.toString(),
      month: Jalali.now().month.toString(),
      day: Jalali.now().day.toString(),
    );
    getAllTasks();
    clock.value = _formatDateTime(DateTime.now());
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    getWeather(lat: '31.8565792', long: '54.3296297');
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    searchTextController.removeListener(_updateTextAlign);
    searchTextController.dispose();
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
  var isSearchLoading = false.obs;
  Rx<Jalali> s = Jalali.now().obs;
  ResponseEventDayModel responseEventDay =
      ResponseEventDayModel(isHoliday: false, events: []);
  ResponseWeatherModel? weather;
  RxList<ToDoListModel> tasks = <ToDoListModel>[].obs;
  Rx<Color> selectedColor = Colors.red.obs;
  RxBool isSearchIsNotEmpty = false.obs;
  final titleTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  final searchTextController = TextEditingController();
  RxList<int> selectedShowDescription = <int>[].obs;
  RxString clock = ''.obs;
  late Timer _timer;
  Rx<ResponseLocationModel> locationModel =
      ResponseLocationModel(results: []).obs;
  var textAlign = TextAlign.end.obs;
  var isLoading = false.obs;






  final stt.SpeechToText _speech = stt.SpeechToText();

  var isListening = false.obs;


  Future<void> listenSmart() async {
    if (isListening.value) {
      await _speech.stop();
      isListening.value = false;
      return;
    }

    bool available = await _speech.initialize();


    isListening.value = true;

    String? enResult;
    String? faResult;

    /// اول فارسی
    await _speech.listen(
      localeId: "fa-IR",
      onResult: (val) {
        faResult = val.recognizedWords;
      },
    );

    await Future.delayed(Duration(seconds: 4));
    await _speech.stop();

    /// کمی صبر کنیم تا stop کامل بشه
    await Future.delayed(Duration(milliseconds: 500));

    /// بعد انگلیسی
    await _speech.listen(
      localeId: "en-US",
      onResult: (val) {
        enResult = val.recognizedWords;
      },
    );

    await Future.delayed(Duration(seconds: 3));
    await _speech.stop();

    // انتخاب بهترین نتیجه
    if (faResult != null && faResult!.trim().isNotEmpty) {
      searchTextController.text = faResult!;
      search(searchTextController.text);
    } else if (enResult != null && enResult!.trim().isNotEmpty) {
      searchTextController.text = enResult!;
      search(searchTextController.text);
    } else {

    }

    isListening.value = false;
  }





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
      weather = ResponseWeatherModel.fromJson(response.data);
      isGetWeatherLoading.value = false;
    } on DioException catch (e) {
      isGetWeatherLoading.value = false;
    }
  }

  Future<void> searchCity({
    required String nameCity,
  }) async {
    isSearchLoading.value = true;
    try {
      var response = await _dio.get(
        "https://api.opencagedata.com/geocode/v1/json?q=$nameCity&key=083dcfeff4e84adc9b17892210903a8e",
      );
      if (response.data['total_results'] > 0) {
        locationModel.value = ResponseLocationModel.fromJson(response.data);
      } else {}

      isSearchLoading.value = false;
    } on DioException catch (e) {
      isSearchLoading.value = false;
    }
  }

  void getAllTasks() {
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
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    return number
        .toString()
        .split('')
        .map((e) => persian[english.indexOf(e)])
        .join();
  }
  void _updateTextAlign() {
    if (searchTextController.text.isEmpty) {
      textAlign.value = TextAlign.start;
    } else {
      final firstChar = searchTextController.text.characters.first;
      final isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(firstChar);
      textAlign.value = isArabic ? TextAlign.right : TextAlign.left;
    }
  }

  void search(String value) {
    final searchUrl =
        'https://www.google.com/search?q=${Uri.encodeComponent(value)}';
    html.window.open(searchUrl, '_self');
  }




}


