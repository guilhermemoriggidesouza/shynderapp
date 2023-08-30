import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final Api _singleton = Api._internal();
  factory Api() {
    return _singleton;
  }
  Api._internal();

  late Dio dio;
  BaseOptions options = BaseOptions(
    baseUrl: dotenv.env["API_URL"]!,
    connectTimeout: Duration(seconds: 3),
    receiveTimeout: Duration(seconds: 5),
    responseType: ResponseType.json,
  );

  start() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    options.headers = {"x-access-token": sharedPreferences.getString("token")};
    dio = Dio(options);
  }
}
