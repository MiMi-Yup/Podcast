part of 'createNewEpisode_cubit.dart';

enum Status { initial, submitting, success, error }
class CreateNewEpisodeState extends Equatable {
  final String? image;
  final String name;
  final String description;
  final String href;
  final Status state;
  final String podcastID;
  final double duration;
  final String initImage;


  const CreateNewEpisodeState(
      {required this.image,
        required this.name,
        required this.description,
        required this.href,
        required this.podcastID,
        required this.duration,
        required this.state,
        this.initImage = 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      });

  factory CreateNewEpisodeState.initial() {
    return const CreateNewEpisodeState(
      name: '',
      description: '',
      image: null,
      href: '',
      podcastID: '',
      duration: 0, state: Status.initial,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [name, description, state, image, podcastID, duration, href, initImage];

  CreateNewEpisodeState copyWith(
      {String? name,
        String? description,
        String? image,
        String? podcastID,
        String? href,
        Status? state,
        double? duration,
        String? initImage,}) =>
      CreateNewEpisodeState(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        podcastID: podcastID ?? this.podcastID,
        duration: duration ?? this.duration, href: href ?? this.href, state: state ?? this.state,
        initImage: initImage ?? this.initImage,
      );
}