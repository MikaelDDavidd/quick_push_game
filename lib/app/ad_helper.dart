import 'dart:io';

class AdHelper {

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9973248356722033/2985807674";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9973248356722033/2985807674";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}