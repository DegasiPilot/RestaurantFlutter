import 'package:flutter/material.dart';

ThemeData themes = ThemeData(
    scaffoldBackgroundColor: const Color(0xff404040),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll(Colors.blueGrey),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff404040),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      backgroundColor: Color(0xff404040),
    ),
    cardTheme: CardTheme(
        color: Colors.blueGrey,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
