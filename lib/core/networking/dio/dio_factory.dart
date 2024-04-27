import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/dio/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      ],
    );
  }

  // static Dio? tokenDio;

  // static Dio getTokenDio() {
  //   Duration timeOut = const Duration(seconds: 30);

  //   if (tokenDio == null) {
  //     tokenDio = Dio();
  //     tokenDio!
  //       ..options.connectTimeout = timeOut
  //       ..options.receiveTimeout = timeOut;
  //     addTokenDioInterceptors();
  //     return tokenDio!;
  //   } else {
  //     return tokenDio!;
  //   }
  // }

  // static void addTokenDioInterceptors() {
  //   tokenDio?.interceptors.addAll(
  //     [
  //       PrettyDioLogger(
  //         requestBody: true,
  //         requestHeader: true,
  //         responseHeader: true,
  //       ),
  //       InterceptorsWrapper(
  //         onRequest: (options, handler) async {
  //           String? mytoken =
  //               await SecureStorage.getInstance().read(key: "mytoken");
  //           options.headers['Authorization'] = "Bearer${mytoken!}";
  //         },
  //         onError: (DioException e, handler) {
  //           log(e.message!);
  //         },
  //       ),
  //     ],
  //   );
  // }
}
