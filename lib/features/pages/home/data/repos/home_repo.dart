import 'package:flutter/material.dart';

import '../../../../../core/caching/hive_manager.dart';
import '../../../../../core/config/Constants/app_constants.dart';
import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/doctor_speciality_model.dart';

class HomeRepo {
  final ApiService _apiService;
  final HiveManager _hiveManager;

  HomeRepo(this._apiService, this._hiveManager);

  Future<ApiResult<List<DoctorSpecialityModel>>> getHomeData() async {
    try {
      List<DoctorSpecialityModel> cachedData = _hiveManager
          .retrieveData<DoctorSpecialityModel>(HiveBoxKeys.homeData);

      if (cachedData.isNotEmpty && cachedData.length == 10) {
        debugPrint("Home data retrieved from cache");
        return ApiResult.success(cachedData);
      }

      final response = await _apiService.getHomeData();

      _hiveManager.cacheData<DoctorSpecialityModel>(
        boxKey: HiveBoxKeys.homeData,
        dataList: response.homeData,
      );
      debugPrint("Home data retrieved from api");

      return ApiResult.success(response.homeData);
    } catch (error) {
      debugPrint("Error Home data retrieved");

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
