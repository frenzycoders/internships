import 'package:employee/controller/api_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  late ApiController _apiController;
  ProfileController() {
    _apiController = Get.find<ApiController>();
  }

  reloadProfile() async {
    isLoading.value = true;
    await _apiController.getUserProfile(notes: false);
    isLoading.value = false;
  }
}
