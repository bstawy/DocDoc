import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/Constants/app_constants.dart';
import '../../home/ui/pages/doctors/data/repos/doctors_repo.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final HiveManager _hiveManager;
  final DoctorsRepo _doctorsRepo;

  SearchCubit(this._hiveManager, this._doctorsRepo)
      : super(const SearchStates.initial());

  List<String> searchHistory = [];

  void getInitialState() {
    emit(const SearchStates.initial());
  }

  void getSearchHistory() {
    searchHistory =
        _hiveManager.retrieveData<String>(HiveBoxKeys.searchHistory);
  }

  void clearAllSearchHistory() {
    emit(const SearchStates.searchListLoading());
    _hiveManager.clearData<String>(HiveBoxKeys.searchHistory);
    getSearchHistory();
    emit(const SearchStates.initial());
  }

  void clearHistoryItem(int itemIndex) {
    emit(const SearchStates.searchListLoading());
    _hiveManager.clearItem<String>(
        boxKey: HiveBoxKeys.searchHistory, index: itemIndex);
    getSearchHistory();
    emit(const SearchStates.initial());
  }

  void search(String doctorName) async {
    emit(const SearchStates.searchListLoading());
    _hiveManager.cacheData(
        boxKey: HiveBoxKeys.searchHistory, dataItem: doctorName);

    final result = await _doctorsRepo.searchDoctor(doctorName);

    result.when(
      success: (data) {
        emit(SearchStates.searchListSuccess(data));
      },
      failure: (error) {
        emit(SearchStates.failure(
            error.apiErrorModel.message ?? "Error Occurred"));
      },
    );
  }
}
