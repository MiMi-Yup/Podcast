import 'package:join_podcast/models/response/media/media_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'media_service.g.dart';

@RestApi()
abstract class MediaService {
  factory MediaService(Dio dio, {String baseUrl}) = _MediaService;

  @POST('/media/image/upload')
  @MultiPart()
  Future<ApiResponse<MediaResponse>> uploadImage(@Body() FormData file);

  @POST('/media/audo/upload')
  @MultiPart()
  Future<ApiResponse<MediaResponse>> uploadAudio(@Body() FormData file);
}
