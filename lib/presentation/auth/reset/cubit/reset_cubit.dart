import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';

part 'reset_state.dart';

@injectable
class ResetAccountCubit extends Cubit<ResetAccountState> {
  final LoginUseCases loginUserCases;
  final String token;

  ResetAccountCubit({required this.loginUserCases, required this.token})
      : super(ResetAccountState.initial());

  void rememberAccount(bool remember) {
    emit(state.copyWith(rememberAccount: remember));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void confirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: value));
  }

  Future<void> submit() async {
    emit(state.copyWith(status: ResetAccountStatus.submitting));
    if (state.inValidForm &&
        await loginUserCases.resetPassword(
                token: token, password: state.password) ==
            true) {
      emit(state.copyWith(status: ResetAccountStatus.done));
    } else {
      emit(state.copyWith(status: ResetAccountStatus.failed));
    }
  }
}
