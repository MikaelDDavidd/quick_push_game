import 'package:get/get.dart';

class GameButtonStatus {
  Rx<bool> activated = false.obs;
  Rx<bool> clicked = false.obs;
  Rx<bool> onLed = false.obs;
  bool toMemorize = false;
  //GameButtonStatus({this.activated = false.obs, this.clicked = false.obs});
}
