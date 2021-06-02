import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/core/constants/app_constants.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/fetchArtModels.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/params.dart';
import 'main_state_status.dart';

// ignore: unused_import
import '../../../../core/presentation/network_exceptions.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainScreenState> {
  
  // MARK: - Props

  late final FetchArtObjects _fetchArtObjects;

  // MARK: - Constructor

  MainCubit({
    required FetchArtObjects fetchArtObjects
  }) : super(
    const MainScreenState()
  ) {
    _fetchArtObjects = fetchArtObjects;
  }

  // MARK: - Public methods 

  Future<void> loadArtObjects () async {
    emit(state.copyWith(status: MainScreenStatus.loading()));
    final response = await _fetchArtObjects(FetchArtModelsInpuParams(
      currentPage: _nextPaginationPage
    ));

    response.fold(
      (failure) => emit(state.copyWith(
        status: MainScreenStatus.failure(failure.name)
      )), 
      (newArtObjects) => emit(state.copyWith(
        status: MainScreenStatus.success(),
        artObjects: List.of(state.artObjects)..addAll(newArtObjects),
        hasReachedMax: newArtObjects.length == 0
      ))
    );
  }

  // MARK: - Private

  /// Returns [9] if there is no artObject, otherwise we divide length of artObjects to the fixed number of items in one page.
  int get _nextPaginationPage => this.state.artObjects.length == 0 ? 
    1 : (this.state.artObjects.length / AppConstants.pageFixedLimit).round() + 1;
}