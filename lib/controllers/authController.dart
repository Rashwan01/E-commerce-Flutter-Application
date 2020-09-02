import 'package:get/get.dart';
import 'package:shop_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  UserModel userModel = UserModel();
  bool isLoading = false;

  void loading({bool state}) {
    isLoading = state;
    update();
  }

  Future<void> login({String email, String password}) async {
    loading(state: true);
    final url = 'http://ecommerce.erada-soft.com/api/auth/login';
    try {
      final response = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        userModel = UserModel.fromJson(responseData);
        final prefs = await SharedPreferences.getInstance();
        final userData = {
          'token': userModel.accessToken,
          'name': userModel.user,
        };
        prefs.setString('userData', json.encode(userData));
        loading(state: false);
        update();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final Map<String, dynamic> loadedData =
        jsonDecode(prefs.getString('userData'));
    userModel = UserModel(
      accessToken: loadedData['token'],
      user: loadedData['name'],
    );
    return true;
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    update();
  }
}
