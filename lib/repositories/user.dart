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
}
