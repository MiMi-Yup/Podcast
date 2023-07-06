part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchStateInitial extends SearchState {
  final List<PodcastModel>? channels;
  final List<PodcastModel>? podcasts;
  final List<PodcastModel>? episodes;

  SearchStateInitial(
      {required this.channels, required this.podcasts, required this.episodes});

  @override
  List<Object?> get props => [channels, podcasts, episodes];

  SearchStateInitial copyWith(
      {List<PodcastModel>? channels,
      List<PodcastModel>? podcasts,
      List<PodcastModel>? episodes}) {
    return SearchStateInitial(
        channels: channels ?? this.channels,
        podcasts: podcasts ?? this.podcasts,
        episodes: episodes ?? this.episodes);
  }
}
