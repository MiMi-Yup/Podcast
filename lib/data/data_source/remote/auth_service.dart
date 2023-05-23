import 'package:join_podcast/models/request/reset_user_request.dart';
import 'package:join_podcast/models/request/verify_user_request.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
import 'package:join_podcast/models/response/reset_token_response.dart';
import 'package:retrofit/http.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
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