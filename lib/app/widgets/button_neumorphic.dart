import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ButtonNeumorphic extends StatelessWidget {
  final String? buttonText;
  final double? buttonFontWidth;
  final double? buttonBorder;
  final bool? buttonBorderState;
  final bool? buttonTextBorder;
  final double? buttonBorderWidth;
  final IconData? icon;
  final double? buttonTextIntensity;
  final double height;
  final double width;
  final VoidCallback? onPressedCallback;

  ButtonNeumorphic({
    this.buttonText,
    this.icon,
    this.onPressedCallback,
    this.buttonFontWidth,
    this.buttonBorder,
    this.buttonBorderState,
    this.buttonTextBorder,
    this.buttonBorderWidth,
    this.buttonTextIntensity,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return GestureDetector(
      onTap: onPressedCallback,
      child: Container(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.gameColorsTheme[controller.homeThemeIndex.value].primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(2, 2),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: Offset(-2, -2),
              blurRadius: 6,
            ),
          ],
          border: buttonBorderState == true
              ? Border.all(
                  color: AppColors
                      .gameColorsTheme[controller.homeThemeIndex.value]
                      .tertiary,
                  width: buttonBorder ?? 0.0,
                )
              : null,
        ),
        child: icon != null
            ? Icon(
                icon,
                size: MediaQuery.of(context).size.width * 0.05,
                color: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value]
                    .text,
              )
            : Text(
                buttonText ?? '',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * buttonFontWidth!,
                  color: AppColors
                      .gameColorsTheme[controller.homeThemeIndex.value]
                      .text,
                  shadows: buttonTextIntensity != null && buttonTextIntensity! > 0
                      ? [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(buttonTextIntensity!),
                          ),
                        ]
                      : null,
                ),
              ),
      ),
    );
  }
}