part of 'createNameAndDescription_cubit.dart';

@immutable
class CreateNameAndDescriptionState extends Equatable {
  final String? nameChannel;
  final int? countPodcast;
  final int? countListened;
  final List<PodcastModel>? podcasts;

  const CreateNameAndDescriptionState(
      {required this.nameChannel,
      required this.countPodcast,
      required this.countListened,
      required this.podcasts});

  factory CreateNameAndDescriptionState.initial() =>
      const CreateNameAndDescriptionState(
          nameChannel: null,
          countPodcast: null,
          countListened: null,
          podcasts: null);

  @override
  List<Object?> get props =>
      [nameChannel, countPodcast, countListened, podcasts];

  CreateNameAndDescriptionState copyWith(
      {String? nameChannel,
      int? countPodcast,
      int? countListened,
      List<PodcastModel>? podcasts}) {
    return CreateNameAndDescriptionState(
        countListened: countListened ?? this.countListened,
        countPodcast: countPodcast ?? this.countPodcast,
        nameChannel: nameChannel ?? this.nameChannel,
        podcasts: podcasts ?? this.podcasts);
  }
}
