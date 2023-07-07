part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final List<PodcastModel>? channels;
  final List<PodcastModel>? podcasts;
  final List<PodcastModel>? episodes;

  const SearchState(
      {required this.channels, required this.podcasts, required this.episodes});

  factory SearchState.initial() =>
      const SearchState(channels: [], podcasts: [], episodes: []);

  @override
  List<Object?> get props => [channels, podcasts, episodes];

  SearchState copyWith(
      {List<PodcastModel>? channels,
      List<PodcastModel>? podcasts,
      List<PodcastModel>? episodes}) {
    return SearchState(
        channels: channels ?? this.channels,
        podcasts: podcasts ?? this.podcasts,
        episodes: episodes ?? this.episodes);
  }
}
