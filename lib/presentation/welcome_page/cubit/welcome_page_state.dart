part of 'welcome_page_cubit.dart';

enum WelcomeStatus { initial, newUser, login, error }

class WelcomePageState extends Equatable {
  final WelcomeStatus status;
  final UserModel? user;

  const WelcomePageState({required this.status, required this.user});

  factory WelcomePageState.initial() {
    return const WelcomePageState(status: WelcomeStatus.initial, user: null);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status, user];

  WelcomePageState copyWith({WelcomeStatus? status, UserModel? user}) {
    return WelcomePageState(status: status ?? this.status, user: user);
  }
}
