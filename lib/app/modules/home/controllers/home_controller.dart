import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:game/app/data/storage_keys.dart';
import 'package:game/app/data/values.dart';
import 'package:game/app/modules/home/dialogs/no_connectition.dart';
import 'package:game/app/routes/app_pages.dart';
import 'package:game/app/widgets/interstitial_ad.dart';
import 'package:game/app/widgets/shop_items.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/app_string.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late Timer connectivityTimer;
  bool isShowingDialog = false;
  bool removeAdsValue = GetStorage().read(StorageKeys.removeAdsPurchasedKey)?? false;
  String currentRoute = Get.routing.current;

  //TODO: Implement HomeController
  final InterstitialAdWidget _adManager = InterstitialAdWidget();
  RxInt homeThemeIndex = AppValues().themIndexValue.obs;
  RxInt popCoinValue = AppValues().popCoinValues.obs;
  RxString playName = AppStrings.playString.obs;

  RxString modesName = AppStrings.modesString.obs;
  RxString classicName = AppStrings.classicModeString.obs;
  RxString scoreName = AppStrings.scoreModeString.obs;
  RxString memoryName = AppStrings.memoryModeString.obs;

  void updatePopCoinsValue() {
    popCoinValue = popCoinValue;
  }

//>>> THIS SECTION VERIFY NETWORK CONNECTION AND SHOWS A DIALOG >>>>>

  void splashScreenDuration() {
    Future.delayed(Duration(milliseconds: 2400), () {
      checkConnectivity();
      checkConnectivityTimer();
    });
  }

  void showNoConnectionDialog() {
    Get.dialog(
      const  Dialog(
        child:  Connection(),
      ),
    );
  }

  void checkConnectivity() async {
    bool connectivityStats = await ConnectivityWrapper.instance.isConnected;
    if (connectivityStats != true) {
      if (removeAdsValue == false) {
        if (!isShowingDialog) {
          Get.back();
          Get.back();
          isShowingDialog = true;
         showNoConnectionDialog();
        }
      } else if (connectivityStats == true && isShowingDialog == true) {
        Get.back();
        isShowingDialog = false;
      } else {
        isShowingDialog = false;
      }
    }
  }

  void checkConnectivityTimer() async {
    connectivityTimer = Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      checkConnectivity();
    });
  }

//>>> THIS SECTION VERIFY NETWORK CONNECTION AND SHOWS A DIALOG >>>>>

  void loadPurchasedThemes() {
    List<dynamic>? purchasedThemes = GetStorage().read(StorageKeys.purchasedThemesKey);

    if (purchasedThemes != null) {
      List<int> purchasedThemesInt = [];
      for (var theme in purchasedThemes) {
        if (theme is int) {
          purchasedThemesInt.add(theme);
        }
      }

      for (var item in ShopItem.shopItems) {
        if (purchasedThemesInt.contains(item.themIndex)) {
          item.isItemPurchased = true;
          item.cardText = 'Usar';
        }
      }
    }
  }

  void updateSelectedTheme() {
    int? selectedThemeIndex = GetStorage().read(StorageKeys.selectedThemeKey);

    for (var item in ShopItem.shopItems) {
      if (item.themIndex == selectedThemeIndex) {
        item.isItemSelected = true;
        item.cardText = 'Usando';
      }
    }
  }

  void updateModesName() {
    modesName.value = AppStrings.modesString;
    classicName.value = AppStrings.classicModeString;
    scoreName.value = AppStrings.scoreModeString;
    memoryName.value = AppStrings.memoryModeString;
  }

  void updatePlayName() {
    playName.value = AppStrings.playString;
  }

  final count = 0.obs;

  // Implementing TickerProvider required methods
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }

  @override
  void onInit() {
    super.onInit();
    loadPurchasedThemes();
    updateSelectedTheme();
    _adManager.loadAd();
  }

  void showAdIfLoaded() {
    _adManager.showAdIfLoaded(); // Método para exibir o anúncio
  }

  @override
  void onReady() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    splashScreenDuration();
    super.onReady();
  }

  @override
  void onClose() {
    _adManager.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
