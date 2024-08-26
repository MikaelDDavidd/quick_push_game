import 'dart:math';

import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/modules/game/models/game_button_status.dart';
import 'package:game/app/modules/game/widgets/scoreboard_score.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ScoreMode {
  int level = 1;
  int round = 0;
  int score = 0;
  int totalClicks = 0;
  int buttonsToClick = 3;
  int roundTime = 6000;
  int roundsToUpLevel = 3;
  int countRoundsToUpLevel = 0;
  int minRoundTime = 1000;
  int roundTimeDown = 150;

  late GameController gameController;

  void start(GameController controller) {
    gameController = controller;
    gameController.level.value = level;
    startNewRound();
  }

  void startNewRound() {
    upLevel();
    gameController.gameTimerController.reset();
    bool animate = true;
    if (round == 0) {
      animate = false;
    }
    gameController.controlAnimationController.startAnimation(animate, () {
      if (round > 0) {
        gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime));
      }
      gameController.playing.value = true;
      round++;
      for (final (index, _) in gameController.gameButtons.indexed) {
        gameController.gameButtons[index] = GameButtonStatus().obs;
      }
      activeButtons(maxButtons: buttonsToClick);
    });
  }

  void gameButtonClicked(index, Function(int roundToUp) onRoundToUp) {
    if (!gameController.gameButtons[index].value.clicked.value) {
      onRoundToUp(countRoundsToUpLevel);
      if (totalClicks == 0) {
        gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime));
      }
      gameController.gameButtons[index].value.clicked.value = true;
    } else {
      return;
    }
    totalClicks++;
    if (!gameController.gameButtons[index].value.activated.value) {
      gameController.lostRound();
      return;
    } else {
      scoreAdd();
    }
    if ((gameController.gameButtons.where((e) => !e.value.clicked.value).length - buttonsToClick) >= 0) {
      activeButtons(maxButtons: 1);
    } else {
      int clickedButtons = gameController.gameButtons.where((e) => e.value.clicked.value).length;
      int activatedButtons = gameController.gameButtons.where((e) => e.value.activated.value).length;
      int totalButtons = gameController.gameButtons.length;
      if (clickedButtons == totalButtons && activatedButtons == totalButtons) {
        startNewRound();
      }
    }
  }

  void scoreAdd() {
    score = level + score;
    gameController.scoreAnimations.add(ScoreAnimation(scoreText: "+$level", size: gameController.scoreBoxSize, onEnd: () {}));
    gameController.score.value = score;
  }

  void upLevel() {
    countRoundsToUpLevel++;
    if (countRoundsToUpLevel == roundsToUpLevel) {
      countRoundsToUpLevel = 0;
      level++;
      gameController.level.value = level;
      gameController.onLevelUp();
      if (roundTime > minRoundTime) {
        roundTime -= roundTimeDown;
      }
    }
  }

  void activeButtons({required int maxButtons}) {
    for (var i = 0; i < maxButtons; i++) {
      bool selectingButton = true;
      do {
        var buttonIndex = Random().nextInt(gameController.gameButtons.length);
        if (!gameController.gameButtons[buttonIndex].value.activated.value) {
          gameController.gameButtons[buttonIndex].value.activated.value = true;
          selectingButton = false;
        }
      } while (selectingButton);
    }
  }
}
