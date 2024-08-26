import 'package:flutter/material.dart';
import 'package:game/app/data/values.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:game/app/ad_helper.dart'; // Certifique-se de que o caminho está correto

class InterstitialAdWidget {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  bool isAdsRemoved = AppValues().isAdsRemovedValues;

  void loadAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              // Opcional: Coloque alguma lógica aqui se necessário quando o anúncio for fechado
            },
          );
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isAdLoaded = false;
        },
      ),
    );
  }

  void showAdIfLoaded() {
    if (isAdsRemoved == false) {
      if (_isAdLoaded && _interstitialAd != null) {
        _interstitialAd!.show();
      }
    }
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}
