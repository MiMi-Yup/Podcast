part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error, inputInValid }

abstract class ALoginState extends Equatable {
  final String email;
  final String password;
  final bool rememberAccount;
  final LoginStatus status;
  final UserModel? user;
  final String? log;

  bool get isFormValid => isEmailValid && password.isNotEmpty;
  bool get isEmailValid => email.isNotEmpty && Validation.validEmail(email);

  const ALoginState(
      {required this.email,
      required this.password,
      required this.status,
      required this.user,
      required this.rememberAccount,
      required this.log});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [email, password, status, user, rememberAccount, log];

  ALoginState copyWith(
      {String? email,
      String? password,
      LoginStatus? status,
      UserModel? user,
      bool? rememberAccount,
      String? log});
}

class LoginState extends ALoginState {
  const LoginState(
      {required super.email,
      required super.password,
      required super.status,
      required super.user,
      required super.rememberAccount,
      required super.log});

  factory LoginState.initial() {
    return const LoginState(
        email: '',
        password: '',
        status: LoginStatus.initial,
        user: null,
        rememberAccount: false,
        log: null);
  }

  @override
  LoginState copyWith(
      {String? email,
      String? password,
      LoginStatus? status,
      UserModel? user,
      bool? rememberAccount,
      String? log}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user,
        rememberAccount: rememberAccount ?? this.rememberAccount,
        log: log ?? this.log);
  }
}

class SignUpState extends ALoginState {
  final String confirmPassword;
  const SignUpState(
      {required super.email,
      required super.password,
      required this.confirmPassword,
      required super.status,
      required super.user,
      required super.rememberAccount,
      required super.log});

  factory SignUpState.initial() {
    return const SignUpState(
        email: '',
        password: '',
        confirmPassword: '',
        status: LoginStatus.initial,
        user: null,
        rememberAccount: false,
        log: null);
  }

  @override
  bool get isFormValid =>
      super.isFormValid && password.isNotEmpty && password == confirmPassword;

  @override
  List<Object?> get props => super.props..add(confirmPassword);

  @override
  SignUpState copyWith(
      {String? email,
      String? password,
      String? confirmPassword,
      LoginStatus? status,
      UserModel? user,
      bool? rememberAccount,
      String? log}) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        status: status ?? this.status,
        user: user,
        rememberAccount: rememberAccount ?? this.rememberAccount,
        log: log ?? this.log);
  }
}
