part of 'set_info_podcast_cubit.dart';

@immutable
abstract class SetInfoPodcastState extends Equatable {}

class SetInfoPodcastStateInitial extends SetInfoPodcastState {
  final int currentIndex;
  final bool isHidden;

  SetInfoPodcastStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  SetInfoPodcastStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return SetInfoPodcastStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
