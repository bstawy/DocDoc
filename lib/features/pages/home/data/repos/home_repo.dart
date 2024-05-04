import '../../../../../core/caching/hive_manager.dart';
import '../../../../../core/config/Constants/app_constants.dart';
import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/doctor_model.dart';
import '../models/doctor_speciality_model.dart';

class HomeRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  HomeRepo(this._apiService, this._hiveManager);

  Future<ApiResult<List<DoctorSpecialityModel>>>
      getDoctorSpecialityData() async {
    try {
      final response = await _apiService.getDoctorSpecialityData();

      return ApiResult.success(response.homeData);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<DoctorModel>>> getAllDoctorsData() async {
    try {
      List<DoctorModel> cachedData =
          _hiveManager.retrieveData<DoctorModel>(HiveBoxKeys.allDoctors);

      if (cachedData.isNotEmpty) {
        return ApiResult.success(cachedData);
      }

      final response = await _apiService.getAllDoctors();

      _hiveManager.cacheData<DoctorModel>(
        boxKey: HiveBoxKeys.allDoctors,
        dataList: response.doctors,
      );

      return ApiResult.success(response.doctors);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
