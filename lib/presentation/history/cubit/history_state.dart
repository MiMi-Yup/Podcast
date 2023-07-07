part of 'history_cubit.dart';

@immutable
class HistoryState extends Equatable {
  final List<EpisodeModel>? episodes;
  final int offsetEpisode;

  const HistoryState({required this.episodes, required this.offsetEpisode});

  factory HistoryState.initial() =>
      const HistoryState(episodes: [], offsetEpisode: 1);

  @override
  List<Object?> get props => [episodes, offsetEpisode];

  HistoryState copyWith({List<EpisodeModel>? episodes, int? offsetEpisode}) {
    return HistoryState(
        episodes: episodes ?? this.episodes,
        offsetEpisode: offsetEpisode ?? this.offsetEpisode);
  }
}
