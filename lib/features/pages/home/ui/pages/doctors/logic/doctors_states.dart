import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_states.freezed.dart';

@freezed
class DoctorsStates<T> with _$DoctorsStates<T> {
  const factory DoctorsStates.initial() = _Initial;
  const factory DoctorsStates.doctorsListLoading() = DoctorsListLoading;
  const factory DoctorsStates.doctorsListSuccess(T data) =
      DoctorsListSuccess<T>;
  const factory DoctorsStates.failure(String error) = _Failure;
}
