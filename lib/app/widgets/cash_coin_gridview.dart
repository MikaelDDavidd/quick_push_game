/*import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/widgets/card_shop.dart';
import 'package:get/get.dart';
import '../modules/home/controllers/home_controller.dart';

class CashCoinGridView extends StatelessWidget {
  final double heightSize;
  final double widthSize;

  CashCoinGridView({
    required this.heightSize,
    required this.widthSize,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      width: widthSize * 0.4,
      height: heightSize * 0.50,
      child: GetBuilder<HomeController>(
        builder: (_) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.25, // Proporção dos itens
                ),
                itemCount: shopItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Lógica ao tocar no item
                    },
                    child: ShopCard(
                      height: constraints.maxHeight * 0.1,
                      width: constraints.maxHeight * 0.1,
                      cardTextSize: 0.2, // Pode ajustar se necessário
                      iconUrl: shopItems[index].iconUrl,
                      cardText: shopItems[index].cardText,
                      optionalIconUrl: shopItems[index].optionalIconUrl,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Classe ShopItem e lista de shopItems permanecem iguais

class ShopItem {
  final String iconUrl;
  String cardText;
  String? optionalIconUrl;

  ShopItem({
    this.optionalIconUrl,
    required this.iconUrl,
    required this.cardText,
  });

  void purchaseItem() {
    cardText = 'Usar'; // Alterar o texto
    optionalIconUrl = null; // Definir optionalIconUrl como null
  }
}

// Exemplo de dados para os itens da loja
List<ShopItem> shopItems = [
  ShopItem(
    cardText: '5',
    iconUrl: AssetStrings.popCoinImage,
    optionalIconUrl: AssetStrings.popCashIMage,
  ),
  ShopItem(
    cardText: '25',
    iconUrl: AssetStrings.popCoinImage,
    optionalIconUrl: AssetStrings.popCashIMage,
  ),
  ShopItem(
    cardText: '100',
    iconUrl: AssetStrings.popCoinImage,
    optionalIconUrl: AssetStrings.popCashIMage,
  ),
  ShopItem(
    cardText: 'RS5,00',
    iconUrl: AssetStrings.popCashIMage,
  ),
  ShopItem(
    cardText: 'RS50,00',
    iconUrl: AssetStrings.popCashIMage,
  ),
  ShopItem(
    cardText: 'RS100,00',
    iconUrl: AssetStrings.popCashIMage,
  ),
];*/
