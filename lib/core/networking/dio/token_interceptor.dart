import 'package:dio/dio.dart';

import '../../caching/secure_storage_factory.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String mytoken =
        await SecureStorage.getInstance().read(key: "mytoken") ?? "";
    if (mytoken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $mytoken";
    }
    super.onRequest(options, handler);
  }
}
