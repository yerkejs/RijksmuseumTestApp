import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';

abstract class MainScreenRepository {
  Future<Either<AppExceptions, List<ArtObject>>> fetchArtModels(
      [int currentPage]);
}
