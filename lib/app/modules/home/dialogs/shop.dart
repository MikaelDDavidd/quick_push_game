import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:game/app/widgets/top_shop_element.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_gridview.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;

    return Obx(
      () => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: AppColors
            .gameColorsTheme[controller.homeThemeIndex.value].primary,
        child: Container(
          width: widthSize * 0.9,
          height: heightSize * 0.9,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors
                  .gameColorsTheme[controller.homeThemeIndex.value].tertiary,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: TopShopElement(
                    currencyIcon: AssetStrings.popCoinImage,
                    currencyValue: controller.popCoinValue.toInt(),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomThemeGridView(
                        heightSize: heightSize,
                        widthSize: widthSize,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}