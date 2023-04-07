import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/models/user_model.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginUseCases loginUserCases;

  LoginPageCubit({required this.loginUserCases})
      : super(LoginPageState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
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
