import 'package:dio/dio.dart';
import 'package:yerke_test_app/core/api/endpoint.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:yerke_test_app/core/constants/app_constants.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_object_model.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';

abstract class MainScreenRemoteDatasource {
  Future<List<ArtObject>> fetchArtObjects([int currentPage = 1]);
}

class MainScreenRemoteDatasourceImpl extends MainScreenRemoteDatasource {
  late final Dio _dio;

  MainScreenRemoteDatasourceImpl(Dio dio) {
    _dio = dio;
  }

  /// Returns Art objects from the API
  /// [int currentPage] - ia index of the page, starts from the 0
  @override
  Future<List<ArtObject>> fetchArtObjects([int currentPage = 1]) async {
    try {
      final result = await _dio.get(
        Endpoints.fetchArtObjects.getPath(),
        queryParameters: {
          'p': currentPage,
          'ps': AppConstants.pageFixedLimit
        }
      );

      Map<String, dynamic> decodedJson = result.data;
      List<ArtObject> artObjects = (decodedJson['artObjects'] as List)
          .map((e) => ArtObjectModel.fromJson(e))
          .toList();

      return artObjects;
    } catch (e) {
      throw AppExceptionsExtension.getDioException(e);
    }
  }
}