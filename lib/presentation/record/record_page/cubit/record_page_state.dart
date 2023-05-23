part of 'record_page_cubit.dart';

@immutable
abstract class RecordPageState extends Equatable {}

class RecordPageStateInitial extends RecordPageState {
  final int currentIndex;
  final bool isHidden;

  RecordPageStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  RecordPageStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return RecordPageStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
