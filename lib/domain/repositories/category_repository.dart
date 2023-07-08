import 'dart:async';
import 'package:join_podcast/models/response/category/category_response.dart';
import 'package:join_podcast/models/response/list_response.dart';

abstract class CategoryRepository {
  FutureOr<ListResponse<CategoryResponse>?> getAll();
  FutureOr<bool?> create(String name);
}
