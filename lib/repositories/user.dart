import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shynder/infra/api.dart';
import 'package:shynder/models/user.dart';

class UserRepository {
  Api api = Api();

  Future<User> getUser() async {
    try {
      dynamic result = await api.dio.get("/user");
      return User.fromJson(result.data);
    } catch (err) {
      throw Exception(
          "Erro ao tentar obter perfil, tente novamente mais tarde");
    }
  }

  Future<String> createUser(User user) async {
    try {
      dynamic result = await api.dio.post("/user", data: user.toJson());
      return result.data["_id"];
    } catch (err) {
      DioException error = err as DioException;
      if (error.response?.statusCode == 400) {
        throw Exception(error.response!.data["message"]);
      }
      throw Exception(
          "Erro ao tentar cadastrar Usuário. Tente novamente mais tarde");
    }
  }
}
