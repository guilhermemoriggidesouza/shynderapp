import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> showAlert(BuildContext context,
    {String title = "", String content = ""}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
      );
    },
  );
}
