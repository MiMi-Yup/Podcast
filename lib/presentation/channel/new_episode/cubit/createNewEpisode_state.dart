part of 'createNewEpisode_cubit.dart';

class CreateNewEpisodeState extends Equatable {
  final String image;
  final String name;
  final String description;
  final String href;
  final String podcastID;
  final double duration;

  const CreateNewEpisodeState(
      {required this.image,
        required this.name,
        required this.description,
        required this.href,
        required this.podcastID,
        required this.duration,
      });

  factory CreateNewEpisodeState.initial() {
    return CreateNewEpisodeState(
      name: '',
      description: '',
      image: '',
      href: '',
      podcastID: '',
      duration: 0,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [name, description, image, podcastID, duration, href];

  CreateNewEpisodeState copyWith(
      {String? name,
        String? description,
        String? image,
        String? podcastID,
        String? href,
        double? duration,}) =>
      CreateNewEpisodeState(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        podcastID: podcastID ?? this.podcastID,
        duration: duration ?? this.duration, href: href ?? this.href,
      );
}