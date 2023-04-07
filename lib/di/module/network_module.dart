import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/api_service.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/preferences_repository.dart';

@module
abstract class NetworkModule {
  @injectable
  ApiService get apiService {
    Dio dio = getIt<Dio>();
    PreferencesRepository preferencesRepo = getIt<PreferencesRepository>();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = await preferencesRepo.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers.addAll({'Authorization': 'Bearer $token'});
      }
    }));
    return ApiService(
      dio,
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  AuthService get authService {
    return AuthService(
      getIt<Dio>(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }
}
