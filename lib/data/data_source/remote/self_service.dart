import 'package:join_podcast/models/request/playlists/add_episode_request.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/playlists/remove_episode_request.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../models/request/channel/create_channel_request.dart';

part 'self_service.g.dart';

@RestApi()
abstract class SelfService {
  factory SelfService(Dio dio, {String baseUrl}) = _SelfService;

  @POST('/user/self/channel')
  Future<void> createChannel(@Body() ChannelCreateRequest createChannel);

}
