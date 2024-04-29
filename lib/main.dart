import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize().then((InitializationStatus status) {
  //   print('Initialization done: ${status.adapterStatuses}');
  //   MobileAds.instance.updateRequestConfiguration(
  //     RequestConfiguration(
  //         tagForChildDirectedTreatment:
  //             TagForChildDirectedTreatment.unspecified,
  //         testDeviceIds: <String>["CAC88306564BDB57C1B5E5A1C7093FF2"]),
  //   );
  // });
  // MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}
