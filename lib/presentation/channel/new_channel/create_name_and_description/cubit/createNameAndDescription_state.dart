part of 'createNameAndDescription_cubit.dart';

@immutable
abstract class CreateNameAndDescriptionState extends Equatable {}

class CreateNameAndDescriptionStateInitial extends CreateNameAndDescriptionState {
  final int currentIndex;
  final bool isHidden;

  CreateNameAndDescriptionStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  CreateNameAndDescriptionStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return CreateNameAndDescriptionStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
