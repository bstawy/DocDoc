import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/appointment_model.dart';

class AppointmentsRepo {
  final ApiService _apiService;

  AppointmentsRepo(this._apiService);

  Future<ApiResult<List<AppointmentModel>>> getAppointments() async {
    try {
      final response = await _apiService.getAllAppointments();
      return ApiResult.success(response.appointments);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
