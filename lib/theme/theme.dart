import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: 'Kanit',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Color.fromRGBO(253, 246, 247, 1),
      secondary: Colors.grey.shade300,
    ));

ThemeData darkMode = ThemeData(
    fontFamily: 'Kanit',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        tertiary: Colors.white,
        onTertiary: Colors.blue.shade800));
