// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'main_state_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainScreenStatusTearOff {
  const _$MainScreenStatusTearOff();

  ErrorDetails failure([String? message]) {
    return ErrorDetails(
      message,
    );
  }

  Data success() {
    return const Data();
  }

  Loading loading() {
    return const Loading();
  }
}

/// @nodoc
const $MainScreenStatus = _$MainScreenStatusTearOff();

/// @nodoc
mixin _$MainScreenStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) failure,
    required TResult Function() success,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? failure,
    TResult Function()? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) failure,
    required TResult Function(Data value) success,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Data value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStatusCopyWith<$Res> {
  factory $MainScreenStatusCopyWith(
          MainScreenStatus value, $Res Function(MainScreenStatus) then) =
      _$MainScreenStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainScreenStatusCopyWithImpl<$Res>
    implements $MainScreenStatusCopyWith<$Res> {
  _$MainScreenStatusCopyWithImpl(this._value, this._then);

  final MainScreenStatus _value;
  // ignore: unused_field
  final $Res Function(MainScreenStatus) _then;
}

/// @nodoc
abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$MainScreenStatusCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ErrorDetails(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorDetails implements ErrorDetails {
  const _$ErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'MainScreenStatus.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) failure,
    required TResult Function() success,
    required TResult Function() loading,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? failure,
    TResult Function()? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) failure,
    required TResult Function(Data value) success,
    required TResult Function(Loading value) loading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Data value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements MainScreenStatus {
  const factory ErrorDetails([String? message]) = _$ErrorDetails;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$MainScreenStatusCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;
}

/// @nodoc

class _$Data implements Data {
  const _$Data();

  @override
  String toString() {
    return 'MainScreenStatus.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Data);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) failure,
    required TResult Function() success,
    required TResult Function() loading,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? failure,
    TResult Function()? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) failure,
    required TResult Function(Data value) success,
    required TResult Function(Loading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Data value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Data implements MainScreenStatus {
  const factory Data() = _$Data;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$MainScreenStatusCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'MainScreenStatus.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) failure,
    required TResult Function() success,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? failure,
    TResult Function()? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetails value) failure,
    required TResult Function(Data value) success,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Data value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements MainScreenStatus {
  const factory Loading() = _$Loading;
}
