part of 'playlist_cubit.dart';

enum SortOrder { nameAsc, nameDesc, dateAsc, dateDesc }

@immutable
class PlaylistState extends Equatable {
  final String namePlaylist;
  final int count;
  final Duration totalTime;
  final int countDownload;
  final int countWatched;
  final List<EpisodeModel> episodes;
  final SortOrder order;

  const PlaylistState(
      {required this.namePlaylist,
      required this.count,
      required this.totalTime,
      required this.countDownload,
      required this.countWatched,
      required this.episodes,
      required this.order});

  factory PlaylistState.initial() => const PlaylistState(
      namePlaylist: '',
      count: 0,
      totalTime: Duration.zero,
      countDownload: 0,
      countWatched: 0,
      episodes: [],
      order: SortOrder.dateDesc);

  @override
  List<Object?> get props => [
        namePlaylist,
        count,
        totalTime,
        countDownload,
        countWatched,
        episodes,
        order
      ];

  PlaylistState copyWith(
      {String? namePlaylist,
      int? count,
      int? countDownload,
      List<EpisodeModel>? episodes,
      SortOrder? order}) {
    Duration totalTime = this.totalTime;
    int countWatched = this.countWatched;
    if (episodes != null && (count ?? 0) > 0) {
      totalTime = Duration(
          seconds: episodes
              .map((e) => e.duration)
              .reduce((value, element) => (value ?? 0) + (element ?? 0))!
              .toInt());
      countWatched =
          episodes.where((element) => element.isListened == true).length;
    }
    return PlaylistState(
        namePlaylist: namePlaylist ?? this.namePlaylist,
        count: count ?? this.count,
        totalTime: totalTime,
        countDownload: countDownload ?? this.countDownload,
        countWatched: countWatched,
        episodes: episodes ?? this.episodes,
        order: order ?? this.order);
  }
}
