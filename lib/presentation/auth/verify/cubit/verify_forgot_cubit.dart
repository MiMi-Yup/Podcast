import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_state.dart';

class VerifyForgotCubit extends VerifyCubit {
  String? token;
  VerifyForgotCubit({required super.usecase, required super.email});

  @override
  Future<void> verify() async {
    emit(state.copyWith(status: VerifyStatus.checking));
    if (state.code.length == 5) {
      token = await usecase.verifyForgot(email: email, code: state.code);
    } else {
      token = null;
    }
    if (token != null) {
      emit(state.copyWith(status: VerifyStatus.confirmed));
    } else {
      emit(state.copyWith(status: VerifyStatus.failed));
    }
  }

  @override
  Future<bool> request() async {
    await usecase.requestForgotPassword(email: email);
    return true;
  }
}
