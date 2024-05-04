import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialities_states.freezed.dart';

@freezed
class SpecialitiesStates<T> with _$SpecialitiesStates<T> {
  const factory SpecialitiesStates.initial() = _Initial<T>;
  const factory SpecialitiesStates.loading() = Loading<T>;
  const factory SpecialitiesStates.success(T data) = Success<T>;
  const factory SpecialitiesStates.failure({required String error}) =
      Failure<T>;
}
