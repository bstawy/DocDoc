import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialities_state.freezed.dart';

@freezed
class SpecialitiesState<T> with _$SpecialitiesState<T> {
  const factory SpecialitiesState.initial() = _Initial<T>;
  const factory SpecialitiesState.loading() = Loading<T>;
  const factory SpecialitiesState.success(T data) = Success<T>;
  const factory SpecialitiesState.failure({required String error}) = Failure<T>;
}
