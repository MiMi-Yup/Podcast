part of 'createNewEpisode_cubit.dart';

@immutable
abstract class CreateNewEpisodeState extends Equatable {}

class CreateNewEpisodeStateInitial extends CreateNewEpisodeState {
  final int currentIndex;
  final bool isHidden;

  CreateNewEpisodeStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  CreateNewEpisodeStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return CreateNewEpisodeStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}