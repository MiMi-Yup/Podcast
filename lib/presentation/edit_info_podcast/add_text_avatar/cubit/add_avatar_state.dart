part of 'add_text_avatar_cubit.dart';

@immutable
abstract class AddTextAvatarState extends Equatable {}

class AddTextAvatarStateInitial extends AddTextAvatarState {
  final int currentIndex;
  final bool isHidden;

  AddTextAvatarStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  AddTextAvatarStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return AddTextAvatarStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
