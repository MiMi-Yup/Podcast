import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';
import 'package:join_podcast/models/request/users/update_channel_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/response/channel/channel_response.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/models/response/users/user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('/users/{id}')
  Future<ApiResponse<UserResponse>> getUserById(@Path('id') String id);

  @GET('/users/self')
  Future<ApiResponse<UserResponse>> getCurrentProfile();

  @PATCH('/users/self/change-password')
  Future<void> changePassword(@Body() UserChangePasswordRequest signUp);

  @PATCH('/users/self')
  Future<ApiResponse<UserResponse>> updateUser(
      @Body() UserUpdateRequest request);

  @POST('/users/self/channel')
  Future<ApiResponse<LoginUserResponse>> createChannel(
      @Body() CreateChannelRequest request);

  @PATCH('/users/self/channel')
  Future<void> updateChannel(@Body() UpdateChannelRequest request);

  @GET('/users/self/channel')
  Future<ApiResponse<ChannelResponse>> getSelfChannel();

  @GET('/users/channels/search')
  Future<ApiResponse<ListSeperateResponse<UserResponse>>> search(
      @Query('q') String query,
      @Query('offset') int? offset,
      @Query('limit') int? limit);

  @GET('/users/{id}/channel')
  Future<ApiResponse<ChannelResponse>> getChannelByIdUser(
      @Path('id') String idUser);

  @GET('/users/self/listened-episodes')
  Future<ApiResponse<ListResponse<EpisodeResponse>>> getHistoryEpisodes();

  @DELETE('/users/self/listened-episodes')
  Future<void> clearHistory();

  @POST('/users/self/listened-episodes/{id}')
  Future<void> addHistory(@Path('id') String id);

  @DELETE('/users/self/listened-episodes/{id}')
  Future<void> removeHistoryById(@Path('id') String id);

  @GET('/users/self/favorite-episodes')
  Future<ApiResponse<ListResponse<EpisodeResponse>>> getFavouriteEpisodes();

  @DELETE('/users/self/favorite-episodes')
  Future<void> clearFavourite();

  @POST('/users/self/favorite-episodes/{id}')
  Future<void> addIntoFavourite(@Path('id') String id);

  @DELETE('/users/self/favorite-episodes/{id}')
  Future<void> removeFavouriteById(@Path('id') String id);

  @GET('/users/self/search-history')
  Future<ApiResponse<List<String>>> getSearchHistory();

  @DELETE('/users/self/search-history/{searchStr}')
  Future<void> removeSearchHistory(@Path('searchStr') String id);

  @GET('/users/self/subscribed-podcasts')
  Future<ApiResponse<ListSeperateResponse<PodcastResponse>>>
      getSubcribedPodcasts(
          @Query('offset') int? offset, @Query('limit') int? limit);
}
