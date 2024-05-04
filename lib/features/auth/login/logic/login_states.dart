import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_states.freezed.dart';

@freezed
class LoginStates<T> with _$LoginStates<T> {
  const factory LoginStates.initial() = _Initial;
  const factory LoginStates.loading() = Loading;
  const factory LoginStates.success(T data) = Success<T>;
  const factory LoginStates.failure({required String error}) = Failure;
}
