import 'package:flutter/foundation.dart';

import '../../../../../core/networking/api_error/api_error_handler.dart';
import '../../../../../core/networking/api_result/api_result.dart';
import '../../../../../core/networking/api_service/api_service.dart';
import '../models/home_response_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<HomeData>>> getHomeData() async {
    try {
      final response = await _apiService.getHomeData();
      debugPrint("Home Cubit: ${response.homeData}");
      return ApiResult.success(response.homeData);
    } catch (error) {
      debugPrint("Home Cubit: ${error.toString()}");

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
