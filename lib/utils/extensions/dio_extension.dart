import 'package:dio/dio.dart';

extension HandleDioError on DioError {
  String get errorMessage => response?.data?["message"];
}
