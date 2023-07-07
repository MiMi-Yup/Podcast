import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/models/request/podcasts/update_request.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'podcasts_service.g.dart';

@RestApi()
abstract class PodcastsService {
  factory PodcastsService(Dio dio, {String baseUrl}) = _PodcastsService;

  @GET('/podcasts/{id}')
  Future<ApiResponse<PodcastResponse>> getPodcastById(@Path('id') String id);

  @POST('/podcasts')
  Future<ApiResponse<PodcastResponse>> create(
      @Body() PodcastCreateRequest request);

  @PATCH('/podcasts/{id}')
  Future<ApiResponse<PodcastResponse>> updatePodcast(
      @Path('id') String id, @Body() UpdatePodcastRequest request);

  @GET('/podcasts/search')
  Future<ApiResponse<ListSeperateResponse<PodcastResponse>>> search(
      @Query('q') String query,
      @Query('offset') int? offset,
      @Query('limit') int? limit);
}
