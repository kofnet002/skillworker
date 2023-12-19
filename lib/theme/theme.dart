import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: 'Kanit',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade100,
        primary: Color.fromARGB(255, 69, 0, 150),
        secondary: Color.fromARGB(255, 252, 247, 247),
        tertiary: Colors.grey.shade400));

ThemeData darkMode = ThemeData(
    fontFamily: 'Kanit',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        tertiary: Colors.white,
        onTertiary: Colors.blue.shade800));

// rgba(69,0,150,255)
// rgb(252,247,247)