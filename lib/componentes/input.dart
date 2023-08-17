import 'package:flutter/material.dart';

input(TextEditingController control, String name, onChange,
    {isTextArea = false, minLines = 1}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: TextField(
      scrollPadding: EdgeInsets.only(bottom: 60),
      controller: control,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: name,
      ),
      keyboardType: isTextArea ? TextInputType.multiline : TextInputType.text,
      minLines: minLines,
      maxLines: 6,
    ),
  );
}
