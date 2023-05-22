part of 'reset_cubit.dart';

@immutable
class ResetAccountState extends Equatable {
  final String password;
  final String confirmPassword;
  final bool rememberAccount;

  const ResetAccountState(
      {required this.password,
      required this.confirmPassword,
      required this.rememberAccount});

  factory ResetAccountState.initial() => const ResetAccountState(
      password: '', confirmPassword: '', rememberAccount: true);

  @override
  List<Object?> get props => [password, confirmPassword, rememberAccount];

  ResetAccountState copyWith(
      {String? password, String? confirmPassword, bool? rememberAccount}) {
    return ResetAccountState(
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        rememberAccount: rememberAccount ?? this.rememberAccount);
  }
}
