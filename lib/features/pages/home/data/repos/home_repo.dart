import 'package:flutter/material.dart';

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
      List<DoctorSpecialityModel> cachedData = _hiveManager
          .retrieveData<DoctorSpecialityModel>(HiveBoxKeys.doctorSpeciality);

      if (cachedData.isNotEmpty && cachedData.length == 10) {
        debugPrint("Specialist data retrieved from cache");
        return ApiResult.success(cachedData);
      }

      final response = await _apiService.getDoctorSpecialityData();

      _hiveManager.cacheData<DoctorSpecialityModel>(
        boxKey: HiveBoxKeys.doctorSpeciality,
        dataList: response.homeData,
      );
      debugPrint("Specialist data retrieved from api");

      return ApiResult.success(response.homeData);
    } catch (error) {
      debugPrint("Error Specialist data retrieved");

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<DoctorModel>>> getAllDoctorsData() async {
    try {
      List<DoctorModel> cachedData =
          _hiveManager.retrieveData<DoctorModel>(HiveBoxKeys.allDoctors);

      if (cachedData.isNotEmpty) {
        debugPrint("Doctors data retrieved from cache");
        return ApiResult.success(cachedData);
      }

      final response = await _apiService.getAllDoctors();

      _hiveManager.cacheData<DoctorModel>(
        boxKey: HiveBoxKeys.allDoctors,
        dataList: response.doctors,
      );
      debugPrint("Doctors data retrieved from api");

      return ApiResult.success(response.doctors);
    } catch (error) {
      debugPrint("Error Doctors data retrieved");

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
