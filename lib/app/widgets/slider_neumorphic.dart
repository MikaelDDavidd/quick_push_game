import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';

import '../data/app_string.dart';

class SliderNeumorphic extends StatelessWidget {
  final String sliderText;
  final bool sliderVar;
  final ValueChanged<bool> onChangedSlider;

  SliderNeumorphic({
    required this.sliderText,
    required this.sliderVar,
    required this.onChangedSlider,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: TextNeumorphic(
            fontWidth: TextSizes.configBtnsSize,
            borderResult: false,
            intensityResult: 0.7,
            text: sliderText,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: heightSize * 0.01,
          ),
          height: heightSize * 0.09,
          width: widthSize * 0.15,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Switch(
            value: sliderVar,
            onChanged: onChangedSlider,
            activeColor: AppColors
                .gameColorsTheme[controller.homeThemeIndex.value].secondary,
            activeTrackColor: AppColors
                .gameColorsTheme[controller.homeThemeIndex.value].background,
            inactiveThumbColor: Colors.grey.shade400,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}