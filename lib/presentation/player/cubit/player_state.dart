part of 'player_cubit.dart';

abstract class ExamplePlayerState extends Equatable {
  final double selectedSpeed;
  final bool isDownloaded;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;
  final String? author;
  final EpisodeModel? episode;
  final int? currentIndex;

  const ExamplePlayerState(
      {required this.selectedSpeed,
      required this.isDownloaded,
      required this.selectedTime,
      required this.seekBarData,
      required this.author,
      required this.episode,
      required this.currentIndex});
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [selectedSpeed, selectedTime, seekBarData];
  ExamplePlayerState copyWith({
    AudioPlayer? audioPlayer,
    bool isDownloaded,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    String? author,
    EpisodeModel? episode,
    int? currentIndex,
  });
}

class PlayerState extends ExamplePlayerState {
  const PlayerState(
      {required super.selectedSpeed,
      required super.isDownloaded,
      required super.selectedTime,
      required super.seekBarData,
      required super.author,
      required super.episode,
      required super.currentIndex});

  factory PlayerState.initial() => PlayerState(
      selectedSpeed: 1,
      isDownloaded: false,
      selectedTime: null,
      seekBarData: SeekBarData(Duration.zero, Duration.zero),
      author: null,
      episode: null,
      currentIndex: 0);

  @override
  PlayerState copyWith(
      {AudioPlayer? audioPlayer,
      bool? isDownloaded,
      double? selectedSpeed,
      DateTime? selectedTime,
      SeekBarData? seekBarData,
      String? author,
      EpisodeModel? episode,
      int? currentIndex}) {
    return PlayerState(
        selectedSpeed: selectedSpeed ?? this.selectedSpeed,
        isDownloaded: isDownloaded ?? this.isDownloaded,
        selectedTime: selectedTime ?? this.selectedTime,
        seekBarData: seekBarData ?? this.seekBarData,
        author: author ?? this.author,
        episode: episode ?? this.episode,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}
