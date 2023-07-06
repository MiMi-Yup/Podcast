part of 'podcast_availability_cubit.dart';

@immutable
abstract class PodcastAvailabilityState extends Equatable {}

class PodcastAvailabilityStateInitial extends PodcastAvailabilityState {
  final int currentIndex;
  final bool isHidden;

  PodcastAvailabilityStateInitial(
      {required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  PodcastAvailabilityStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return PodcastAvailabilityStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
