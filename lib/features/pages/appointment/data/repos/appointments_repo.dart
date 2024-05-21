import '../../../../../core/caching/hive_manager.dart';
import '../../../../../core/config/Constants/app_constants.dart';
import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/appointment_model.dart';

class AppointmentsRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  AppointmentsRepo(this._apiService, this._hiveManager);

  Future<ApiResult<List<AppointmentModel>>> getAppointments() async {
    try {
      List<AppointmentModel> cachedAppointments = [];

      cachedAppointments = _hiveManager
          .retrieveData<AppointmentModel>(HiveBoxKeys.allAppointments);

      if (cachedAppointments.isNotEmpty) {
        return ApiResult.success(cachedAppointments);
      }

      final response = await _apiService.getAllAppointments();

      await _cacheAppointments(response.appointments);
      return ApiResult.success(response.appointments);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<void> _cacheAppointments(List<AppointmentModel> appointments) async {
    _hiveManager.cacheData<AppointmentModel>(
      boxKey: HiveBoxKeys.allAppointments,
      dataList: appointments,
    );
  }
}
