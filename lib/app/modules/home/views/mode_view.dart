import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/widgets/interstitial_ad.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/left_corner.dart';
import '../../../widgets/right_corner.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/game_modes.dart';
import 'package:game/app/modules/game/views/game_view.dart';
import 'package:animated_background/animated_background.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:game/app/widgets/button_neumorphic.dart';

class ModeView extends GetView<HomeController> {
  ModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is set to use MediaQUery to definy the relative percentage of the screen for the width:
    final widthSize = MediaQuery.of(context).size.width;
    // This is set to use MediaQUery to definy the relative percentage of the screen for the height:
    final heightSize = MediaQuery.of(context).size.height;
    final HomeController controller = Get.find();

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors
            .gameColorsTheme[controller.homeThemeIndex.value].background,
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
              RightCorner(
                height: heightSize * 0.8,
                width: widthSize * 0.4,
                cornerColor: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].primary,
              ),
              LeftCorner(
                height: heightSize * 0.4,
                width: widthSize * 0.2,
                cornerColor: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].primary,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: heightSize * 0.01,
                      ),
                      child: ButtonNeumorphic(
                        width: 0.5,
                        height: 0.2,
                        buttonBorderWidth: 1,
                        buttonFontWidth: TextSizes.mainBtnSize,
                        buttonTextBorder: true,
                        buttonTextIntensity: 0.6,
                        buttonText: controller.classicName.toString(),
                        onPressedCallback: () {
                          Get.to(() => const GameView(),
                              arguments: {"mode": GameModes.CLASSIC_MODE});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: heightSize * 0.01,
                      ),
                      child: ButtonNeumorphic(
                        width: 0.5,
                        height: 0.2,
                        buttonBorderWidth: 1,
                        buttonFontWidth: TextSizes.mainBtnSize,
                        buttonTextBorder: true,
                        buttonTextIntensity: 0.6,
                        buttonText: controller.scoreName.toString(),
                        onPressedCallback: () {
                          Get.to(() => const GameView(),
                              arguments: {"mode": GameModes.SCORE_MODE});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: heightSize * 0.01,
                      ),
                      child: ButtonNeumorphic(
                        width: 0.5,
                        height: 0.2,
                        buttonBorderWidth: 1,
                        buttonFontWidth: TextSizes.mainBtnSize,
                        buttonTextBorder: true,
                        buttonTextIntensity: 0.6,
                        buttonText: controller.memoryName.toString(),
                        onPressedCallback: () {
                          Get.to(() => const GameView(),
                              arguments: {"mode": GameModes.MEMORY_MODE});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
