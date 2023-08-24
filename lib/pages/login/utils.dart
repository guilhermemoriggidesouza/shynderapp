import 'package:flutter/material.dart';

class EmailCheck {
  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}

String greetingMessage(){
  var timeNow = DateTime.now().hour;
  if (timeNow <= 12) {
    return 'Bom dia';
  } else if ((timeNow > 12) && (timeNow <= 18)) {
    return 'Boa tarde';
  } else  {
    return 'Boa noite';
  }
}

class Textos{
  static const TextStyle titulos = TextStyle(
    color: Colors.white,
    letterSpacing: 0.5,
    fontSize: 18,
    inherit: true,
  );

  static const TextStyle subtitulos = TextStyle(
    color: Colors.white,
    letterSpacing: 0.5,
    fontSize: 14,
    inherit: true,
  );

}