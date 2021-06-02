// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'details_screen_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DetailsScreenStatusTearOff {
  const _$DetailsScreenStatusTearOff();

  ErrorDetails failure([String? message]) {
    return ErrorDetails(
      message,
    );
  }

  Details success() {
    return const Details();
  }

  Loading loading() {
    return const Loading();
  }
}

/// @nodoc
const $DetailsScreenStatus = _$DetailsScreenStatusTearOff();

/// @nodoc
mixin _$DetailsScreenStatus {
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
    required TResult Function(Details value) success,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Details value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsScreenStatusCopyWith<$Res> {
  factory $DetailsScreenStatusCopyWith(
          DetailsScreenStatus value, $Res Function(DetailsScreenStatus) then) =
      _$DetailsScreenStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsScreenStatusCopyWithImpl<$Res>
    implements $DetailsScreenStatusCopyWith<$Res> {
  _$DetailsScreenStatusCopyWithImpl(this._value, this._then);

  final DetailsScreenStatus _value;
  // ignore: unused_field
  final $Res Function(DetailsScreenStatus) _then;
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
    extends _$DetailsScreenStatusCopyWithImpl<$Res>
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
    return 'DetailsScreenStatus.failure(message: $message)';
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
    required TResult Function(Details value) success,
    required TResult Function(Loading value) loading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Details value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements DetailsScreenStatus {
  const factory ErrorDetails([String? message]) = _$ErrorDetails;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsCopyWith<$Res> {
  factory $DetailsCopyWith(Details value, $Res Function(Details) then) =
      _$DetailsCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsCopyWithImpl<$Res>
    extends _$DetailsScreenStatusCopyWithImpl<$Res>
    implements $DetailsCopyWith<$Res> {
  _$DetailsCopyWithImpl(Details _value, $Res Function(Details) _then)
      : super(_value, (v) => _then(v as Details));

  @override
  Details get _value => super._value as Details;
}

/// @nodoc

class _$Details implements Details {
  const _$Details();

  @override
  String toString() {
    return 'DetailsScreenStatus.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Details);
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
    required TResult Function(Details value) success,
    required TResult Function(Loading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Details value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Details implements DetailsScreenStatus {
  const factory Details() = _$Details;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$DetailsScreenStatusCopyWithImpl<$Res>
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
    return 'DetailsScreenStatus.loading()';
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
    required TResult Function(Details value) success,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetails value)? failure,
    TResult Function(Details value)? success,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements DetailsScreenStatus {
  const factory Loading() = _$Loading;
}
