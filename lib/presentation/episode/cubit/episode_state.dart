part of 'episode_cubit.dart';

abstract class ExampleEpisodeState extends Equatable {
  final AudioPlayer audioPlayer;
  final double selectedSpeed;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;
  final EpisodeModel? episode;

  const ExampleEpisodeState({
    required this.audioPlayer,
    required this.selectedSpeed,
    required this.selectedTime,
    required this.seekBarData,
    required this.episode,
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
    EpisodeModel? episode,
  });
}

class EpisodeState extends ExampleEpisodeState {
  const EpisodeState({
    required super.audioPlayer,
    required super.selectedSpeed,
    required super.selectedTime,
    required super.seekBarData,
    required super.episode,
  });

  factory EpisodeState.initial() => EpisodeState(
        audioPlayer: AudioPlayer(),
        selectedSpeed: 1,
        selectedTime: null,
        seekBarData: SeekBarData(Duration.zero, Duration.zero),
        episode: null,
      );

  @override
  EpisodeState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
    EpisodeModel? episode,
  }) {
    return EpisodeState(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      selectedSpeed: selectedSpeed ?? this.selectedSpeed,
      selectedTime: selectedTime ?? this.selectedTime,
      seekBarData: seekBarData ?? this.seekBarData,
      episode: episode ?? this.episode,
    );
  }
}
