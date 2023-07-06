import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/user_model.dart';

@injectable
class LoginUseCases {
  final UnitOfWork unitOfWork;

  LoginUseCases({required this.unitOfWork});

  Future<UserModel?> login(
      {required String email,
      required String password,
      bool remember = false}) async {
    //for test
    //return new UserModel(id: 1, name: 'Admin', email: 'admin@gmail.com');
    // end for test
    LoginUserResponse? user = await unitOfWork.auth
        .loginByPassword(LoginUserRequest(email: email, password: password));
    if (user != null && user.token != null && user.token!.isNotEmpty) {
      unitOfWork.session
          .login(token: user.token!, remember: remember, user: user.user);
    }
    return user?.user;
  }

  Future<bool?> signUp(
      {required String email, required String password}) async {
    //for test
    //return new UserModel(id: 1, name: 'Admin', email: 'admin@gmail.com');
    // end for test
    return unitOfWork.auth.signUp(NewUserRequest(
        email: email, password: password, confirmPassword: password));
  }

  Future<bool?> verifyCreate(
      {required String email, required String code}) async {
    return await unitOfWork.auth
        .verifyCreateAccount(VerifyUserRequest(email: email, code: code));
  }

  Future<void> requestForgotPassword({required String email}) async {
    return unitOfWork.auth.forgotAccount(email: email);
  }

  Future<String?> verifyForgot(
      {required String email, required String code}) async {
    final result = await unitOfWork.auth
        .verifyForgotAccount(VerifyUserRequest(email: email, code: code));
    return result?.token;
  }

  Future<bool?> resetPassword(
      {required String token, required String password}) async {
    return unitOfWork.auth.resetAccount(
        token: token,
        request:
            ResetUserRequest(password: password, confirmPassword: password));
  }
}
