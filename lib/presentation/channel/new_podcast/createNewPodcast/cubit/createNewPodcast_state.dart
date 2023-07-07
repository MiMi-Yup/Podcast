part of 'createNewPodcast_cubit.dart';

enum Status { initial, submitting, success, error }

class CreateNewPodcastState extends Equatable {
  final String? image;
  final String name;
  final String description;
  final String categoryId;
  final Status state;
  final String initImage;

  const CreateNewPodcastState(
      {required this.image,
        required this.name,
        required this.description,
        required this.state,
        required this.categoryId,
        this.initImage = 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      });

  factory CreateNewPodcastState.initial() {
    return const CreateNewPodcastState(
        name: '',
        description: '',
        image: null,
        categoryId: '',
      state: Status.initial,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [name, description, image, state, categoryId, initImage];

  CreateNewPodcastState copyWith(
      {String? name,
        String? description,
        String? image,
        Status? state,
        String? categoryId,
        String? initImage,}) =>
      CreateNewPodcastState(
          name: name ?? this.name,
          description: description ?? this.description,
          image: image ?? this.image,
          state: state ?? this.state,
          categoryId: categoryId ?? this.categoryId,
          initImage: initImage ?? this.initImage,
      );
}
