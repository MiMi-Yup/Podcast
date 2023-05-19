part of 'background_music_cubit.dart';

@immutable
abstract class BackgroundMusicState extends Equatable {}

class BackgroundMusicStateInitial extends BackgroundMusicState {
  final int currentIndex;
  final bool isHidden;

  BackgroundMusicStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  BackgroundMusicStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return BackgroundMusicStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
