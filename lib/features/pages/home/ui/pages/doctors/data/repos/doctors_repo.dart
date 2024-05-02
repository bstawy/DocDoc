import '../../../../../../../../core/caching/hive_manager.dart';
import '../../../../../../../../core/config/Constants/app_constants.dart';
import '../../../../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../../../../core/networking/api_result/api_result.dart';
import '../../../../../../../../core/networking/api_service/api_service.dart';
import '../../../../../data/models/doctor_model.dart';

class DoctorsRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  DoctorsRepo(this._apiService, this._hiveManager);

  Future<ApiResult<List<DoctorModel>>> getAllDoctors() async {
    try {
      List<DoctorModel> doctors =
          _hiveManager.retrieveData<DoctorModel>(HiveBoxKeys.allDoctors);

      if (doctors.isNotEmpty) {
        return ApiResult.success(doctors);
      }

      final response = await _apiService.getAllDoctors();

      _hiveManager.cacheData(
        boxKey: HiveBoxKeys.allDoctors,
        dataList: response.doctors,
      );

      return ApiResult.success(response.doctors);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<DoctorModel>>> searchDoctor(String doctorName) async {
    try {
      final response = await _apiService.searchDoctor(doctorName);

      return ApiResult.success(response.doctors);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
