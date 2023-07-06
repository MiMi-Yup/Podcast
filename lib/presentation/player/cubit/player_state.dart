part of 'player_cubit.dart';

abstract class ExamplePlayerState extends Equatable {
  final AudioPlayer audioPlayer;
  final double selectedSpeed;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;
  final String? author;
  final EpisodeModel? episode;

  const ExamplePlayerState({
    required this.audioPlayer,
    required this.selectedSpeed,
    required this.selectedTime,
    required this.seekBarData,
    required this.author,
    required this.episode,
  });
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [audioPlayer, selectedSpeed, selectedTime, seekBarData];
  ExamplePlayerState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    String? author,
    EpisodeModel? episode,
  });
}

class PlayerState extends ExamplePlayerState {
  const PlayerState({
    required super.audioPlayer,
    required super.selectedSpeed,
    required super.selectedTime,
    required super.seekBarData,
    required super.author,
    required super.episode,
  });

  factory PlayerState.initial() => PlayerState(
        audioPlayer: AudioPlayer(),
        selectedSpeed: 1,
        selectedTime: null,
        seekBarData: SeekBarData(Duration.zero, Duration.zero),
        author: null,
        episode: null,
      );

  @override
  PlayerState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    String? author,
    EpisodeModel? episode,
  }) {
    return PlayerState(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      selectedSpeed: selectedSpeed ?? this.selectedSpeed,
      selectedTime: selectedTime ?? this.selectedTime,
      seekBarData: seekBarData ?? this.seekBarData,
      author: author ?? this.author,
      episode: episode ?? this.episode,
    );
  }
}
