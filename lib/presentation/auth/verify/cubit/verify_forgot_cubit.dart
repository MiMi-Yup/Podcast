import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';

class VerifyForgotCubit extends VerifyCubit {
  VerifyForgotCubit({required super.loginUserCases, required super.email});
  
  @override
  Future<void> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
