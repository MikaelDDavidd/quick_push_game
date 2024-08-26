import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/data/app_string.dart';
import 'package:game/app/modules/home/dialogs/shop.dart';
import 'package:game/app/widgets/ads_remove.dart';
import 'package:game/app/widgets/button_neumorphic.dart';
import 'package:game/app/widgets/left_corner.dart';
import 'package:game/app/widgets/right_corner.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../dialogs/settings.dart';
import '../../../widgets/interstitial_ad.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is set to use MediaQUery to definy the relative percentage of the screen for the width:
    final widthSize = MediaQuery.of(context).size.width;

    // This is set to use MediaQUery to definy the relative percentage of the screen for the height:
    final heightSize = MediaQuery.of(context).size.height;

    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false, 
        backgroundColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].background,
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
                cornerColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].primary,
              ),
              LeftCorner(
                cornerColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].primary,
                height: heightSize * 0.4,
                width: widthSize * 0.2,
              ),
              AdsRemoveIcon(
                elementColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].background,
                height: widthSize * 0.05,
                width: heightSize * 0.1,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 50,
                      ),
                      child: TextNeumorphic(
                        fontWidth: TextSizes.tittleSize,
                        borderResult: true,
                        intensityResult: 1,
                        text: AppStrings.gameNameString,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => ButtonNeumorphic(
                            width: 0.405,
                            height: 0.20,
                            buttonFontWidth: TextSizes.mainBtnSize,
                            buttonText: "${controller.playName}",
                            onPressedCallback: () {
                              Get.toNamed(Routes.MODE);
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonNeumorphic(
                            width: 0.20,
                            height: 0.20,
                            icon: Icons.shopping_cart_outlined,
                            onPressedCallback: () {
                              Get.dialog(
                                const Dialog(
                                  child: Shop(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: widthSize * 0.005,
                          ),
                          ButtonNeumorphic(
                            width: 0.20,
                            height: 0.20,
                            icon: Icons.settings,
                            onPressedCallback: () {
                              Get.dialog(
                                const Dialog(
                                  child: Settings(),
                                ),
                              );
                            },
                          )
                        ],
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
