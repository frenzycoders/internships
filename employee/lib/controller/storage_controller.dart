import 'package:employee/models/user_models.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageController extends GetxController {
  RxString token = ''.obs;
  RxString username = ''.obs;
  RxString password = ''.obs;
  Rx<UserProfile> profile =
      UserProfile(name: 'Guest', username: 'guest123', email: 'guest@gmail.com', status: false, id: 'guest').obs;

  Future<bool> storeToken({required String token}) async {
    this.token.value = token;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('appToken', token);
    return true;
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final t = preferences.getString('appToken');
    if (t == null) {
      token.value = '';
    } else {
      token.value = t;
    }
  }

  storeUsernamePassword(
      {required String username, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('username', username);
    preferences.setString('password', password);
  }

  getStoredPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final u = preferences.getString('username');
    final p = preferences.getString('password');
    if (u != null) {
      username.value = u;
    }

    if (p != null) {
      password.value = p;
    }
  }

  changeProfileValue({required UserProfile profile}) {
    this.profile.value = profile;
  }
}
