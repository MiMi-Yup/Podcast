part of 'podcast_cubit.dart';

abstract class ExamplePodcastState extends Equatable {
  final AudioPlayer audioPlayer;
  double selectedSpeed;
  final String title;
  final String author;
  final String imageLink;
  final String url;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;

  ExamplePodcastState({
    required this.audioPlayer,
    required this.selectedSpeed,
    required this.title,
    required this.author,
    required this.imageLink,
    required this.url,
    required this.selectedTime,
    required this.seekBarData,
  });
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [audioPlayer, selectedSpeed, selectedTime, seekBarData];
  ExamplePodcastState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    String? title,
    String? author,
    String? imageLink,
    String? url,
  });
}

class PodcastState extends ExamplePodcastState {
  PodcastState({
    required super.audioPlayer,
    required super.selectedSpeed,
    required super.title,
    required super.author,
    required super.imageLink,
    required super.url,
    required super.selectedTime,
    required super.seekBarData,
  });

  factory PodcastState.initial() => PodcastState(
      audioPlayer: AudioPlayer(),
      selectedSpeed: 1,
      title: 'ABC',
      author: 'Sài Gòn Company',
      imageLink:
          'https://go.yolo.vn/wp-content/uploads/2019/08/hinh-anh-cho-pomsky-dep-45.jpg',
      url:
          'https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps',
      selectedTime: null,
      seekBarData: SeekBarData(Duration.zero, Duration.zero));

  @override
  PodcastState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    String? title,
    String? author,
    String? imageLink,
    String? url,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
  }) {
    return PodcastState(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      selectedSpeed: selectedSpeed ?? this.selectedSpeed,
      title: title ?? this.title,
      author: author ?? this.author,
      imageLink: imageLink ?? this.imageLink,
      url: url ?? this.url,
      selectedTime: selectedTime ?? this.selectedTime,
      seekBarData: seekBarData ?? this.seekBarData,
    );
  }
}
