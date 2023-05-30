part of 'discover_podcast_cubit.dart';

@immutable
abstract class DiscoverPodcastState extends Equatable {}

class DiscoverPodcastStateInitial extends DiscoverPodcastState {
  final int currentIndex;
  final bool isHidden;

  DiscoverPodcastStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  DiscoverPodcastStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return DiscoverPodcastStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
