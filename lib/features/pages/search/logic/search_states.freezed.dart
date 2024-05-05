// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchStates<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchListLoading,
    required TResult Function(T data) searchListSuccess,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchListLoading,
    TResult? Function(T data)? searchListSuccess,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchListLoading,
    TResult Function(T data)? searchListSuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(SearchListLoading<T> value) searchListLoading,
    required TResult Function(SearchListSuccess<T> value) searchListSuccess,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(SearchListLoading<T> value)? searchListLoading,
    TResult? Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult? Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(SearchListLoading<T> value)? searchListLoading,
    TResult Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStatesCopyWith<T, $Res> {
  factory $SearchStatesCopyWith(
          SearchStates<T> value, $Res Function(SearchStates<T>) then) =
      _$SearchStatesCopyWithImpl<T, $Res, SearchStates<T>>;
}

/// @nodoc
class _$SearchStatesCopyWithImpl<T, $Res, $Val extends SearchStates<T>>
    implements $SearchStatesCopyWith<T, $Res> {
  _$SearchStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$SearchStatesCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchStates<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchListLoading,
    required TResult Function(T data) searchListSuccess,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchListLoading,
    TResult? Function(T data)? searchListSuccess,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchListLoading,
    TResult Function(T data)? searchListSuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(SearchListLoading<T> value) searchListLoading,
    required TResult Function(SearchListSuccess<T> value) searchListSuccess,
    required TResult Function(Failure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(SearchListLoading<T> value)? searchListLoading,
    TResult? Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(SearchListLoading<T> value)? searchListLoading,
    TResult Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements SearchStates<T> {
  const factory Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SearchListLoadingImplCopyWith<T, $Res> {
  factory _$$SearchListLoadingImplCopyWith(_$SearchListLoadingImpl<T> value,
          $Res Function(_$SearchListLoadingImpl<T>) then) =
      __$$SearchListLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SearchListLoadingImplCopyWithImpl<T, $Res>
    extends _$SearchStatesCopyWithImpl<T, $Res, _$SearchListLoadingImpl<T>>
    implements _$$SearchListLoadingImplCopyWith<T, $Res> {
  __$$SearchListLoadingImplCopyWithImpl(_$SearchListLoadingImpl<T> _value,
      $Res Function(_$SearchListLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchListLoadingImpl<T> implements SearchListLoading<T> {
  const _$SearchListLoadingImpl();

  @override
  String toString() {
    return 'SearchStates<$T>.searchListLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchListLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchListLoading,
    required TResult Function(T data) searchListSuccess,
    required TResult Function(String error) failure,
  }) {
    return searchListLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchListLoading,
    TResult? Function(T data)? searchListSuccess,
    TResult? Function(String error)? failure,
  }) {
    return searchListLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchListLoading,
    TResult Function(T data)? searchListSuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (searchListLoading != null) {
      return searchListLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(SearchListLoading<T> value) searchListLoading,
    required TResult Function(SearchListSuccess<T> value) searchListSuccess,
    required TResult Function(Failure<T> value) failure,
  }) {
    return searchListLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(SearchListLoading<T> value)? searchListLoading,
    TResult? Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return searchListLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(SearchListLoading<T> value)? searchListLoading,
    TResult Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (searchListLoading != null) {
      return searchListLoading(this);
    }
    return orElse();
  }
}

abstract class SearchListLoading<T> implements SearchStates<T> {
  const factory SearchListLoading() = _$SearchListLoadingImpl<T>;
}

/// @nodoc
abstract class _$$SearchListSuccessImplCopyWith<T, $Res> {
  factory _$$SearchListSuccessImplCopyWith(_$SearchListSuccessImpl<T> value,
          $Res Function(_$SearchListSuccessImpl<T>) then) =
      __$$SearchListSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SearchListSuccessImplCopyWithImpl<T, $Res>
    extends _$SearchStatesCopyWithImpl<T, $Res, _$SearchListSuccessImpl<T>>
    implements _$$SearchListSuccessImplCopyWith<T, $Res> {
  __$$SearchListSuccessImplCopyWithImpl(_$SearchListSuccessImpl<T> _value,
      $Res Function(_$SearchListSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SearchListSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SearchListSuccessImpl<T> implements SearchListSuccess<T> {
  const _$SearchListSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SearchStates<$T>.searchListSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchListSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchListSuccessImplCopyWith<T, _$SearchListSuccessImpl<T>>
      get copyWith =>
          __$$SearchListSuccessImplCopyWithImpl<T, _$SearchListSuccessImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchListLoading,
    required TResult Function(T data) searchListSuccess,
    required TResult Function(String error) failure,
  }) {
    return searchListSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchListLoading,
    TResult? Function(T data)? searchListSuccess,
    TResult? Function(String error)? failure,
  }) {
    return searchListSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchListLoading,
    TResult Function(T data)? searchListSuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (searchListSuccess != null) {
      return searchListSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(SearchListLoading<T> value) searchListLoading,
    required TResult Function(SearchListSuccess<T> value) searchListSuccess,
    required TResult Function(Failure<T> value) failure,
  }) {
    return searchListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(SearchListLoading<T> value)? searchListLoading,
    TResult? Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return searchListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(SearchListLoading<T> value)? searchListLoading,
    TResult Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (searchListSuccess != null) {
      return searchListSuccess(this);
    }
    return orElse();
  }
}

abstract class SearchListSuccess<T> implements SearchStates<T> {
  const factory SearchListSuccess(final T data) = _$SearchListSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SearchListSuccessImplCopyWith<T, _$SearchListSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$SearchStatesCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> implements Failure<T> {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SearchStates<$T>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchListLoading,
    required TResult Function(T data) searchListSuccess,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchListLoading,
    TResult? Function(T data)? searchListSuccess,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchListLoading,
    TResult Function(T data)? searchListSuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(SearchListLoading<T> value) searchListLoading,
    required TResult Function(SearchListSuccess<T> value) searchListSuccess,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(SearchListLoading<T> value)? searchListLoading,
    TResult? Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(SearchListLoading<T> value)? searchListLoading,
    TResult Function(SearchListSuccess<T> value)? searchListSuccess,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements SearchStates<T> {
  const factory Failure(final String error) = _$FailureImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
