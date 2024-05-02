import '../../../../../../../../core/caching/hive_manager.dart';
import '../../../../../../../../core/config/Constants/app_constants.dart';
import '../../../../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../../../../core/networking/api_result/api_result.dart';
import '../../../../../../../../core/networking/api_service/api_service.dart';
import '../../../../../data/models/doctor_speciality_model.dart';

class SpecialitiesRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  SpecialitiesRepo(this._apiService, this._hiveManager);

  Future<ApiResult<List<DoctorSpecialityModel>>> getAllSpecialities() async {
    try {
      List<DoctorSpecialityModel> cachedData = _hiveManager
          .retrieveData<DoctorSpecialityModel>(HiveBoxKeys.specialities);

      if (cachedData.isNotEmpty) {
        return ApiResult.success(cachedData);
      }

      final response = await _apiService.getAllSpecialities();

      _hiveManager.cacheData<DoctorSpecialityModel>(
        boxKey: HiveBoxKeys.specialities,
        dataList: response.homeData,
      );

      return ApiResult.success(response.homeData);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
