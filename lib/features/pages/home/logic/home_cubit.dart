import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getHomeData() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getHomeData();

    response.when(
      success: (homeResponse) {
        debugPrint("Home Response: $homeResponse");
        emit(HomeState.success(homeResponse));
      },
      failure: (error) {
        debugPrint("Home Error: ${error.apiErrorModel.message}");

        emit(
          HomeState.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
