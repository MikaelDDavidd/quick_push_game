import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/linear_time.dart';
import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class GameBarTimer extends StatefulWidget {
  GameBarTimer({
    super.key,
    required this.gameController,
    required this.timerWidth,
    required this.timerHeight,
    required this.borderWidth,
    required this.margin,
  });

  GameController gameController;
  double timerWidth;
  double timerHeight;
  double borderWidth;
  double margin;

  @override
  State<GameBarTimer> createState() => _GameBarTimerState();
}

class _GameBarTimerState extends State<GameBarTimer> with TickerProviderStateMixin {
  @override
  void initState() {
    //widget.gameController.gameTimerController = LinearTimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.margin,
      child: Stack(
        children: [
          Container(
            width: widget.timerWidth,
            height: widget.timerHeight,
            decoration: BoxDecoration(
              color: AppColors.gameColorsTheme[widget.gameController.gameThemeIndex.value].primary,
              border: Border.all(
                width: widget.borderWidth,
                color: AppColors.gameColorsTheme[widget.gameController.gameThemeIndex.value].primary,
              ),
              borderRadius: BorderRadius.circular(widget.timerHeight / 2),
            ),
          ),
          Positioned(
            left: widget.borderWidth,
            top: widget.borderWidth,
            child: SizedBox(
              width: widget.timerWidth - (widget.borderWidth * 2),
              height: widget.timerHeight - (widget.borderWidth * 2),
              child: Obx(() {
                print(widget.gameController.classicMode.value.roundTime.value);
                return ClipRRect(
                  borderRadius: BorderRadius.circular(widget.timerHeight / 2),
                  child: LinearTimer(
                    forward: false,
                    //duration: Duration(milliseconds: widget.gameController.classicMode.value.roundTime.value),
                    controller: widget.gameController.gameTimerController,
                    onTimerEnd: () {
                      widget.gameController.onGameTimeEnd();
                    },
                    color: AppColors.green,
                    backgroundColor: AppColors.gameColorsTheme[widget.gameController.gameThemeIndex.value].primary,
                    borderRadius: widget.timerHeight / 2,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
