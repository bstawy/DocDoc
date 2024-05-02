import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';

@freezed
class DoctorsState<T> with _$DoctorsState<T> {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.doctorsListLoading() = DoctorsListLoading;
  const factory DoctorsState.doctorsListSuccess(T data) = DoctorsListSuccess<T>;
  const factory DoctorsState.failure(String error) = _Failure;
}
