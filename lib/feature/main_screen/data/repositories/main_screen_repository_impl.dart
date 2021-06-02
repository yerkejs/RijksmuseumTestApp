import 'package:yerke_test_app/feature/main_screen/data/datasource/main_screen_remote_datasource.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/feature/main_screen/domain/repository/main_screen_repository.dart';

class MainScreenRepositoryImpl extends MainScreenRepository {
  late final MainScreenRemoteDatasource _mainScreenRemoteDatasource;

  MainScreenRepositoryImpl({
    required MainScreenRemoteDatasource mainScreenRemoteDatasource
  }) {
    _mainScreenRemoteDatasource = mainScreenRemoteDatasource;
  }

  @override
  Future<Either<AppExceptions, List<ArtObject>>> fetchArtModels([int currentPage = 1]) async {
    try {
      final response = await _mainScreenRemoteDatasource.fetchArtObjects(currentPage);
      return Right(response);
    } on AppExceptions catch (e) {
      return Left(e);
    }
  }
}
