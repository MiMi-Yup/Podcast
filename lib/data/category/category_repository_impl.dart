import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/category_service.dart';
import 'package:join_podcast/domain/repositories/category_repository.dart';
import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/request/category/create_request.dart';
import 'package:join_podcast/models/response/category/category_response.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.service});

  final CategoryService? service;

  @override
  FutureOr<bool?> create(String name) {
    return service
        ?.create(CategoryCreateRequest(name: name))
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<ListResponse<CategoryResponse>?> getAll() {
    return service?.getAll().then((value) => value.data).catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }
}
