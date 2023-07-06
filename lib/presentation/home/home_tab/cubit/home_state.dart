part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeStateInitial extends HomeState {
  final int currentIndex;
  final bool isHidden;

  HomeStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  HomeStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return HomeStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
