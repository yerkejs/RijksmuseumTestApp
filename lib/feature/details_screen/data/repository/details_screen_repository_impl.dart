import 'package:yerke_test_app/feature/details_screen/data/datasource/details_screen_datasource.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/feature/details_screen/domain/repository/details_screen_repository.dart';

class DetailsScreenRepositoryImpl extends DetailsScreenRepository {
  
  /// MARK: - Props
  
  late final DetailsScreenDatasource _detailsScreenDatasource;

  /// MARK: - Constructor
  
  DetailsScreenRepositoryImpl({
    required DetailsScreenDatasource detailsScreenDatasource
  }) {
    _detailsScreenDatasource = detailsScreenDatasource;
  } 

  /// MARK: - Public 
  
  /// Gets art object's details from the remote datasource
  @override
  Future<Either<AppExceptions, ArtObjectDetailed>> getObjectDetails(String objectNumber) async {
    try {
      final response = await _detailsScreenDatasource.getObjectDetails(objectNumber);
      return Right(response);
    } on AppExceptions catch (e) {
      return Left(e);
    }
  }
}