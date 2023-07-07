part of 'editPodcast_cubit.dart';

class EditPodcastState extends Equatable {
  String id;
  String name;
  String? image;
  List<EpisodeModel>? episodes;
  int count;
  int numListening;
  String initImage;

  EditPodcastState(
     {
       required this.id,
       required this.image,
       required this.name,
       required this.episodes,
       required this.count,
       required this.numListening,
       this.initImage = 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
     });

  factory EditPodcastState.initial() {
    return EditPodcastState(
      name: '',
      episodes: [],
      image: null,
      count: 0,
      numListening: 0, id: '',
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [id, name, initImage, episodes, image, count, numListening];

 EditPodcastState copyWith(
      {
        String? id,
        String? image,
        String? name,
        List<EpisodeModel>? episodes,
        int? count,
        int? numListening,
        String? initImage,}) =>
     EditPodcastState(
        name: name ?? this.name,
       image: image ?? this.image,
       episodes: episodes ?? this.episodes,
       count: count ?? this.count,
       numListening: numListening ?? this.numListening,
        initImage: initImage ?? this.initImage, id: id ?? this.id,
      );
}