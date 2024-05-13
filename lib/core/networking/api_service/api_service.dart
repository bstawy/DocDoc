import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/auth/login/data/models/login_request_body_model.dart';
import '../../../features/auth/login/data/models/login_response_model.dart';
import '../../../features/auth/register/data/models/register_request_body_model.dart';
import '../../../features/auth/register/data/models/register_response_model.dart';
import '../../../features/pages/appointment/data/models/appointments_response_model.dart';
import '../../../features/pages/home/data/models/all_doctors_response_model.dart';
import '../../../features/pages/home/data/models/doctor_speciality_response_model.dart';
import '../../../features/pages/profile/data/models/logout_response_model.dart';
import '../api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.registerEndPoint)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestBodyModel registerRequestBody,
  );

  @POST(EndPoints.loginEndPoint)
  Future<LoginResponseModel> login(
    @Body() LoginRequestBodyModel loginRequestBody,
  );

  @POST(EndPoints.logoutEndPoint)
  Future<LogoutResponseModel> logout();

  @GET(EndPoints.allSpecialitiesEndPoint)
  Future<DoctorSpecialityResponseModel> getAllSpecialities();

  @GET(EndPoints.doctorSpecialityEndPoint)
  Future<DoctorSpecialityResponseModel> getDoctorSpecialityData();

  @GET(EndPoints.allDoctorEndPoint)
  Future<AllDoctorsResponseModel> getAllDoctors();

  @GET(EndPoints.searchDoctorEndPoint)
  Future<AllDoctorsResponseModel> searchDoctor(
    @Query('name') String doctorName,
  );

  @GET(EndPoints.allAppointmentsEndPoint)
  Future<AppointmentsResponseModel> getAllAppointments();
}
