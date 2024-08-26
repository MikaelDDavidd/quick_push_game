import 'package:flutter/material.dart';

class AppColors {
  static List<GameTheme> gameColorsTheme = [
    GameTheme(
      background: Color(0XFFf1ebc9),
      primary: Color(0XFF6281c0),
      secondary: Color(0XFFaac0ef),
    ),
    GameTheme(
      background: Color(0XFFf1ebc9),
      primary: Color.fromARGB(255, 104, 98, 192),
      secondary: Color.fromARGB(255, 170, 171, 239),
    ),
    GameTheme(
      background: Color(0XFFf1ebc9),
      primary: Color.fromARGB(255, 98, 192, 156),
      secondary: Color.fromARGB(255, 170, 239, 222),
    )
  ];

  static Color gameRedLed = const Color.fromARGB(92, 255, 109, 109);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color shadowBlack = Color.fromARGB(68, 0, 0, 0);
  static Color green = Color.fromARGB(255, 12, 230, 121);
  static Color yellowLight = Color(0XFFf1ebc9);
}

class GameTheme {
  Color background;
  Color primary;
  Color secondary;
  GameTheme({
    required this.background,
    required this.primary,
    required this.secondary,
  });
}
