import 'package:dio/dio.dart';
import 'package:yerke_test_app/core/api/endpoint.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:yerke_test_app/feature/details_screen/data/models/art_object_detailed_model.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';

abstract class DetailsScreenDatasource {
  Future<ArtObjectDetailed> getObjectDetails (String objectNumber);
}

class DetailsScreenDatasourceImpl extends DetailsScreenDatasource {
  /// MARK: - Props
  
  late final Dio _dio;

  /// MARK: - Constuctor

  DetailsScreenDatasourceImpl(this._dio);

  /// MARK: - Public 
 
  /// Sends request to the server to retrieve details of the specific art object 
  /// (by its object number)
  @override
  Future<ArtObjectDetailed> getObjectDetails(String objectNumber) async {
    try {
      final result = await _dio.get(
        Endpoints.fetchArtObjectDetails.getPath([objectNumber]),
      );

      Map<String, dynamic> decodedJson = result.data;
      return ArtObjectDetailedModel.fromJson(decodedJson['artObject']);
    } catch (e) {
      throw AppExceptionsExtension.getDioException(e);
    }
  }
}