import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout_states.freezed.dart';

@freezed
class LayoutStates<T> with _$LayoutStates<T> {
  const factory LayoutStates.initial() = _Initial;
  const factory LayoutStates.success(T data) = Success<T>;
}
