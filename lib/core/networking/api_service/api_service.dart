import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/auth/login/data/models/login_request_body.dart';
import '../../../features/auth/login/data/models/login_response.dart';
import '../../../features/auth/register/data/models/register_request_body.dart';
import '../../../features/auth/register/data/models/register_response.dart';
import '../../../features/pages/home/data/models/all_doctors_response_model.dart';
import '../../../features/pages/home/data/models/doctor_speciality_response_model.dart';
import '../api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.loginEndPoint)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(EndPoints.registerEndPoint)
  Future<RegisterResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

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
}
