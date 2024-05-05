import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_states.freezed.dart';

@freezed
class SearchStates<T> with _$SearchStates<T> {
  const factory SearchStates.initial() = Initial;
  const factory SearchStates.searchListLoading() = SearchListLoading;
  const factory SearchStates.searchListSuccess(T data) = SearchListSuccess<T>;
  const factory SearchStates.failure(String error) = Failure;
}
