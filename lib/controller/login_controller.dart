import 'package:flutter/material.dart';
import 'package:session_one/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  String? token;

  void login({
    required String username,
    required String password,
  }) {
    ApiServices.login(
      username: username,
      password: password,
    ).then(
      (value) async {
        token = value;
        // Store ke dalam local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('tokenKey', value);
      },
    );
  }
}
