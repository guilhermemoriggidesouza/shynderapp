import 'package:shared_preferences/shared_preferences.dart';
import 'package:shynder/infra/api.dart';

class AuthRepository {
  Api api = Api();

  Future<String> login(String login, String password) async {
    try {
      dynamic result = await api.dio
          .post("/auth/login", data: {"login": login, "password": password});
      if (result.data["token"] != null) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", result.data["token"]);
        return result.data["token"];
      } else {
        throw Exception("Login ou Senha inválidos");
      }
    } catch (err) {
      throw Exception("Erro ao tentar logar, tente novamente mais tarde");
    }
  }
}
