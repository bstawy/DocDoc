import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'token_interceptor.dart';

class DioFactory {
  // Create Singletone
  DioFactory._();

  static Dio? freeDio;

  static Dio getFreeDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (freeDio == null) {
      freeDio = Dio();
      freeDio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addFreeDioInterceptors();
      return freeDio!;
    } else {
      return freeDio!;
    }
  }

  static void addFreeDioInterceptors() {
    freeDio?.interceptors.addAll(
      [
        TokenInterceptor(),
        !kReleaseMode
            ? PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseHeader: true,
              )
            : const Interceptor(),
      ],
    );
  }
}
