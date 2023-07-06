part of 'createNewPodcast_cubit.dart';

@immutable
abstract class CreateNewPodcastState extends Equatable {}

class CreateNewPodcastStateInitial extends CreateNewPodcastState {
  final int currentIndex;
  final bool isHidden;

  CreateNewPodcastStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  CreateNewPodcastStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return CreateNewPodcastStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}