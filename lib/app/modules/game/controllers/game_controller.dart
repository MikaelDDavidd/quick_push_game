import 'dart:async';
import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:game/app/data/game_modes.dart';
import 'package:game/app/data/linear_time.dart';
import 'package:game/app/data/storage_keys.dart';
import 'package:game/app/data/values.dart';
import 'package:game/app/modules/game/controllers/classic_mode.dart';
import 'package:game/app/modules/game/controllers/memory_mode.dart';
import 'package:game/app/modules/game/models/game_button_status.dart';
import 'package:game/app/modules/game/controllers/score_mode.dart';
import 'package:game/app/modules/game/widgets/vibration_animation.dart';
import 'package:game/app/widgets/interstitial_ad.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameController extends GetxController with GetTickerProviderStateMixin {
//
  static List<Function(bool music, bool song)> settingsListener = [];
  static void onSettingsChanged(bool music, bool song) {
    for (final (index, _) in settingsListener.indexed) {
      settingsListener[index](music, song);
    }
  }

  static List<Function(int theme)> themeListener = [];
  static void onThemeChange(int theme) {
    for (final (index, _) in themeListener.indexed) {
      themeListener[index](theme);
    }
  }

  final InterstitialAdWidget _adManager = InterstitialAdWidget();
  RxInt gameThemeIndex = AppValues().themIndexValue.obs;
  int animationTime = 65;
  int gameMode = 0;

  Rx<bool> playing = false.obs;
  late LinearTimerController gameTimerController;
  late VibrationAnimationController controlAnimationController;
  Rx<bool> gameOver = false.obs;
  Rx<bool> restartGame = false.obs;
  Rx<bool> goBackHome = false.obs;
  double scoreBoxSize = 0;
  RxList<Widget> scoreAnimations = <Widget>[].obs;

  Rx<int> level = 0.obs;
  Rx<int> score = 0.obs;
  int scoreRecord = 0;

  Rx<ClassicMode> classicMode = ClassicMode().obs;
  Rx<ScoreMode> scoreMode = ScoreMode().obs;
  Rx<MemoryMode> memoryMode = MemoryMode().obs;

  bool canPlayMusic = GetStorage().read(StorageKeys.musicKey) ?? true;
  bool canPlaySong = GetStorage().read(StorageKeys.songKey) ?? true;

  List<Rx<GameButtonStatus>> gameButtons = [
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
    GameButtonStatus().obs,
  ].obs;

  @override
  void onInit() {
    _adManager.loadAd();
    settingsListener.add((music, song) {
      canPlayMusic = music;
      canPlaySong = song;
      if (FlameAudio.bgm.isPlaying) {
        FlameAudio.bgm.stop();
      }
    });
    themeListener.add((theme) {
      gameThemeIndex.value = theme;
    });
    controlAnimationController = VibrationAnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    gameTimerController = LinearTimerController(this);

    super.onInit();
  }

  @override
  void onReady() {
    var data = Get.arguments;
    gameMode = data["mode"];
    startGame();
    FlameAudio.bgm.initialize();
    if (canPlayMusic) {
      FlameAudio.bgm.play('bg_music_2.mp3');
    }
    super.onReady();
  }

  @override
  void onClose() {
    controlAnimationController.dispose();
    gameTimerController.dispose();
    FlameAudio.bgm.stop();
    super.onClose();
  }

  void pause() {
    playing.value = false;
    gameTimerController.stop();
  }

  void resume() {
    playing.value = true;
    gameTimerController.resume();
  }

  void startGame() {
    level.value = 0;
    score.value = 0;
    classicMode.value = ClassicMode();
    scoreMode.value = ScoreMode();
    memoryMode.value = MemoryMode();
    playing.value = false;
    gameOver.value = false;
    switch (gameMode) {
      case GameModes.CLASSIC_MODE:
        classicMode.value.start(this);
        break;
      case GameModes.SCORE_MODE:
        scoreMode.value.start(this);
        break;
      case GameModes.MEMORY_MODE:
        memoryMode.value.start(this);
        break;
      default:
    }
  }

  void gameButtonClicked(index) {
    switch (gameMode) {
      case GameModes.CLASSIC_MODE:
        classicMode.value.gameButtonClicked(index, (round) {
          playClickSound(round);
        });
        break;
      case GameModes.SCORE_MODE:
        scoreMode.value.gameButtonClicked(index, (round) {
          playClickSound(round);
        });
        break;
      case GameModes.MEMORY_MODE:
        memoryMode.value.gameButtonClicked(index, (round) {
          playClickSound(round);
        });
        break;
      default:
    }
  }

  void playClickSound(round) {
    round++;
    if (canPlaySong) {
      if (round > 0 && round <= 3) {
        FlameAudio.play('click_$round.mp3');
      } else {
        FlameAudio.play('click_1.mp3');
      }
    }
  }

  void scoreAdd() {
    switch (gameMode) {
      case GameModes.CLASSIC_MODE:
        classicMode.value.scoreAdd();
        break;
      default:
    }
  }

  void onGameTimeEnd() {
    if (playing.value) {
      lostRound();
      _adManager.showAdIfLoaded();
      _adManager.loadAd();
    }
  }

  void onLevelUp() {
    FlameAudio.play('level.mp3');
  }

  void lostRound() {
    FlameAudio.play('lost.mp3');
    switch (gameMode) {
      case GameModes.CLASSIC_MODE:
        scoreRecord = GetStorage().read(StorageKeys.classicModeScoreRecordKey) ?? 0;
        if (scoreRecord < score.value) {
          GetStorage().write(StorageKeys.classicModeScoreRecordKey, score.value);
          scoreRecord = score.value;
        }
        break;
      case GameModes.SCORE_MODE:
        scoreRecord = GetStorage().read(StorageKeys.scoreModeScoreRecordKey) ?? 0;
        if (scoreRecord < score.value) {
          GetStorage().write(StorageKeys.scoreModeScoreRecordKey, score.value);
          scoreRecord = score.value;
        }
        break;
      case GameModes.MEMORY_MODE:
        scoreRecord = GetStorage().read(StorageKeys.memoryModeScoreRecordKey) ?? 0;
        if (scoreRecord < score.value) {
          GetStorage().write(StorageKeys.memoryModeScoreRecordKey, score.value);
          scoreRecord = score.value;
        }
        break;
      default:
    }
    gameTimerController.stop();
    playing.value = false;
    setActivatesButtonLed(true);
    int time = 170;
    Timer(Duration(milliseconds: time), () {
      setActivatesButtonLed(false);
      Timer(Duration(milliseconds: time), () {
        setActivatesButtonLed(true);
        Timer(Duration(milliseconds: time), () {
          setActivatesButtonLed(false);
          Timer(Duration(milliseconds: time), () {
            setActivatesButtonLed(true);
            gameOver.value = true;
          });
        });
      });
    });
    _adManager.showAdIfLoaded();
    _adManager.loadAd();
  }

  void setActivatesButtonLed(active) {
    for (final (index, item) in gameButtons.indexed) {
      if (item.value.activated.value) {
        gameButtons[index].value.onLed.value = active;
      }
    }
  }
}
