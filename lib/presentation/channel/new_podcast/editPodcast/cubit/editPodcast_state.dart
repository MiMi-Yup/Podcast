part of 'editPodcast_cubit.dart';

@immutable
abstract class EditPodcastState extends Equatable {}

class EditPodcastStateInitial extends EditPodcastState {
  final int currentIndex;
  final bool isHidden;

  EditPodcastStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  EditPodcastStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return EditPodcastStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}