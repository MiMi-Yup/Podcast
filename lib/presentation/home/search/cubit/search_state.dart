part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final List<UserModel>? channels;
  final List<PodcastModel>? podcasts;
  final List<EpisodeModel>? episodes;
  final int offsetChannel;
  final int offsetPodcast;
  final int offsetEpisode;
  final String query;

  const SearchState(
      {required this.channels,
      required this.podcasts,
      required this.episodes,
      required this.offsetChannel,
      required this.offsetPodcast,
      required this.offsetEpisode,
      required this.query});

  factory SearchState.initial() => const SearchState(
      channels: [],
      podcasts: [],
      episodes: [],
      offsetChannel: 1,
      offsetEpisode: 1,
      offsetPodcast: 1,
      query: '');

  @override
  List<Object?> get props => [
        channels,
        podcasts,
        episodes,
        offsetChannel,
        offsetEpisode,
        offsetPodcast,
        query
      ];

  SearchState copyWith(
      {List<UserModel>? channels,
      List<PodcastModel>? podcasts,
      List<EpisodeModel>? episodes,
      int? offsetChannel,
      int? offsetPodcast,
      int? offsetEpisode,
      String? query}) {
    if (query?.isNotEmpty == true && query!.compareTo(this.query) != 0) {
      offsetChannel = 1;
      offsetEpisode = 1;
      offsetPodcast = 1;
      channels = [];
      podcasts = [];
      episodes = [];
    }
    return SearchState(
        channels: channels ?? this.channels,
        podcasts: podcasts ?? this.podcasts,
        episodes: episodes ?? this.episodes,
        offsetChannel: offsetChannel ?? this.offsetChannel,
        offsetPodcast: offsetPodcast ?? this.offsetPodcast,
        offsetEpisode: offsetEpisode ?? this.offsetEpisode,
        query: query ?? this.query);
  }
}
