part of 'createNewPodcast_cubit.dart';

enum Status { initial, submitting, success, error }

class CreateNewPodcastState extends Equatable {
  final String image;
  final String name;
  final String description;
  final String categoryId;

  const CreateNewPodcastState(
      {required this.image,
        required this.name,
        required this.description,
        required this.categoryId,
      });

  factory CreateNewPodcastState.initial() {
    return CreateNewPodcastState(
        name: '',
        description: '',
        image: '',
        categoryId: '',);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [name, description, image, categoryId];

  CreateNewPodcastState copyWith(
      {String? name,
        String? description,
        String? image,
        String? categoryId,}) =>
      CreateNewPodcastState(
          name: name ?? this.name,
          description: description ?? this.description,
          image: image ?? this.image,
          categoryId: categoryId ?? this.categoryId,
      );
}
