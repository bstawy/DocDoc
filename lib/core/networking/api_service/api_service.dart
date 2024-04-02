import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/login/data/models/login_request_body.dart';
import '../../../features/login/data/models/login_response.dart';
import '../api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.loginEndPoint)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
