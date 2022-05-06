import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)));
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme:
        const AppBarTheme(elevation: 0, backgroundColor: Color(0xff15161a)),
    scaffoldBackgroundColor: const Color(0xff15161a));
