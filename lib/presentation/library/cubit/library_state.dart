part of 'library_cubit.dart';

@immutable
abstract class LibraryState extends Equatable {}

class LibraryStateInitial extends LibraryState {
  final int currentIndex;
  final bool isHidden;

  LibraryStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  LibraryStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return LibraryStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
