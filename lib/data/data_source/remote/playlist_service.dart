import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/playlists/update_request.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'playlist_service.g.dart';

@RestApi()
abstract class PlaylistService {
  factory PlaylistService(Dio dio, {String baseUrl}) = _PlaylistService;

  @GET('/playlists')
  Future<ApiResponse<ListResponse<PlaylistResponse>>> getAll();

  @POST('/playlists')
  Future<ApiResponse<PlaylistResponse>> create(
      @Body() PlaylistCreateRequest request);

  @GET('/playlists/{id}')
  Future<ApiResponse<PlaylistResponse>> getPlaylistById(@Path('id') String id);

  @PATCH('/playlists/{id}')
  Future<void> updatePlaylist(
      @Path('id') String id, @Body() UpdatePlaylistRequest request);

  @DELETE('/playlists/{id}')
  Future<void> deletePlaylist(@Path('id') String id);

  @POST('/playlists/{idPlaylist}/episodes/{idEpisode}')
  Future<void> addEpisode(@Path('idPlaylist') String idPlaylist,
      @Path('idEpisode') String idEpisode);

  @DELETE('/playlists/{idPlaylist}/episodes/{idEpisode}')
  Future<void> removeEpisode(@Path('idPlaylist') String idPlaylist,
      @Path('idEpisode') String idEpisode);

  @DELETE('/playlists/{id}/episodes')
  Future<void> removeAllEpisode(@Path('id') String id);
}
