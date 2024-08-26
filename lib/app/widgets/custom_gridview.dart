import 'package:fluttertoast/fluttertoast.dart';
import 'package:game/app/data/app_string.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/widgets/card_shop.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/widgets/shop_items.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import '../modules/home/controllers/home_controller.dart';
import 'package:game/app/widgets/custo_elevated_button.dart';
import 'package:game/app/modules/home/controllers/purchase_controller.dart';
import 'package:animated_toast_list/animated_toast_list.dart';

class CustomThemeGridView extends StatelessWidget {
  final double heightSize;
  final double widthSize;

  CustomThemeGridView({
    required this.heightSize,
    required this.widthSize,
  });

  @override
  Widget build(BuildContext context) {
    final double allDialogSize = 0.4;
    final HomeController controller = Get.find();
    final PurchaseController purchaseController = Get.find();
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          alignment: Alignment.center,
          height: heightSize * 0.7,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: List.generate(
                    (ShopItem.shopItems.length / 3).ceil(),
                    (rowIndex) {
                      List<Widget> rowItems = [];

                      for (int i = 0; i < 3; i++) {
                        int itemIndex = rowIndex * 3 + i;
                        if (itemIndex < ShopItem.shopItems.length) {
                          rowItems.add(
                            GestureDetector(
                              onTap: () {
                                if (!ShopItem.shopItems[itemIndex].isItemPurchased) {
                                  // Se o item não foi comprado, mostre o popup de compra
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].primary,
                                        content: SizedBox(
                                          height: heightSize * allDialogSize,
                                          width: widthSize * allDialogSize,
                                          child: Image.asset(
                                            ShopItem.shopItems[itemIndex].iconUrl,
                                            width: widthSize * allDialogSize * 0.4,
                                            height: heightSize * allDialogSize * 0.4,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Row(
                                            children: [
                                              const Spacer(),
                                              CustomElevatedButton(
                                                  onPressedCallback: () {
                                                    ShopItem.shopItems[itemIndex].purchaseItem(context);
                                                  },
                                                  text: ShopItem.shopItems[itemIndex].itemCoinPrice.toString(),
                                                  showImage: true),
                                              const Spacer(),
                                              CustomElevatedButton(
                                                  onPressedCallback: () {
                                                    print(ShopItem.shopItems[itemIndex].productId);
                                                    purchaseController.purchaseShopItem(
                                                        ShopItem.shopItems[itemIndex].productId,
                                                        (PurchaseStatus status) => {
                                                              if (status == PurchaseStatus.purchased)
                                                                {
                                                                  Fluttertoast.showToast(
                                                                    msg: AppStrings.itemBoughtString,
                                                                    toastLength: Toast.LENGTH_LONG,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    backgroundColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].darkPrimary,
                                                                    textColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].text,
                                                                  )
                                                                }
                                                              else if (status == PurchaseStatus.pending)
                                                                {
                                                                  Fluttertoast.showToast(
                                                                    msg: AppStrings.itemBoughtPendingString,
                                                                    toastLength: Toast.LENGTH_LONG,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    backgroundColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].darkPrimary,
                                                                    textColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].text,
                                                                  )
                                                                }
                                                              else if (status == PurchaseStatus.error)
                                                                {
                                                                  Fluttertoast.showToast(
                                                                    msg: AppStrings.itemBoughtErrorString,
                                                                    toastLength: Toast.LENGTH_LONG,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    backgroundColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].darkPrimary,
                                                                    textColor: AppColors.gameColorsTheme[controller.homeThemeIndex.value].text,
                                                                  )
                                                                }
                                                            });
                                                  },
                                                  text: ShopItem.shopItems[itemIndex].itemRealCashPrice,
                                                  showImage: false),
                                              const Spacer(),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // Desmarcar todos os outros itens
                                  for (var item in ShopItem.shopItems) {
                                    if (item.isItemPurchased && item != ShopItem.shopItems[itemIndex]) {
                                      ShopItem.shopItems[itemIndex].setSelected();
                                    }
                                  }
                                  ShopItem.shopItems[itemIndex].setSelected();
                                  controller.update(); // Atualizar a UI
                                }
                              },
                              child: ShopItem.shopItems[itemIndex].showView == true
                                  ? ShopCard(
                                      height: constraints.maxHeight * 0.3,
                                      width: widthSize * 0.15,
                                      cardTextSize: 0.2,
                                      iconUrl: ShopItem.shopItems[itemIndex].iconUrl,
                                      cardText: ShopItem.shopItems[itemIndex].cardText,
                                    )
                                  : Container(),
                            ),
                          );

                          if (i < 2) {
                            rowItems.add(SizedBox(height: constraints.maxHeight * 0.05)); // Espaçamento vertical calculado
                          }
                        }
                      }

                      return Column(children: rowItems);
                    },
                  )
                      .expand(
                        (columnWidget) => [columnWidget, const SizedBox(width: 10)], // Espaçamento horizontal
                      )
                      .toList()
                    ..removeLast(), // Remove o último SizedBox extra adicionado
                );
              },
            ),
          ),
        );
      },
    );
  }
}