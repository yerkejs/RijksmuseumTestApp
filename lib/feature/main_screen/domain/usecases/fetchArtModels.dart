import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/core/domain/usecase/usecase_base.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/feature/main_screen/domain/repository/main_screen_repository.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/params.dart';

class FetchArtObjects extends BaseUseCase<List<ArtObject>, FetchArtModelsInpuParams> {
  
  /// Main Repository, main source of the data for this usecase
  late final MainScreenRepository _mainScreenRepository;
  

  /// MARK: = Constructor
  FetchArtObjects({
    required MainScreenRepository mainScreenRepository
  }) {
    _mainScreenRepository = mainScreenRepository;
  }

  @override
  Future<Either<AppExceptions, List<ArtObject>>> call(FetchArtModelsInpuParams inputParams) {
    return _mainScreenRepository.fetchArtModels(inputParams.currentPage);
  }
}