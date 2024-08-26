import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/modules/home/controllers/home_controller.dart';
import 'package:game/app/widgets/button_neumorphic.dart';
import 'package:get/get.dart';

class PurchaseStatsDialog extends StatefulWidget {
  final String dialogText;

  const PurchaseStatsDialog({Key? key, required this.dialogText}) : super(key: key);

  @override
  State<PurchaseStatsDialog> createState() => _PurchaseStatsDialogState(dialogText: dialogText);
}

class _PurchaseStatsDialogState extends State<PurchaseStatsDialog> {
  final String dialogText;
  final HomeController controller = Get.find();
  bool isDimissible = false;

  _PurchaseStatsDialogState({required this.dialogText});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: AppColors
          .gameColorsTheme[controller.homeThemeIndex.value].primary,
      child: Container(
        width: widthSize * 0.4,
        height: heightSize * 0.4,
        alignment: Alignment.center,
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
            ButtonNeumorphic(
              width: 0.20,
              height: 0.08,
              onPressedCallback: () {
                Get.back();
              },
              buttonTextBorder: false,
              buttonBorderState: true,
              buttonText: dialogText,
              buttonBorder: widthSize * 0.0015,
              buttonFontWidth: TextSizes.configInnerSize,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}