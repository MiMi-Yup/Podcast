import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/models/user_model.dart';
import 'package:join_podcast/utils/validation.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<ALoginState> {
  final LoginUseCases usecase;

  LoginCubit({required this.usecase}) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  void confirmPasswordChanged(String value) {
    if (state is SignUpState) {
      emit((state as SignUpState)
          .copyWith(confirmPassword: value, status: LoginStatus.initial));
    }
  }

  void rememberAccount(bool remember) {
    emit(
        state.copyWith(rememberAccount: remember, status: LoginStatus.initial));
  }

  void swapAccess() {
    emit(state is LoginState ? SignUpState.initial() : LoginState.initial());
  }

  void primaryAction() async {
    if (state.isFormValid) {
      emit(state.copyWith(status: LoginStatus.submitting));
      UserModel? user;
      final accept = state is SignUpState
          ? await usecase.signUp(email: state.email, password: state.password)
          : true;
      if (accept == true) {
        user = await usecase.login(
            email: state.email,
            password: state.password,
            remember: state.rememberAccount);
      }
      if (user != null) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } else {
      emit(state.copyWith(status: LoginStatus.inputInValid));
    }
  }
}
