part of 'podcast_cubit.dart';

@immutable
abstract class PodcastState extends Equatable {}

class PodcastStateInitial extends PodcastState {
  final int currentIndex;
  final bool isHidden;

  PodcastStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  PodcastStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return PodcastStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
