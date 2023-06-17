import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/utils/file_util.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadUtil {
  static Future<void> downloadEpisode(String url, String id,
      {CancelToken? cancelToken,
      void Function(int received, int total)? onProgress,
      VoidCallback? onError}) async {
    var res1 = await Permission.storage.request();
    var res2 = await Permission.manageExternalStorage.request();

    if (res1 != PermissionStatus.granted || res2 != PermissionStatus.granted) {
      onError;
      return;
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
