import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<String> getDownloadDirectory() async {
    Directory dir = await getApplicationDocumentsDirectory();
    final String folder = '${dir.path}/episodes';
    await _createFolderIfNotExist(folder);
    return folder;
  }

  static Future<void> _createFolderIfNotExist(String saveFolderPath) async {
    final bool isExists = Directory(saveFolderPath).existsSync();

    if (!isExists) {
      Directory(saveFolderPath).createSync();
    }
  }
}
