import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:location/location.dart';
import 'package:shynder/infra/api.dart';
import 'package:shynder/pages/home/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shynder/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String themeStr = await rootBundle.loadString('assets/theme.json');
  var themeJson = json.decode(themeStr);
  var theme = ThemeDecoder.decodeThemeData(themeJson, validate: false);
  runApp(MyApp(theme));
}

class MyApp extends StatelessWidget {
  MyApp(this.theme);
  ThemeData? theme;
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;

  getPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getPermission();
    Api().start(context);
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
      theme: theme,
    );
  }
}
