part of 'author_cubit.dart';

@immutable
abstract class AuthorState extends Equatable {}

class AuthorStateInitial extends AuthorState {
  final int currentIndex;
  final bool isHidden;

  AuthorStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  AuthorStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return AuthorStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
