import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:where_my_team/data/data_source/remote/api_service.dart';
import 'package:where_my_team/di/di.dart';

@module
abstract class NetworkModule {

  @injectable
  ApiService get apiService {
    return ApiService(
      getIt<Dio>(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }
}