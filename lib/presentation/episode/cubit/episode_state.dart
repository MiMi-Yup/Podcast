part of 'episode_cubit.dart';

abstract class ExampleEpisodeState extends Equatable {
  final AudioPlayer audioPlayer;
  final double selectedSpeed;
  final String title;
  final String author;
  final String imageLink;
  final String urlEpisode;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;

  const ExampleEpisodeState({
    required this.audioPlayer,
    required this.selectedSpeed,
    required this.title,
    required this.author,
    required this.imageLink,
    required this.urlEpisode,
    required this.selectedTime,
    required this.seekBarData,
  });
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [audioPlayer, selectedSpeed, selectedTime, seekBarData];
  ExampleEpisodeState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    String? title,
    String? author,
    String? imageLink,
    String? urlEpisode,
  });
}
class EpisodeState extends ExampleEpisodeState {
  const EpisodeState({
    required super.audioPlayer,
    required super.selectedSpeed,
    required super.title,
    required super.author,
    required super.imageLink,
    required super.urlEpisode,
    required super.selectedTime,
    required super.seekBarData,
  });

  factory EpisodeState.initial() => EpisodeState(
      audioPlayer: AudioPlayer(),
      selectedSpeed: 1,
      title: 'ABC',
      author: 'Sài Gòn Company',
      imageLink:
          'https://go.yolo.vn/wp-content/uploads/2019/08/hinh-anh-cho-pomsky-dep-45.jpg',
      urlEpisode:
          'https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps',
      selectedTime: null,
      seekBarData: SeekBarData(Duration.zero, Duration.zero));

  @override
  EpisodeState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    String? title,
    String? author,
    String? imageLink,
    String? urlEpisode,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
  }) {
    return EpisodeState(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      selectedSpeed: selectedSpeed ?? this.selectedSpeed,
      title: title ?? this.title,
      author: author ?? this.author,
      imageLink: imageLink ?? this.imageLink,
      urlEpisode: urlEpisode ?? this.urlEpisode,
      selectedTime: selectedTime ?? this.selectedTime,
      seekBarData: seekBarData ?? this.seekBarData,
    );
  }
}
