import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:game/app/modules/game/widgets/action_button.dart';
import 'package:game/app/modules/game/widgets/game_over.dart';
import 'package:game/app/modules/game/widgets/go_back_home.dart';
import 'package:game/app/modules/game/widgets/restart_game.dart';
import 'package:game/app/modules/game/widgets/scoreboard_level.dart';
import 'package:game/app/modules/game/widgets/scoreboard_score.dart';
import 'package:game/app/modules/game/widgets/vibration_animation.dart';
import 'package:game/app/modules/home/dialogs/settings.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';

import 'package:game/app/data/app_colors.dart';
import 'package:game/app/modules/game/widgets/game_control.dart';

import '../controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameController());
    double actionButtonSize = 42;
    double actionButtonSpace = 12;

    return Scaffold(
      backgroundColor: AppColors.gameColorsTheme[controller.gameThemeIndex.value].primary,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: Colors.white,
            minOpacity: 0.05,
            maxOpacity: 0.25,
            particleCount: 15,
            spawnMinSpeed: 50,
            spawnMaxSpeed: 100,
          ),
        ),
        vsync: controller,
        child: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  VibrationAnimationPage(
                    controller: controller.controlAnimationController,
                    child: GameControl(
                      onSized: (size) {},
                      margin: 20,
                      controller: controller,
                      screenHeight: Get.height,
                    ),
                  ),
                  ScoreboardLevel(margin: 20),
                  ScoreboardScore(margin: 20),
                ],
              ),
            ),
            GameOver(),
            RestartGame(),
            GoBackHome(),
            ActionButton(
              icon: Icons.volume_up_outlined,
              size: actionButtonSize,
              left: actionButtonSpace,
              top: actionButtonSpace,
              onTap: () {
                Get.dialog(
                  const Dialog(
                    child: Settings(),
                  ),
                );
              },
            ),
            ActionButton(
              icon: Icons.home_outlined,
              size: actionButtonSize,
              right: actionButtonSpace,
              top: actionButtonSpace,
              onTap: () {
                controller.pause();
                controller.goBackHome.value = true;
              },
            ),
            ActionButton(
              icon: Icons.refresh,
              size: actionButtonSize,
              right: (actionButtonSpace * 2) + actionButtonSize,
              top: actionButtonSpace,
              onTap: () {
                controller.pause();
                controller.restartGame.value = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
