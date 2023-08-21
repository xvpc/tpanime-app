import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'package:tpanime/components/modals/dialog.dart';

// https://www047.vipanicdn.net/streamhls/08d70b9ac9efcd106996e472d2f690a0/ep.11.1686841450.1080.m3u8

Future runPlayer(String videoUrl, context) async {
  String mxPlayerPackageName = "com.mxtech.videoplayer.pro";
  String acdPlayerPackageName = "com.acdplayer.videoplayer.pro";
  // String videoUrl =
  //     "https://www047.vipanicdn.net/streamhls/08d70b9ac9efcd106996e472d2f690a0/ep.11.1686841450.1080.m3u8";

  if (Platform.isAndroid) {
    // Create an intent to open the MX Player app.
    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: videoUrl,
      type: 'video/*',
      package: mxPlayerPackageName,
    );

    try {
      await intent.launch();
    } catch (err) {
      print("error => ${err}");
      dialog(context, err.toString() ?? "Something Went Wrong!");
    }
  }
}
