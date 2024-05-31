import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/profile_user_data_model.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileUserDataModel>> getUserProfileData() async {
    try {
      final response = await _apiService.getUserProfileData();
      final userData = response.userData!.first;
      return ApiResult.success(userData);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
