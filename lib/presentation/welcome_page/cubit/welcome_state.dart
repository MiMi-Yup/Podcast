part of 'welcome_cubit.dart';

enum WelcomeStatus { initial, newUser, login, error }

class WelcomeState extends Equatable {
  final WelcomeStatus status;
  final UserModel? user;

  const WelcomeState({required this.status, required this.user});

  factory WelcomeState.initial() {
    return const WelcomeState(status: WelcomeStatus.initial, user: null);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status, user];

  WelcomeState copyWith({WelcomeStatus? status, UserModel? user}) {
    return WelcomeState(status: status ?? this.status, user: user);
  }
}
