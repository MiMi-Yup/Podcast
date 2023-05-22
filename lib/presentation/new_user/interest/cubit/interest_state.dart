part of 'interest_cubit.dart';

@immutable
class InterestState extends Equatable {
  final Set<String> interested;

  const InterestState({required this.interested});

  factory InterestState.initial() => const InterestState(interested: {});

  @override
  List<Object?> get props => [interested];

  InterestState copyWith({Set<String>? interested}) {
    return InterestState(interested: interested ?? this.interested);
  }
}
