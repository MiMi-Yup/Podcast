import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_state.dart';

class VerifyCreateCubit extends VerifyCubit {
  VerifyCreateCubit({required super.loginUserCases, required super.email});

  @override
  Future<void> verify() async {
    emit(state.copyWith(status: VerifyStatus.checking));
    if (state.code.length == 5 &&
        await loginUserCases.verifyCreate(email: email, code: state.code) ==
            true) {
      emit(state.copyWith(status: VerifyStatus.confirmed));
    }
    emit(state.copyWith(status: VerifyStatus.failed));
  }
}
