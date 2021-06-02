import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_screen_status.freezed.dart';

@freezed
abstract class DetailsScreenStatus with _$DetailsScreenStatus {
  const factory DetailsScreenStatus.failure([String? message]) = ErrorDetails;
  const factory DetailsScreenStatus.success() = Details;
  const factory DetailsScreenStatus.loading() = Loading;
}