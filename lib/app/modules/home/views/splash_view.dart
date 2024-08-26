import 'package:animated_background/animated_background.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/data/app_string.dart';
import 'package:game/app/modules/home/dialogs/shop.dart';
import 'package:game/app/modules/home/views/home_view.dart';
import 'package:game/app/widgets/button_neumorphic.dart';
import 'package:game/app/widgets/left_corner.dart';
import 'package:game/app/widgets/right_corner.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../dialogs/settings.dart';
import '../../../widgets/interstitial_ad.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends GetView<HomeController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is set to use MediaQUery to definy the relative percentage of the screen for the width:
    final widthSize = MediaQuery.of(context).size.width;

    // This is set to use MediaQUery to definy the relative percentage of the screen for the height:
    final heightSize = MediaQuery.of(context).size.height;

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
                cornerColor: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].primary,
                height: heightSize * 0.4,
                width: widthSize * 0.2,
              ),
              Center(
                child: AnimatedSplashScreen(
                  duration: 1100,
                  backgroundColor: Colors.transparent,
                  splash: TextNeumorphic(
                    intensityResult: 1,
                    borderResult: true,
                    fontWidth: TextSizes.tittleSize,
                    text: AppStrings.gameNameString,
                  ),
                  nextScreen: HomeView(),
                  nextRoute: '/home',
                  pageTransitionType: PageTransitionType.fade,
                  splashTransition: SplashTransition.scaleTransition,
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
