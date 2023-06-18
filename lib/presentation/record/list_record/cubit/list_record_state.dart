part of 'list_record_cubit.dart';

@immutable
abstract class ListRecordState extends Equatable {
  bool get shouldRefresh;

  ListRecordState copyWith({
    int? currentIndex,
    bool? isHidden,
    bool? shouldRefresh,
  });
}

class ListRecordStateInitial extends ListRecordState {
  final int currentIndex;
  final bool isHidden;
  @override
  final bool shouldRefresh;

  ListRecordStateInitial({required this.currentIndex, this.isHidden = false, this.shouldRefresh = false});

  @override
  List<Object?> get props => [currentIndex, isHidden, shouldRefresh];

  @override
  ListRecordStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
    bool? shouldRefresh,
  }) {
    return ListRecordStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
      shouldRefresh: shouldRefresh ?? this.shouldRefresh,
    );
  }
}
