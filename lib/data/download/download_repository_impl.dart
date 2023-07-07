import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/local_storage_service.dart';
import 'package:join_podcast/domain/repositories/download_repository.dart';
import 'package:path/path.dart' as p;

@Injectable(as: DownloadRepository)
class DownloadRepositoryImpl implements DownloadRepository {
  final LocalStorageService service;

  DownloadRepositoryImpl({required this.service});

  @override
  FutureOr<List<String>> getListEpisodeIdDownloaded() async {
    final files = await service.getAllFile();
    return files?.isNotEmpty == true
        ? files!.map((e) => p.basenameWithoutExtension(e.path)).toList()
        : [];
  }

  @override
  FutureOr<bool> isDownloaded(String idEpisode) async {
    return await getEpisode(idEpisode) != null;
  }

  @override
  Future<bool> removeEpisode(String idEpisode) async {
    final file = await getEpisode(idEpisode);
    if (file != null && file.existsSync()) {
      file.deleteSync();
      return true;
    }
    return false;
  }

  @override
  Future<File?> getEpisode(String idEpisode) async {
    final files = await service.getAllFile();
    final find = files?.where((element) =>
        p.basenameWithoutExtension(element.path).compareTo(idEpisode) == 0);
    return find?.isNotEmpty == true ? find?.first : null;
  }
}
