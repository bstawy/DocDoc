import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_states.freezed.dart';

@freezed
class RegisterStates<T> with _$RegisterStates<T> {
  const factory RegisterStates.initial() = _Initial;
  const factory RegisterStates.loading() = Loading;
  const factory RegisterStates.success(T data) = Success<T>;
  const factory RegisterStates.failure({required String error}) = Failure;
}
