import 'package:get/get.dart';
import 'package:new_tab_chrome/controller/extension_controller.dart';


class InitialBindings implements Bindings {
  InitialBindings();

  @override
  void dependencies() {
    Get.lazyPut(() => ExtensionController());
  }
}
