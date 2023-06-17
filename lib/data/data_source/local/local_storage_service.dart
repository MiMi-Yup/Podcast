import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/utils/file_util.dart';

@lazySingleton
class LocalStorageService {
  Future<bool?> existFile(String file) async {
    String dir = await FileUtil.getDownloadDirectory();
    return File('$dir/$file').existsSync();
  }

  Future<List<File>?> getAllFile() async {
    String folder = await FileUtil.getDownloadDirectory();
    Directory dir = Directory(folder);
    if (!dir.existsSync()) return null;
    return dir.listSync().whereType<File>().toList();
  }
}
