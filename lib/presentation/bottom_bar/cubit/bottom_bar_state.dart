part of 'bottom_bar_cubit.dart';

@immutable
abstract class BottomBarState extends Equatable {}

class BottomBarInitial extends BottomBarState {
  final int currentIndex;
  final bool isHidden;

  BottomBarInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  BottomBarInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return BottomBarInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}