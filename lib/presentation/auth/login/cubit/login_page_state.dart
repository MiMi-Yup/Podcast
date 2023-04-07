part of 'login_page_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginPageState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final UserModel? user;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  const LoginPageState(
      {required this.email,
      required this.password,
      required this.status,
      required this.user});

  factory LoginPageState.initial() {
    return const LoginPageState(
        email: '', password: '', status: LoginStatus.initial, user: null);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [email, password, status, user];

  LoginPageState copyWith(
      {String? email, String? password, LoginStatus? status, UserModel? user}) {
    return LoginPageState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user);
  }
}
