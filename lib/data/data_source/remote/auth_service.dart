import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/response/auth/reset_token_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/login')
  Future<ApiResponse<LoginUserResponse>> login(@Body() LoginUserRequest login);

  @POST('/auth/signup')
  Future<void> signUp(@Body() NewUserRequest signUp);

  @POST('/auth/verification')
  Future<void> verifyCreate(@Body() VerifyUserRequest signUp);

  @POST('/auth/forgot-password/verification')
  Future<ApiResponse<ResetTokenResponse>> verifyForgot(@Body() VerifyUserRequest signUp);

  @POST('/auth/forgot-password')
  Future<void> forgotAccount(@Body() VerifyUserRequest signUp);

  @PATCH('/auth/reset-password/{token}')
  Future<void> resetAccount(@Path('token') String token,  @Body() ResetUserRequest signUp);
}