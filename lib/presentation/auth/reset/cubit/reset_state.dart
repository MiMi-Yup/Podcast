part of 'reset_cubit.dart';

enum ResetAccountStatus { initial, submitting, failed, done }

@immutable
class ResetAccountState extends Equatable {
  final String password;
  final String confirmPassword;
  final bool rememberAccount;
  final ResetAccountStatus status;

  bool get inValidForm => password.isNotEmpty && password == confirmPassword;

  const ResetAccountState(
      {required this.password,
      required this.confirmPassword,
      required this.rememberAccount,
      required this.status});

  factory ResetAccountState.initial() => const ResetAccountState(
      password: '',
      confirmPassword: '',
      rememberAccount: true,
      status: ResetAccountStatus.initial);

  @override
  List<Object?> get props =>
      [password, confirmPassword, rememberAccount, status];

  ResetAccountState copyWith(
      {String? password,
      String? confirmPassword,
      bool? rememberAccount,
      ResetAccountStatus? status}) {
    return ResetAccountState(
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        rememberAccount: rememberAccount ?? this.rememberAccount,
        status: status ?? this.status);
  }
}
