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
}