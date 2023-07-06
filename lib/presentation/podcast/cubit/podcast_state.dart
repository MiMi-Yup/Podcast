part of 'podcast_cubit.dart';

abstract class ExamplePodcastState extends Equatable {
  final AudioPlayer audioPlayer;
  final double selectedSpeed;
  final DateTime? selectedTime;
  final SeekBarData seekBarData;

  const ExamplePodcastState({
    required this.audioPlayer,
    required this.selectedSpeed,
    required this.selectedTime,
    required this.seekBarData,
  });
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [audioPlayer, selectedSpeed, selectedTime, seekBarData];

  factory ExamplePodcastState.initial() => PodcastState(
      audioPlayer: AudioPlayer(),
      selectedSpeed: 1,
      selectedTime: null,
      seekBarData: SeekBarData(Duration.zero, Duration.zero));

  ExamplePodcastState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
  });
}

class PodcastState extends ExamplePodcastState {
  const PodcastState({
    required super.audioPlayer,
    required super.selectedSpeed,
    required super.selectedTime,
    required super.seekBarData,
  });

  factory PodcastState.initial() => PodcastState(
      audioPlayer: AudioPlayer(),
      selectedSpeed: 1,
      selectedTime: null,
      seekBarData: SeekBarData(Duration.zero, Duration.zero));

  @override
  PodcastState copyWith({
    AudioPlayer? audioPlayer,
    double? selectedSpeed,
    DateTime? selectedTime,
    SeekBarData? seekBarData,
  }) {
    return PodcastState(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      selectedSpeed: selectedSpeed ?? this.selectedSpeed,
      selectedTime: selectedTime ?? this.selectedTime,
      seekBarData: seekBarData ?? this.seekBarData,
    );
  }
}
