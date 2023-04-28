part of 'notification_cubit.dart';

@immutable
abstract class NotificationState extends Equatable {}

class NotificationStateInitial extends NotificationState {
  final int currentIndex;
  final bool isHidden;

  NotificationStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  NotificationStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return NotificationStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
