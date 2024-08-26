import 'dart:math';

import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/modules/game/models/game_button_status.dart';
import 'package:game/app/modules/game/widgets/scoreboard_score.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ClassicMode {
  int level = 1;
  Rx<int> round = 0.obs;
  int totalClicks = 0;
  int roundsToUpLevel = 3;
  int countRoundsToUpLevel = 0;
  int mimButtonToClick = 3;
  int maxButtonToClick = 7;
  int buttonsToClick = 3;
  int levelsToUpButtonsToClick = 3;
  int countLevelsToUpButtonsToClick = 1;
  int minRoundTime = 800;
  Rx<int> roundTime = 5000.obs;
  int roundTimeDown = 150;
  int score = 0;

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
    if (round.value == 0) {
      animate = false;
    }
    gameController.controlAnimationController.startAnimation(animate, () {
      if (round.value > 0) {
        gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime.value));
      }
      gameController.playing.value = true;
      round.value++;
      for (final (index, _) in gameController.gameButtons.indexed) {
        gameController.gameButtons[index] = GameButtonStatus().obs;
      }
      bool selectingButtons = true;
      do {
        var buttonIndex = Random().nextInt(gameController.gameButtons.length);
        if (!gameController.gameButtons[buttonIndex].value.activated.value) {
          gameController.gameButtons[buttonIndex].value.activated.value = true;
        }
        var result = gameController.gameButtons.where((element) => element.value.activated.value);
        if (result.length == buttonsToClick) {
          selectingButtons = false;
        }
      } while (selectingButtons);
    });
  }

  void gameButtonClicked(int index, Function(int roundToUp) onRoundToUp) {
    if (!gameController.gameButtons[index].value.clicked.value) {
      onRoundToUp(countRoundsToUpLevel);
      if (totalClicks == 0) {
        gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime.value));
      }
      gameController.gameButtons[index].value.clicked.value = true;
      scoreAdd();
    } else {
      return;
    }
    totalClicks++;
    bool success = true;
    var result = gameController.gameButtons.where((element) => element.value.clicked.value);
    for (var button in result) {
      if (!button.value.activated.value) {
        success = false;
      }
    }
    if (!success) {
      gameController.lostRound();
    } else if (success && result.length == buttonsToClick) {
      startNewRound();
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
      countLevelsToUpButtonsToClick++;
      countRoundsToUpLevel = 0;
      level++;
      gameController.level.value = level;
      gameController.onLevelUp();
      if (roundTime.value > minRoundTime) {
        roundTime.value -= roundTimeDown;
      }
      if (countLevelsToUpButtonsToClick == levelsToUpButtonsToClick) {
        countLevelsToUpButtonsToClick = 0;
        if (buttonsToClick < maxButtonToClick && roundTime > 2450) {
          buttonsToClick++;
        } else if (buttonsToClick >= mimButtonToClick) {
          buttonsToClick--;
        }
      }
    }
  }
}
