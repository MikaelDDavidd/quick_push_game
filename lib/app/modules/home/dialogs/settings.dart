import 'package:flutter/material.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_sizes.dart';
import 'package:game/app/data/app_string.dart';
import 'package:game/app/data/storage_keys.dart';
import 'package:game/app/widgets/button_neumorphic.dart';
import 'package:game/app/widgets/slider_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/home_controller.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  String _selectedItem =
      GetStorage().read(StorageKeys.languageKey) ?? 'Português';
  final List<String> _dropdownItems = [
    'Português',
    'English',
  ];
  bool _song = GetStorage().read(StorageKeys.songKey) ?? true;
  bool _music = GetStorage().read(StorageKeys.musicKey) ?? true;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    final HomeController controller = Get.find();

    return Obx(
      () => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: AppColors
            .gameColorsTheme[controller.homeThemeIndex.value].primary,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: widthSize * 0.9, // 90% of screen
          height: heightSize * 0.9, // 90% of screen
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
              Text(
                AppStrings.settingsString,
                style: TextStyle(
                  fontSize: widthSize * TextSizes.configTittleSize,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  SliderNeumorphic(
                    sliderVar: _music,
                    sliderText: AppStrings.musicString,
                    onChangedSlider: (value) {
                      GetStorage().write(StorageKeys.musicKey, value);
                      setState(() {
                        _music = value;
                      });
                    },
                  ),
                  const Spacer(),
                  SliderNeumorphic(
                    sliderVar: _song,
                    sliderText: AppStrings.songString,
                    onChangedSlider: (value) {
                      GetStorage().write(StorageKeys.songKey, value);
                      setState(() {
                        _song = value;
                      });
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      AppStrings.languageString,
                      style: TextStyle(
                        fontSize: widthSize * TextSizes.configBtnsSize,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: heightSize * 0.01),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors
                              .gameColorsTheme[controller.homeThemeIndex.value]
                              .tertiary,
                          width: widthSize * 0.0015,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors
                            .gameColorsTheme[controller.homeThemeIndex.value]
                            .primary,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          dropdownColor: AppColors
                              .gameColorsTheme[controller.homeThemeIndex.value]
                              .primary,
                          onChanged: (String? newValue) {
                            GetStorage()
                                .write(StorageKeys.languageKey, newValue);
                            controller.updatePlayName();
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          items: _dropdownItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Container(
                                width: widthSize * 0.15,
                                height: heightSize * 0.05,
                                alignment: Alignment.center,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize:
                                        widthSize * TextSizes.configInnerSize,
                                    fontFamily: 'Cute-Dolphin-Regular',
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 2,
                                        color:
                                            Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonNeumorphic(
                  width: 0.10,
                  height: 0.1,
                  onPressedCallback: () {
                    Get.back();
                  },
                  buttonTextBorder: false,
                  buttonBorderState: true,
                  buttonText: AppStrings.backString,
                  buttonBorder: widthSize * 0.0015,
                  buttonFontWidth: TextSizes.configInnerSize,
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