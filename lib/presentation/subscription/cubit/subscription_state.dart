part of 'subscription_cubit.dart';

@immutable
abstract class SubscriptionState extends Equatable {}

class SubscriptionStateInitial extends SubscriptionState {
  final int currentIndex;
  final bool isHidden;

  SubscriptionStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  SubscriptionStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return SubscriptionStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
