import 'package:shared_preferences/shared_preferences.dart';
import 'package:shynder/repositories/auth.dart';

class AuthController {
  AuthRepository authRepo = AuthRepository();

  login(String login, String password) async {
    String result = await authRepo.login(login, password);
    return result;
  }

  Future<bool> verifyIfWasLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token") != null;
  }
}
