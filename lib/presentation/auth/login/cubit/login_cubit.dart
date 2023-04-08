import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/models/user_model.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<ALoginState> {
  final LoginUseCases loginUserCases;

  LoginCubit({required this.loginUserCases}) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
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
      UserModel? user = null;
      if (state is SignUpState) {
        user = await loginUserCases.signUp('', state.email, state.password);
      } else {
        user = await loginUserCases.login(state.email, state.password);
      }
      if (user != null) emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  void loginClickedEvent() {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    loginUserCases.login(state.email, state.password).then((value) => {
          if (value != null)
            emit(state.copyWith(status: LoginStatus.success))
          else
            emit(state.copyWith(status: LoginStatus.error))
        });
  }
}
