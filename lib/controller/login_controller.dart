import 'package:flutter/material.dart';
import 'package:session_one/services/api_services.dart';

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
      (value) {
        token = value;
        // Store ke dalam local storage
      },
    );
  }
}
