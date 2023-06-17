import 'package:join_podcast/models/request/episode/create_request.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'episode_service.g.dart';

@RestApi()
abstract class EpisodeService {
  factory EpisodeService(Dio dio, {String baseUrl}) = _EpisodeService;

  @POST('/episodes')
  Future<ApiResponse<EpisodeResponse>> create(
      @Body() EpisodeCreateRequest request);

  @GET('/episodes/{ID}')
  Future<ApiResponse<EpisodeResponse>> getEpisodeById(@Path('id') String id);
}
