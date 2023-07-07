part of 'podcast_cubit.dart';

@immutable
class PodcastState extends Equatable {
  final PodcastModel? podcast;

  const PodcastState({required this.podcast});

  factory PodcastState.initial() => const PodcastState(podcast: null);

  @override
  List<Object?> get props => [podcast];

  PodcastState copyWith({PodcastModel? podcast}) {
    return PodcastState(podcast: podcast ?? this.podcast);
  }
}
