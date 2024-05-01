import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout_state.freezed.dart';

@freezed
class LayoutState<T> with _$LayoutState<T> {
  const factory LayoutState.initial() = _Initial;
  const factory LayoutState.success(T data) = Success<T>;
}
