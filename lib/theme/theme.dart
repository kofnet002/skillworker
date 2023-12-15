import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade300,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Color.fromRGBO(0, 0, 0, 1),
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ));
