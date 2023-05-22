import 'package:join_podcast/models/request/reset_user_request.dart';
import 'package:join_podcast/models/request/verify_user_request.dart';
import 'package:join_podcast/models/response/token_response.dart';
import 'package:retrofit/http.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/login')
  Future<TokenResponse> login(@Body() LoginUserRequest login);

  @POST('/auth/signup')
  Future<void> signUp(@Body() NewUserRequest signUp);

  @POST('/auth/verification')
  Future<void> verifyCreate(@Body() VerifyUserRequest signUp);

  @POST('/auth/forgot-password/verification')
  Future<TokenResponse> verifyForgot(@Body() VerifyUserRequest signUp);

  @POST('/auth/forgot-password')
  Future<void> forgotAccount(@Body() VerifyUserRequest signUp);

  @POST('/auth/reset-password/{token}')
  Future<void> resetAccount(@Path('token') String token,  @Body() ResetUserRequest signUp);
}