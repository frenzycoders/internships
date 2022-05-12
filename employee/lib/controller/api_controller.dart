import 'dart:convert';

import 'package:employee/controller/index.dart';
import 'package:employee/models/user_models.dart';
import 'package:employee/utils/index.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  late StorageController _storageController;
  late WidgetController _uiWidgetController;
  ApiController() {
    print('Binding Api controller...');
    _storageController = Get.find<StorageController>();
    _uiWidgetController = Get.find<WidgetController>();
  }

  getUserProfile({required bool notes}) async {
    try {
      String url = Config.serverAdress + '/auth/user-profile?notes=no';
      if (notes == true) {
        url = Config.serverAdress + '/auth/user-profile?notes=yes';
      }
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {"x-user": _storageController.token.value},
      );
      if (response.statusCode == 404) {
        throw HttpExceptionWithStatus(
          message: 'Token Expired Login again.',
          status: 'TKN_EXPIRE',
          apiStatus: true,
        );
      } else if (response.statusCode == 200) {
        UserProfile profile =
            UserProfile.fromJSON(json.decode(response.body)['user']);
        _storageController.changeProfileValue(profile: profile);
      } else {
        throw HttpException(json.decode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  loginUser({
    required String username,
    required String password,
  }) async {
    try {
      http.Response response = await http
          .post(Uri.parse(Config.serverAdress + '/auth/login-user'), body: {
        "username": username,
        "password": password,
      });
      if (response.statusCode != 200) {
        throw HttpException(json.decode(response.body)['message']);
      } else {
        UserProfile userProfile = UserProfile.fromJSON(
          json.decode(response.body)['user'],
        );

        final String token = json.decode(response.body)['token'];
        await _storageController.storeToken(token: token);
        await _storageController.changeProfileValue(profile: userProfile);
      }
    } catch (e) {
      rethrow;
    }
  }
}
