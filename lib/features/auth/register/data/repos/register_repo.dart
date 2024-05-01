import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/register_request_body.dart';
import '../models/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      // TODO: handle error more efficiently
      // Error returned in UI is "Unprocessable Entity"
      /*
        DioExceptionType.badResponse
                {
                     message: "Unprocessable Entity",
                     data: {
                         email: [The email has already been taken.]
                    }
                     status: false,
                     code: 422
                }
      */
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
