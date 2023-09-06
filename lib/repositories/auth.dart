import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shynder/infra/api.dart';

class AuthRepository {
  Api api = Api();

  Future<String> login(String login, String password) async {
    try {
      dynamic result = await api.dio
          .post("/auth/login", data: {"login": login, "password": password});
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", result.data["token"]);
      return result.data["token"];
    } catch (err) {
      DioException error = err as DioException;
      if (error.response?.statusCode == 400) {
        throw Exception(error.response!.data["message"]);
      }
      throw Exception("Erro ao tentar logar, tente novamente mais tarde");
    }
  }

  sendEmail(String email) async {
    try {
      await api.dio
          .get("/auth/recover/code", queryParameters: {"email": email});
    } catch (err) {
      DioException error = err as DioException;
      if (error.response?.statusCode == 400) {
        throw Exception(error.response!.data["message"]);
      }
      throw Exception("Erro ao tentar enviar Email");
    }
  }

  changePass(String password, String code, String email) async {
    try {
      await api.dio.put(
        "/auth/password",
        data: {"email": email, "password": password, "code": code},
      );
    } catch (err) {
      DioException error = err as DioException;
      if (error.response?.statusCode == 400) {
        throw Exception(error.response!.data["message"]);
      }
      throw Exception("Erro ao tentar recuperar a senha");
    }
  }
}
