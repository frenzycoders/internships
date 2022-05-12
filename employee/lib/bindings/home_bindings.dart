import 'package:employee/controller/home_controller.dart';
import 'package:employee/controller/maps_controller.dart';
import 'package:employee/controller/profile_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(MapController());
  }
}
