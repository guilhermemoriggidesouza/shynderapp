import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shynder/infra/api.dart';
import 'package:shynder/repositories/auth.dart';

class AuthController {
  AuthRepository authRepo = AuthRepository();

  login(String login, String password, BuildContext context) async {
    String result = await authRepo.login(login, password);
    await Api().start(context);
    return result;
  }

  Future<void> verifyIfWasLogged(Function cb) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      cb();
    }
  }

  Future<void> logout(Function cb, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await Api().start(context);
    cb();
  }
}
