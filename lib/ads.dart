import 'package:google_mobile_ads/google_mobile_ads.dart';

class ads {
  ads() {}
  InterstitialAd? _InterstitialAd;

  void showAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-8943280289420872/8337918696',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          _InterstitialAd = ad;
          print("ads ok");
          if (_InterstitialAd != null) {
            _InterstitialAd!.show();
            print("ads ok1");
          }
          ad.fullScreenContentCallback =
              FullScreenContentCallback(onAdWillDismissFullScreenContent: (ad) {
            ad.dispose();
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
          });
        }, onAdFailedToLoad: (error) {
          print(error);
          print("ads ok22");
        }));
  }
}
