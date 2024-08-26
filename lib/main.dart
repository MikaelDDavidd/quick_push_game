import 'dart:async';
import 'package:game/app/modules/home/controllers/purchase_controller.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app/modules/home/controllers/home_controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialização do Google Mobile Ads SDK
  await MobileAds.instance.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  Get.put(HomeController()); // Register the homeController as a singleton
  Get.put(PurchaseController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quick Push",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
