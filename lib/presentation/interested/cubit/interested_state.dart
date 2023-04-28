part of 'interested_cubit.dart';

class InterestedState extends Equatable {
  final Set<String>? selectedInterest;

  const InterestedState({required this.selectedInterest});

  factory InterestedState.initial() {
    return const InterestedState(selectedInterest: null);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [selectedInterest];

  InterestedState copyWith({Set<String>? selectedInterest}) => InterestedState(
      selectedInterest: selectedInterest ?? this.selectedInterest);
}
