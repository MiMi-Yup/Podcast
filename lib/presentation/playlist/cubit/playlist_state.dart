part of 'playlist_cubit.dart';

@immutable
abstract class PlaylistState extends Equatable {}

class PlaylistStateInitial extends PlaylistState {
  final int currentIndex;
  final bool isHidden;

  PlaylistStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  PlaylistStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return PlaylistStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}