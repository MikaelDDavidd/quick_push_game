import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game/app/modules/game/drawings/game_character_1.dart';
import 'package:game/app/modules/game/drawings/game_control_button.dart';
import 'package:game/app/modules/game/drawings/game_control_draw.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:game/app/data/app_colors.dart';
import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/modules/game/widgets/game_bar_timer.dart';
import 'package:game/app/modules/game/widgets/game_button.dart';

class GameControl extends StatelessWidget {
  GameControl({super.key, required this.controller, required this.screenHeight, required this.margin, required this.onSized});

  GameController controller;
  double screenHeight;
  double margin;
  Function(Size size) onSized;

  @override
  Widget build(BuildContext context) {
    double height = screenHeight;
    double topMargin = margin;
    double gameIconSize = (screenHeight - topMargin) * 0.22;
    double aroundSpace = gameIconSize;
    double gameControlHeight = height - topMargin - gameIconSize;
    double popItBodyHeight = gameControlHeight - ((gameControlHeight / 100) * 22); //this container height is behind the real sized container
    double borderWidth = (popItBodyHeight / 100) * 1.8; //border may have 1.7 percent of popItBodyHeight
    double borderButtonWidth = (popItBodyHeight / 100) * 1.5; //border may have 1.7 percent of popItBodyHeight
    double popItBodyHeightReal = popItBodyHeight - (borderWidth - 2);
    double buttonSize = (popItBodyHeight / 3);
    double buttonsRowTopDistance = (sqrt(pow((buttonSize / 2), 2) + pow((buttonSize), 2))) - (buttonSize / 4);
    double buttonSized = (((buttonSize - buttonsRowTopDistance) * 2) / 3) + buttonSize; //the real button size
    buttonsRowTopDistance = (sqrt(pow((buttonSized / 2), 2) + pow((buttonSized), 2))) - (buttonSized / 4);
    double popItBodyWidth = buttonSized * 4;
    double popItBodyWidthReal = popItBodyWidth;
    double gameControlWidth = (popItBodyWidth + ((popItBodyWidth / 100) * 22));
    double timeBarHeight = (gameControlHeight - popItBodyHeightReal) / 4;
    double timeBarWidth = (gameControlHeight / 3) * 1.7;
    double timeBarMargin = ((((gameControlHeight - popItBodyHeightReal) / 2) - timeBarHeight) / 2);
    double gameControlButtonDetailSize = gameControlWidth * 0.065;

    onSized(Size(gameControlWidth + aroundSpace, gameControlHeight + aroundSpace));

    return Container(
      width: gameControlWidth + aroundSpace,
      height: gameControlHeight + (aroundSpace),
      //decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: (gameControlHeight + aroundSpace) * 0.20,
            left: (gameControlWidth + aroundSpace) * 0.32,
            child: CustomPaint(
              size: Size(gameControlButtonDetailSize, gameControlButtonDetailSize),
              painter: GameControlButton(themeColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary),
            ),
          ),
          Positioned(
            top: (gameControlHeight + aroundSpace) * 0.20,
            left: ((gameControlWidth + aroundSpace) - ((gameControlWidth + aroundSpace) * 0.32)) - gameControlButtonDetailSize,
            child: CustomPaint(
              size: Size(gameControlButtonDetailSize, gameControlButtonDetailSize),
              painter: GameControlButton(themeColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary),
            ),
          ),
          Positioned(
            top: -(gameIconSize * 0.42),
            child: CustomPaint(
              size: Size((gameIconSize * 1.52), gameIconSize * 1.52),
              painter: GameCharacter1(themeColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomPaint(
              painter: GameControlDraw(
                shadowWidth: borderWidth * 2,
                backgroundColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].background,
                borderColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary,
                borderWidth: borderWidth,
              ),
              child: SizedBox(height: gameControlHeight, width: gameControlWidth),
            ),
          ),
          Visibility(
            visible: true,
            child: GameBarTimer(
              borderWidth: borderWidth,
              timerHeight: timeBarHeight,
              timerWidth: timeBarWidth,
              margin: timeBarMargin + (aroundSpace),
              gameController: controller,
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              bottom: ((gameControlHeight - popItBodyHeight) / 2),
              child: SizedBox(
                width: popItBodyWidthReal,
                height: popItBodyHeightReal,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary,
                            borderRadius: BorderRadius.circular(popItBodyHeight / 3),
                            border: Border.all(
                              width: borderWidth,
                              color: AppColors.gameColorsTheme[controller.gameThemeIndex.value].secondary,
                            ),
                          ),
                          width: popItBodyWidth,
                          height: popItBodyHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: popItBodyHeightReal,
                      width: popItBodyWidthReal,
                      child: Stack(
                        children: List.generate(controller.gameButtons.length, (index) {
                          double halfBorder = (borderWidth) * (-1);
                          double leftPosition = 0;
                          double topPosition = halfBorder;
                          if (index == 0) {
                            leftPosition = (buttonSized / 2) - borderWidth;
                          } else if (index == 1 || index == 2) {
                            leftPosition = ((buttonSized / 2) + (index * buttonSized)) - borderWidth;
                          } else if (index > 2 && index < 7) {
                            topPosition = buttonsRowTopDistance + halfBorder;
                            leftPosition = (((index - 3) * (buttonSized))) - borderWidth;
                          } else if (index >= 7 && index <= 10) {
                            topPosition = (buttonsRowTopDistance * 2) + halfBorder;
                            leftPosition = ((buttonSized / 2) + ((index - 7) * buttonSized)) - borderWidth;
                          }

                          return Positioned(
                            left: leftPosition,
                            top: topPosition,
                            child: GameButton(
                              borderButtonWidth: borderButtonWidth,
                              borderWidth: borderWidth,
                              popItBodyHeight: popItBodyHeight,
                              size: buttonSized,
                              index: index,
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
