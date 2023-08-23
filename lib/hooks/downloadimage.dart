import 'package:dio/dio.dart';
import 'package:tpanime/components/modals/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

Future downloadImage(String image, context) async {
  try {
    final dio = Dio();
    if (await Permission.storage.isDenied) {
      if (await Permission.storage.request().isGranted &&
          await Permission.manageExternalStorage.request().isGranted) {
        // Download the image.
        await dio.download(image, '/cd/sdcard/Download/dsaufho432whf23f.png');
      }
    } else {
      await dio.download(image, '/cd/sdcard/Download/dsaufho432whf23f.png');
    }
  } catch (err) {
    if (context != null) {
      dialog(context, err.toString() ?? "Something Went Wrong!");
    }
    print(err);
  }
}
