import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_state.dart';

abstract class VerifyCubit extends Cubit<VerifyState> {
  final LoginUseCases usecase;
  final String email;

  VerifyCubit({required this.usecase, required this.email})
      : super(VerifyState.initial());

  void changeCode(String value) {
    emit(state.copyWith(code: value, status: VerifyStatus.initial));
  }

  Future<void> verify();
  Future<bool> request();
}
