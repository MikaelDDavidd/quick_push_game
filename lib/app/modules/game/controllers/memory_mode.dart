import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/modules/game/models/game_button_status.dart';
import 'package:game/app/modules/game/widgets/scoreboard_score.dart';
import 'package:get/get.dart';

class MemoryMode {
  int level = 1;
  int round = 0;
  int score = 0;
  int totalClicks = 0;
  int buttonsToClick = 2;
  int roundTime = 6000;
  bool canPlay = false;
  int roundsToUpLevel = 3;
  int countRoundsToUpLevel = 0;
  int levelsToUpButtonsToClick = 3;
  int countLevelsToUpButtonsToClick = 1;
  int minRoundTime = 1500;
  List<int> buttonsSequence = [];
  List<int> buttonsSequenceClicked = [];
  int roundTimeDown = 150;
  int mimButtonToClick = 3;
  int maxButtonToClick = 7;

  late GameController gameController;

  void start(GameController controller) {
    gameController = controller;
    gameController.level.value = level;
    startNewRound();
  }

  void startNewRound() {
    upLevel();
    gameController.gameTimerController.reset();
    gameController.gameTimerController.stop();
    bool animate = true;
    if (round == 0) {
      animate = false;
      countRoundsToUpLevel = 0;
    }
    gameController.controlAnimationController.startAnimation(animate, () {
      gameController.playing.value = true;
      for (final (index, _) in gameController.gameButtons.indexed) {
        gameController.gameButtons[index] = GameButtonStatus().obs;
      }
      canPlay = false;
      print("called");
      _activeButtons(
        onStart: () {
          canPlay = true;
          if (round > 0) {
            gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime));
          }
          round++;
        },
      );
    });
  }

  void _activeButtons({required Function onStart}) {
    int buttonIndex = selectButton();
    gameController.gameButtons[buttonIndex].value.activated.value = true;
    gameController.gameButtons[buttonIndex].value.toMemorize = true;
    buttonsSequence.add(buttonIndex);
    Timer(const Duration(seconds: 1), () {
      gameController.gameButtons[buttonIndex].value.activated.value = false;
      if (buttonsSequence.length < buttonsToClick) {
        _activeButtons(onStart: onStart);
      } else {
        onStart();
      }
    });
  }

  int selectButton() {
    bool selectingButton = true;
    do {
      var buttonIndex = Random().nextInt(gameController.gameButtons.length);
      if (!gameController.gameButtons[buttonIndex].value.toMemorize) {
        selectingButton = false;
        return buttonIndex;
      }
    } while (selectingButton);
    return 0;
  }

  void gameButtonClicked(index, Function(int roundToUp) onRoundToUp) {
    if (canPlay) {
      if (!gameController.gameButtons[index].value.clicked.value) {
        onRoundToUp(countRoundsToUpLevel);
        if (totalClicks == 0) {
          gameController.gameTimerController.start(newDuration: Duration(milliseconds: roundTime));
        }
        gameController.gameButtons[index].value.clicked.value = true;
        buttonsSequenceClicked.add(index);
        if (!(buttonsSequence[buttonsSequenceClicked.length - 1] == index)) {
          lost();
          return;
        }
      } else {
        return;
      }
      totalClicks++;
      if (!gameController.gameButtons[index].value.toMemorize) {
        lost();
        return;
      } else {
        scoreAdd();
      }
      int clickedButtons = gameController.gameButtons.where((e) => e.value.clicked.value).length;

      if (clickedButtons == buttonsToClick) {
        buttonsSequence = [];
        buttonsSequenceClicked = [];
        startNewRound();
      }
    }
  }

  void lost() {
    for (var i = 0; i < gameController.gameButtons.length; i++) {
      if (gameController.gameButtons[i].value.toMemorize) {
        gameController.gameButtons[i].value.activated.value = true;
      }
    }
    gameController.lostRound();
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
      if (roundTime > minRoundTime) {
        roundTime -= roundTimeDown;
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
