import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_screen_status.freezed.dart';

/// MARK: - Status Types of the Details Screen
@freezed
abstract class DetailsScreenStatus with _$DetailsScreenStatus {
  /// When any error happened
  const factory DetailsScreenStatus.failure([String? message]) = ErrorDetails;
  
  /// Normal state of the DetailsScreen, all the data is loaded and displayed
  const factory DetailsScreenStatus.success() = Details;
  
  /// Loading some data from the APIs.
  const factory DetailsScreenStatus.loading() = Loading;
}