part of 'add_avatar_cubit.dart';

@immutable
abstract class AddAvatarState extends Equatable {}

class AddAvatarStateInitial extends AddAvatarState {
  final int currentIndex;
  final bool isHidden;

  AddAvatarStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  AddAvatarStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return AddAvatarStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
