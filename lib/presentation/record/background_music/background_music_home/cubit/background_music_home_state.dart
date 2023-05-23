part of 'background_music_home_cubit.dart';

@immutable
abstract class BackgroundMusicHomeState extends Equatable {}

class BackgroundMusicHomeStateInitial extends BackgroundMusicHomeState {
  final int currentIndex;
  final bool isHidden;

  BackgroundMusicHomeStateInitial(
      {required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  BackgroundMusicHomeStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return BackgroundMusicHomeStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
