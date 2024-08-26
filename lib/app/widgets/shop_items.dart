import 'package:flutter/material.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/data/storage_keys.dart';
import 'package:game/app/modules/game/controllers/game_controller.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ShopItem {
  final String iconUrl;
  final int themIndex;
  final String productId;
  final int itemCoinPrice;
  String itemRealCashPrice;
  String cardText;
  bool isPending;
  bool isItemSelected;
  bool isItemPurchased;
  bool showView;
  String? optionalIconUrl;
  ProductDetails? productDetails;

  ShopItem({
    required this.showView,
    required this.iconUrl,
    required this.cardText,
    required this.productId,
    required this.themIndex,
    required this.itemCoinPrice,
    required this.itemRealCashPrice,
    this.productDetails,
    this.optionalIconUrl,
    this.isPending = false,
    this.isItemSelected = false,
    this.isItemPurchased = false,
  });

  static List<ShopItem> shopItems = [
    ShopItem(
      themIndex: 0,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: true,
      isItemPurchased: true,
      productId: "standard_color",
      itemRealCashPrice: 'R\$0,50',
      iconUrl: 'assets/standard.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 1,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      itemRealCashPrice: 'R\$0,50',
      productId: "light_green_color",
      iconUrl: 'assets/light_green.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 2,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "pink_color",
      iconUrl: 'assets/pink.png',
      itemRealCashPrice: 'R\$0,50',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 3,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      itemRealCashPrice: 'R\$0,50',
      productId: "dark_green_color",
      iconUrl: 'assets/dark_green.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 4,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "orange_color",
      iconUrl: 'assets/orange.png',
      itemRealCashPrice: 'R\$0,50',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 5,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "purple_color",
      iconUrl: 'assets/purple.png',
      itemRealCashPrice: 'R\$0,50',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 6,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      itemRealCashPrice: 'R\$0,50',
      productId: "light_blue_color",
      iconUrl: 'assets/light_blue.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 7,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "dark_blue_color",
      itemRealCashPrice: 'R\$0,50',
      iconUrl: 'assets/dark_blue.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 8,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "yellow_color",
      itemRealCashPrice: 'R\$0,50',
      iconUrl: 'assets/yellow.png',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 9,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "grey_color",
      iconUrl: 'assets/grey.png',
      itemRealCashPrice: 'R\$0,50',
      optionalIconUrl: AssetStrings.popCoinImage,
      showView: true,
    ),
    ShopItem(
      themIndex: 10,
      cardText: 'Comprar',
      itemCoinPrice: 1000,
      isItemSelected: false,
      isItemPurchased: false,
      productId: "remove_ads",
      iconUrl: 'assets/remove-ads-icon.png',
      itemRealCashPrice: 'R\$0,50',
      showView: false,
    ),
  ];

  void setSelected() {
    for (var item in ShopItem.shopItems) {
      if (item.showView == true) {
        item.setUnselected();
        break;
      }
    }
    if (isItemPurchased) {
      if (showView == true) {
        isItemSelected = true;
        cardText = 'Usando';
        final HomeController controller = Get.find();
        controller.homeThemeIndex.value = themIndex;
        GameController.onThemeChange(themIndex);
        controller.update();
        GetStorage().write(StorageKeys.themeKey, themIndex);

        int? selectedThemeIndex = GetStorage().read(StorageKeys.selectedThemeKey);
        if (selectedThemeIndex != null && selectedThemeIndex != themIndex) {
          // Remove the previous selected theme from the stored value
          GetStorage().remove(StorageKeys.selectedThemeKey);
        }

        GetStorage().write(StorageKeys.selectedThemeKey, themIndex);
      }
    }
  }

  void setUnselected() {
    if (isItemPurchased) {
      if (showView == true) {
        isItemSelected = false;
        cardText = 'Usar';
      }
    }
  }

  void purchaseItem(BuildContext context) {
    final HomeController controller = Get.find();
    int popCoinValue = controller.popCoinValue.toInt();

    if (popCoinValue >= itemCoinPrice) {
      isItemPurchased = true;
      cardText = 'Usar';

      List purchasedThemes = GetStorage().read(StorageKeys.purchasedThemesKey) ?? [];
      purchasedThemes.add(themIndex);
      GetStorage().write(StorageKeys.purchasedThemesKey, purchasedThemes);

      Navigator.of(context).pop();
      int newPopCoinValue = popCoinValue - itemCoinPrice;
      controller.popCoinValue.value = newPopCoinValue;
      GetStorage().write(StorageKeys.popCoinKey, newPopCoinValue);
      controller.updatePopCoinsValue();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Saldo insuficiente'),
            content: const Text('Você não possui moedas suficientes para comprar este item.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
            ],
          );
        },
      );
    }
  }
}
