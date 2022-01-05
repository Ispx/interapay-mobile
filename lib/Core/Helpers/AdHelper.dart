import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Banner ad
/// Para usar o [AdHelper] você deve usar o widget [BannerAd] para visualizar o [Banner]
/// ```dart
/// late final BannerAd _bottomBannerAd;
/// bool _isBottomBannerAdLoaded = false;
/// 
/// Future<void> _createBottomBannerAd() async {
///   _bottomBannerAd = AdHelper.createBanner(onAdLoaded: (_) {
///     setState(() {
///       _isBottomBannerAdLoaded = true;
///     });
///   });
///   await _bottomBannerAd.load();
/// }
///
/// @override
/// void initState() {
///   super.initState();
///   _createBottomBannerAd();
/// }
///
/// @override
/// void dispose() {
///   super.dispose();
///   _bottomBannerAd.dispose();
/// }
/// ```

class AdHelper {
  static BannerAd createBanner({void Function(Ad)? onAdLoaded}) {
    try {
      return BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (ad, error) {
            print('AdMob Error: $error');
            ad.dispose();
          },
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4112305325667308/8517805220";
    } else if (Platform.isIOS) {
      //Implementar
      return "";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
