import 'package:flutter/material.dart';

input(
  TextEditingController controller,
  IconData icon,
  String labelText,
  bool pass, {
  TextInputType type = TextInputType.text,
  isTextArea = false,
  minLines = 1,
  onTap,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(17.0)),
    ),
    child: TextField(
      keyboardType: isTextArea && !pass ? TextInputType.multiline : type,
      minLines: minLines,
      maxLines: pass ? 1 : 6,
      controller: controller,
      obscureText: pass,
      onTap: onTap,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white24,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
