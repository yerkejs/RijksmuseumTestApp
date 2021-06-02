import 'package:dartz/dartz.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';

/// Interface of the Details screen's main repository
abstract class DetailsScreenRepository {
  Future<Either<AppExceptions, ArtObjectDetailed>> getObjectDetails (String objectNumber);
}