import 'dart:io';

import 'app_constrant.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return androidGoogleBanner;
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw UnsupportedError("unsupported Platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return androidGoogleInterstitial;
    } else if (Platform.isIOS) {
      return "";
    } else {
      throw UnsupportedError("unsupported Platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/8673189370';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/7552160883';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
