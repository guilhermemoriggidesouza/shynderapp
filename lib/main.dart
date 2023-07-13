import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:location/location.dart';
import 'package:shynder/pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      theme: theme,
    );
  }
}
