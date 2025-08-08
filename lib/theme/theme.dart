import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade200,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey.shade600),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 15.0,
    ),
  ),
);
// dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 24, 24, 24),
    primary: const Color.fromARGB(255, 34, 34, 34),
    secondary: const Color.fromARGB(255, 49, 49, 49),
    inversePrimary: Colors.grey.shade300,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFF2C2C2C), // Background color of the text field
    filled: true,
    hintStyle: const TextStyle(color: Colors.white54),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none, // Removes the border line
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 15.0,
    ),
  ),
);
