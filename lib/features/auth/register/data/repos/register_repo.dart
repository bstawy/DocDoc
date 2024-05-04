import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/register_request_body_model.dart';
import '../models/register_response_model.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponseModel>> register(
      RegisterRequestBodyModel registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
