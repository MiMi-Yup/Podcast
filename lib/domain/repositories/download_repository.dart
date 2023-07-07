import 'dart:async';
import 'dart:io';

abstract class DownloadRepository{
  FutureOr<bool> isDownloaded(String idEpisode);
  FutureOr<List<String>> getListEpisodeIdDownloaded();
  Future<bool> removeEpisode(String idEpisode);
  Future<File?> getEpisode(String idEpisode);
}