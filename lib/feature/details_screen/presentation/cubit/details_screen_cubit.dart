import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';
import 'package:yerke_test_app/feature/details_screen/domain/usecase/get_art_object_details.dart';
import 'package:yerke_test_app/feature/details_screen/domain/usecase/params.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/cubit/details_screen_status.dart';

// ignore: unused_import
import '../../../../core/presentation/network_exceptions.dart';
part 'details_screen_state.dart';

class DetailsScreenCubit extends Cubit<DetailsScreenState> {
  
  // MARK: - Props
  
  final GetArtObjectDetails _getArtObjectDetails;

  // MARK: - Construcotr
  
  DetailsScreenCubit(this._getArtObjectDetails) 
    : super(DetailsScreenState());

  // MAKR: - Public 

  Future<void> loadArtObjectDetails (String objectNumber) async {
    /// Show Loading Widget in the UI
    emit(state.copyWith(status: DetailsScreenStatus.loading()));

    /// Get response from the usecase 
    final response = await _getArtObjectDetails.call(GetArtObjectDetailsInput(
      objectNumber
    ));

    /// Handle response (Show error or art objects details)
    response.fold(
      (failure) => emit(state.copyWith(
        status: DetailsScreenStatus.failure(failure.name)
      )), 
      (ArtObjectDetailed artObjectDetailed) {
        return emit(state.copyWith(
          status: DetailsScreenStatus.success(),
          artObjectDetailed: artObjectDetailed
        ));
      }
    );
  }
}