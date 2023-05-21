import 'package:dio/dio.dart';

extension HandleDioError on DioError {
  String get errorMessage {
    final message = response?.data?["message"];
    if (message is List) {
      return message.join(' - ');
    }
    return message;
  }
}

extension HandlerApiResponse on Response {
  bool get isSuccess => statusCode.toString().contains("2", 0) ? true : false;

  dynamic get serverData => data["data"];
}
