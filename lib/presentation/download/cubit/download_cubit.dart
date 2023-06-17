import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/local_storage_service.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:path/path.dart' as p;

part 'download_state.dart';

@injectable
class DownloadCubit extends Cubit<DownloadState> {
  final UnitOfWork unitOfWork;
  final LocalStorageService service;
  DownloadCubit({required this.unitOfWork, required this.service})
      : super(const DownloadState());

  Future<bool> loadPrefs() async {
    final downloaded = await service.getAllFile();
    List<EpisodeModel> episodes = [];

    if (downloaded != null && downloaded.isNotEmpty) {
      final _episodes = await Future.wait(downloaded.map((e) async => unitOfWork
          .episode
          .getEpisodeById(p.basenameWithoutExtension(e.path))));
      episodes = _episodes
          .where((element) => element != null)
          .cast<EpisodeModel>()
          .toList();
    }

    emit(state.copyWith(
        downloaded: episodes,
        autoDownload: await unitOfWork.sharedPreferences.getAutodownload,
        downloadIfWifi: await unitOfWork.sharedPreferences.getDownloadWifi,
        removeCompleted: await unitOfWork.sharedPreferences.getRemoveCompleted,
        removeUnfinished:
            await unitOfWork.sharedPreferences.getRemoveUnfinished));
    return true;
  }

  void changeAutodownload(bool value) {
    unitOfWork.sharedPreferences.setAutodownload(value);
    emit(state.copyWith(autoDownload: value));
  }

  void changeDownloadWifi(bool value) {
    unitOfWork.sharedPreferences.setDownloadWifi(value);
    emit(state.copyWith(downloadIfWifi: value));
  }

  void changeRemoveCompleted(int value) {
    unitOfWork.sharedPreferences.setRemoveCompleted(value);
    emit(state.copyWith(removeCompleted: value));
  }

  void changeRemoveUnfinished(int value) {
    unitOfWork.sharedPreferences.setRemoveUnfinished(value);
    emit(state.copyWith(removeUnfinished: value));
  }
}
