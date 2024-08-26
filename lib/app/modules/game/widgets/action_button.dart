import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ActionButton extends StatelessWidget {
  double size;
  double top;
  double? left;
  double? right;
  IconData icon;
  Function onTap;

  ActionButton({
    Key? key,
    required this.size,
    required this.top,
    required this.icon,
    this.left,
    this.right,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find();
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: GetBuilder<GameController>(builder: (context) {
        return GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              color: AppColors
                  .gameColorsTheme[controller.gameThemeIndex.value].secondary,
            ),
            child: Center(
              child: Icon(
                icon,
                color: HSLColor.fromColor(AppColors
                        .gameColorsTheme[controller.gameThemeIndex.value]
                        .primary)
                    .withLightness(0.43)
                    .toColor(),
                size: (size / 3) * 2,
              ),
            ),
          ),
        );
      }),
    );
  }
}
