import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/utils/file_util.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadUtil {
  static Future<bool> _checkPermission() async {
    bool gotPermissions = false;

    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var sdkInt = androidInfo.version.sdkInt; // SDK, example: 31

    if (Platform.isAndroid) {
      var storage = await Permission.storage.status;

      if (storage != PermissionStatus.granted) {
        await Permission.storage.request();
      }

      if (sdkInt >= 30) {
        var storage_external = await Permission.manageExternalStorage.status;

        if (storage_external != PermissionStatus.granted) {
          await Permission.manageExternalStorage.request();
        }

        storage_external = await Permission.manageExternalStorage.status;

        if (storage_external == PermissionStatus.granted &&
            storage == PermissionStatus.granted) {
          gotPermissions = true;
        }
      } else {
        // (SDK < 30)
        storage = await Permission.storage.status;

        if (storage == PermissionStatus.granted) {
          gotPermissions = true;
        }
      }
    }
    return gotPermissions;
  }

  static Future<void> downloadEpisode(String url, String id,
      {CancelToken? cancelToken,
      void Function(int received, int total)? onProgress,
      VoidCallback? onError}) async {
    var res1 = await Permission.storage.request();
    var res2 = await Permission.manageExternalStorage.request();
    var res3 = await _checkPermission();

    if (res3 == false) {
      onError;
      return null;
    }

    var savePath = await FileUtil.getDownloadDirectory();
    final dio = getIt<Dio>();

    dio
        .download(
      url,
      '$savePath/$id.mp3',
      cancelToken: cancelToken,
      onReceiveProgress: onProgress,
    )
        .catchError((error) {
      onError;
      debugPrint(error);
    });
  }
}
