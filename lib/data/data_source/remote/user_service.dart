import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';
import 'package:join_podcast/models/request/users/update_channel_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/users/profile_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('/users/self')
  Future<ApiResponse<ProfileResponse>> getCurrentProfile();

  @PATCH('/users/self/change-password')
  Future<void> changePassword(@Body() UserChangePasswordRequest signUp);

  @GET('/users/{id}')
  Future<ApiResponse<ProfileResponse>> getUserById(@Path('id') String id);

  @PATCH('/users/update')
  Future<ApiResponse<ProfileResponse>> updateUser(@Body() UserUpdateRequest request);

  @PATCH('/users/self/channel/create')
  Future<void> createChannel(@Body() CreateChannelRequest request);

  @PATCH('/users/self/channel/update')
  Future<void> updateChannel(@Body() UpdateChannelRequest request);
}