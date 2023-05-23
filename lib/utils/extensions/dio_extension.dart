import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

extension HandleDioError on DioError {
  String get errorMessage {
    final message = response?.data?["message"];
    if (message is List) {
      return message.join(' - ');
    } else if (message is Map) {
      return message.toString();
    } else if (message is String) {
      return message;
    }
    return 'Unhandled Dio Error';
  }
}

extension HandlerApiResponse on Response {
  bool get isSuccess => statusCode.toString().contains("2", 0) ? true : false;

  dynamic get serverData => data["data"];
}
