import 'package:employee/controller/index.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(WidgetController());
    Get.put(StorageController());
    Get.put(ApiController());
  }
}
