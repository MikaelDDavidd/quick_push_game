import 'package:flutter/material.dart';

class AppColors {
  static List<GameTheme> gameColorsTheme = [
    GameTheme(
      //theme 1
      background: const Color(0XFFb3c6f3),
      primary: const Color(0XFF6281c0),
      darkPrimary: const Color.fromARGB(255, 55, 78, 124),
      secondary: const Color(0xFF83a0da),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0xFFF1EBC9),
    ),
    GameTheme(
      //theme 2
      background: const Color(0XFFf1ebc9),
      primary: const Color.fromARGB(255, 98, 192, 156),
      darkPrimary: const Color.fromARGB(255, 56, 141, 108),
      secondary: const Color.fromARGB(255, 170, 239, 222),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      //theme 3
      background: const Color.fromARGB(255, 243, 179, 192),
      primary: const Color.fromARGB(255, 192, 99, 146),
      darkPrimary: const Color.fromARGB(255, 173, 82, 128),
      secondary: const Color.fromARGB(255, 255, 135, 159),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      background: const Color(0xFFB2DFDB),
      primary: const Color(0xFF00897B),
      darkPrimary: const Color(0xFF00695C),
      secondary: const Color(0xFF4DB6AC),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      //theme 5
      background: const Color(0xFFFFF3E0),
      primary: const Color(0xFFFF9800),
      darkPrimary: const Color(0xFFE65100),
      secondary: const Color(0xFFFFB74D),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      background: const Color(0xFFFCE4EC),
      primary: const Color(0xFFBA68C8),
      darkPrimary: const Color(0xFF9C27B0),
      secondary: const Color(0xFFD1C4E9),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      // theme 7
      background: const Color(0xFFE6F7FF),
      primary: const Color(0xFF00A8E8),
      darkPrimary: const Color(0xFF006B9E),
      secondary: const Color(0xFFB3E5FC),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0XFFf1ebc9),
    ),
    GameTheme(
      //theme 8
      background: const Color(0xFF0D47A1),
      primary: const Color(0xFF1565C0),
      darkPrimary: const Color(0xFF003C8F),
      secondary: const Color(0xFF90CAF9),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0xFFF1EBC9),
    ),
    GameTheme(
      //theme 9
      background: const Color(0xFFFFF9C4),
      primary: const Color(0xFFFFD54F),
      darkPrimary: const Color(0xFFFFC107),
      secondary: const Color(0xFFFFF176),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0xFFF1EBC9),
    ),
    GameTheme(
      //theme 10
      background: const Color(0xFFE0E0E0),
      primary: const Color(0xFF9E9E9E),
      darkPrimary: const Color(0xFF424242),
      secondary: const Color(0xFFFFFFFF),
      tertiary: const Color(0xFFA9A489),
      text: const Color(0xFFF1EBC9),
    ),
  ];

  static Color gameRedLed = const Color.fromARGB(92, 255, 109, 109);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color shadowBlack = const Color.fromARGB(68, 0, 0, 0);
  static Color green = const Color.fromARGB(255, 12, 230, 121);
  static Color yellowLight = const Color(0XFFf1ebc9);
}

class GameTheme {
  Color background;
  Color primary;
  Color darkPrimary;
  Color secondary;
  Color tertiary;
  Color text;
  GameTheme({required this.background, required this.primary, required this.darkPrimary, required this.secondary, required this.tertiary, required this.text});
}
