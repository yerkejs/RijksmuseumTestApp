import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/core/domain/usecase/usecase_base.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';
import 'package:yerke_test_app/feature/details_screen/domain/repository/details_screen_repository.dart';
import 'package:yerke_test_app/feature/details_screen/domain/usecase/params.dart';

/// UseCase which returns detailed information about the art object (by it's object id)
/// Input parameter is [GetArtObjectDetailsInput]
/// Ouput is [ArtObjectDetailed]
class GetArtObjectDetails extends BaseUseCase<ArtObjectDetailed, GetArtObjectDetailsInput> {
  
  /// MARK: - Props
  
  final DetailsScreenRepository _detailsScreenRepository;

  /// MARK: - Constructor
  
  GetArtObjectDetails(this._detailsScreenRepository);

  @override
  Future<Either<AppExceptions, ArtObjectDetailed>> call(GetArtObjectDetailsInput input) {
    return _detailsScreenRepository.getObjectDetails(input.objectNumber);
  }
}


