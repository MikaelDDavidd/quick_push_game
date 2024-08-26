import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:get/get.dart';

import '../data/app_string.dart';
import '../modules/home/controllers/home_controller.dart';

class ContainerNeumorphic extends StatelessWidget {
  final double height;
  final double width;
  final Widget containerChild;
  final Color? color;

  ContainerNeumorphic({
    this.color,
    required this.height,
    required this.width,
    required this.containerChild,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ??
            AppColors.gameColorsTheme[controller.homeThemeIndex.value].background,
        borderRadius: BorderRadius.circular(12), // Ajuste para bordas arredondadas
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
      ),
      child: containerChild,
    );
  }
}