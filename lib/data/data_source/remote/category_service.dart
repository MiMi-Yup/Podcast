import 'package:join_podcast/models/request/category/create_request.dart';
import 'package:join_podcast/models/response/api_response.dart';
import 'package:join_podcast/models/response/category/category_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'category_service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET('/categories')
  Future<ApiResponse<List<CategoryResponse>>> getAll();

  @POST('/categories')
  Future<ApiResponse<CategoryResponse>> create(
      @Body() CategoryCreateRequest request);
}
