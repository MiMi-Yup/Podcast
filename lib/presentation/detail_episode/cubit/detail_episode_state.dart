part of 'detail_episode_cubit.dart';

@immutable
class DetailEpisodeState extends Equatable {
  final PodcastModel? podcast;
  final UserModel? user;
  final EpisodeModel? episode;
  const DetailEpisodeState(
      {required this.podcast, required this.user, required this.episode});

  factory DetailEpisodeState.initial() =>
      const DetailEpisodeState(podcast: null, user: null, episode: null);

  @override
  List<Object?> get props => [podcast, user];

  DetailEpisodeState copyWith(
      {PodcastModel? podcast, UserModel? user, EpisodeModel? episode}) {
    return DetailEpisodeState(
        podcast: podcast ?? this.podcast,
        user: user ?? this.user,
        episode: episode ?? this.episode);
  }
}
