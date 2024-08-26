import 'package:flutter/material.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';

class ScoreboardLevel extends StatelessWidget {
  ScoreboardLevel({super.key, required this.margin});
  double margin;
  @override
  Widget build(BuildContext context) {
    final double height = Get.size.height;
    double size = (height - margin) * 0.20;
    final GameController controller = Get.find();
    return Obx(() {
      return Positioned(
        top: 0,
        left: size * 0.5,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha((255 * 0.33).toInt()),
            borderRadius: BorderRadius.circular(size / 4),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size * 0.10),
                child: TextNeumorphic(
                  text: "level",
                  fontWidth: TextSizes.boardTextSize,
                  borderResult: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size * 0.08),
                child: SizedBox(
                  width: size,
                  child: TextNeumorphic(
                    text: controller.level.value.toString(),
                    fontWidth: TextSizes.boardTextSize,
                    borderResult: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
