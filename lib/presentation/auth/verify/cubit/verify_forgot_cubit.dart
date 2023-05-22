import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_state.dart';

class VerifyForgotCubit extends VerifyCubit {
  String? token;
  VerifyForgotCubit({required super.loginUserCases, required super.email});

  @override
  Future<void> verify() async {
    //bypass
    token = 'fsd876fds75sd6f5f7sd65';
    emit(state.copyWith(status: VerifyStatus.confirmed));
    return;
    //end bypass

    emit(state.copyWith(status: VerifyStatus.checking));
    if (state.code.length != 5 ||
        await loginUserCases.verifyCreate(email: email, code: state.code) ==
            false) {
      emit(state.copyWith(status: VerifyStatus.failed));
    } else {
      emit(state.copyWith(status: VerifyStatus.confirmed));
    }
  }

  @override
  Future<bool> request() {
    //return loginUserCases.requestForgotPassword(email);
    return Future.delayed(Duration(seconds: 5), () => true);
  }
}
