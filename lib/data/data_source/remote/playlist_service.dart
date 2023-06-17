import 'package:join_podcast/models/request/playlists/add_episode_request.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/playlists/remove_episode_request.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'playlist_service.g.dart';

@RestApi()
abstract class PlaylistService {
  factory PlaylistService(Dio dio, {String baseUrl}) = _PlaylistService;

  @GET('/playlists/{id}')
  Future<ApiResponse<PlaylistResponse>> getPlaylistById(@Path('id') String id);

  @GET('/playlists')
  Future<ApiResponse<List<PlaylistResponse>>> getAll();

  @POST('/playlists')
  Future<void> create(@Body() PlaylistCreateRequest request);

  @PATCH('/playlists/{id}/add-episode')
  Future<void> addEpisode(
      @Path('id') String id, @Body() AddEpisodeRequest request);

  @PATCH('/playlists/{id}/remove-episode')
  Future<void> removeEpisode(
      @Path('id') String id, @Body() RemoveEpisodeRequest request);

  @DELETE('/playlists/{id}')
  Future<void> deletePlaylist(@Path('id') String id);
}
