import '../../../../../core/caching/hive_manager.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/appointment_model.dart';

class AppointmentsRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  AppointmentsRepo(this._apiService, this._hiveManager);

  Future<List<AppointmentModel>> getAppointments() async {
    try {
      final response = await _apiService.getAllAppointments();

      if (response.code == 200 && response.status) {
        _cacheAppointments(response.appointments);
        return response.appointments;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _cacheAppointments(List<AppointmentModel> appointments) async {
    _hiveManager.cacheData(
      boxKey: 'appointments',
      dataList: appointments,
    );
  }
}
