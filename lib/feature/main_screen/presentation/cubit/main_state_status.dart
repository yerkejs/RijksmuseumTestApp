import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state_status.freezed.dart';

@freezed
abstract class MainScreenStatus with _$MainScreenStatus {
  const factory MainScreenStatus.failure([String? message]) = ErrorDetails;
  const factory MainScreenStatus.success() = Data;
  const factory MainScreenStatus.loading () = Loading;
}