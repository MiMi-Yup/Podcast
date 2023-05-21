import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/request/verify_user_request.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
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
      await unitOfWork.preferences.setToken(user.token!);
    }
    return user?.user;
  }

  Future<UserModel?> signUp(
      {required String email, required String password}) async {
    //for test
    //return new UserModel(id: 1, name: 'Admin', email: 'admin@gmail.com');
    // end for test
    LoginUserResponse? user = await unitOfWork.auth.signUp(NewUserRequest(
        email: email, password: password, confirmPassword: password));
    return user?.user;
  }

  Future<bool?> verifyCreate(
      {required String email, required String code}) async {
    return await unitOfWork.auth
        .verifyCreateAccount(VerifyUserRequest(email: email, code: code));
  }
}
