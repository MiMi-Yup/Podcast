part of 'download_cubit.dart';

@immutable
class DownloadState extends Equatable {
  final bool autoDownload;
  final bool downloadIfWifi;
  final int removeCompleted;
  final int removeUnfinished;

  const DownloadState(
      {this.autoDownload = false,
      this.downloadIfWifi = true,
      this.removeCompleted = 7,
      this.removeUnfinished = 30});

  @override
  List<Object?> get props =>
      [autoDownload, downloadIfWifi, removeCompleted, removeUnfinished];

  DownloadState copyWith(
      {bool? autoDownload,
      bool? downloadIfWifi,
      int? removeCompleted,
      int? removeUnfinished}) {
    return DownloadState(
        autoDownload: autoDownload ?? this.autoDownload,
        downloadIfWifi: downloadIfWifi ?? this.downloadIfWifi,
        removeCompleted: removeCompleted ?? this.removeCompleted,
        removeUnfinished: removeUnfinished ?? this.removeUnfinished);
  }
}
