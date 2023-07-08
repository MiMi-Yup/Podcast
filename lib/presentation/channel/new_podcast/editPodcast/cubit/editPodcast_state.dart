part of 'editPodcast_cubit.dart';

@immutable
class EditPodcastState extends Equatable {
  final PodcastModel? podcast;
  final List<EpisodeModel>? episodes;

  const EditPodcastState({required this.episodes, required this.podcast});

  factory EditPodcastState.initial() {
    return const EditPodcastState(podcast: null, episodes: null);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [podcast, episodes];

  EditPodcastState copyWith(
          {PodcastModel? podcast, List<EpisodeModel>? episodes}) =>
      EditPodcastState(
          episodes: episodes ?? this.episodes,
          podcast: podcast ?? this.podcast);
}
