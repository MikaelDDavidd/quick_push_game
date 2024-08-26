import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class TopShopElement extends StatelessWidget {
  final int? currencyValue;
  final String currencyIcon;
  final String addButton = AssetStrings.buyCurrencyImage;

  TopShopElement({
    required this.currencyIcon,
    required this.currencyValue,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.16,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors
              .gameColorsTheme[controller.homeThemeIndex.value].darkPrimary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(2, 2),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: Offset(-2, -2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065 * 0.65,
              width: MediaQuery.of(context).size.width * 0.16 * 0.4,
              child: Image.asset(
                currencyIcon,
              ),
            ),
            Text(
              '$currencyValue',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.022,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}