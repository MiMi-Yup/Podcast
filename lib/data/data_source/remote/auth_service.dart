import 'package:configuration/utility/constants/auth_constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/response/get_user_response.dart';
import 'package:join_podcast/models/response/login_user_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(AuthConstants.loginUrl)
  Future<LoginUserResponse> login(@Body() LoginUserRequest login);

  @POST(AuthConstants.signUpUrl)
  Future<LoginUserResponse> signUp(@Body() NewUserRequest signUp);
}