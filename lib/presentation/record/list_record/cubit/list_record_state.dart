part of 'list_record_cubit.dart';

@immutable
abstract class ListRecordState extends Equatable {}

class ListRecordStateInitial extends ListRecordState {
  final int currentIndex;
  final bool isHidden;

  ListRecordStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  ListRecordStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return ListRecordStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
