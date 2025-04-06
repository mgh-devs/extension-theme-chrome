

import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ExtensionController extends GetxController{
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

  Rx<Jalali> s=Jalali.now().obs;

  void toggle() => isExpanded.value = !isExpanded.value;
}