import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class TextNeumorphic extends StatelessWidget {
  final String text;
  final double fontWidth;
  final bool borderResult;
  final double? borderWidth;
  final double? intensityResult;
  final String? neumorphicFontFamily;
  final Color? textColor;
  final Color? borderColor;

  TextNeumorphic({
    this.borderWidth,
    this.intensityResult,
    this.neumorphicFontFamily,
    this.textColor,
    this.borderColor,
    required this.text,
    required this.fontWidth,
    required this.borderResult,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Stack(
      children: [
        // Texto de borda
        if (borderResult)
          Text(
            text,
            style: TextStyle(
              fontFamily: neumorphicFontFamily ?? 'Cute-Dolphin-Regular',
              fontSize: MediaQuery.of(context).size.width * fontWidth,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = borderWidth ?? 2
                ..color = borderColor ??
                    AppColors.gameColorsTheme[controller.homeThemeIndex.value]
                        .tertiary,
            ),
          ),
        // Texto principal
        Text(
          text,
          style: TextStyle(
            fontFamily: neumorphicFontFamily ?? 'Cute-Dolphin-Regular',
            fontSize: MediaQuery.of(context).size.width * fontWidth,
            color: textColor ??
                AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].text,
            shadows: [
              if (intensityResult != null && intensityResult! > 0)
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(intensityResult!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}