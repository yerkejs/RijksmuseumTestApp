import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:yerke_test_app/core/api/exceptions.dart';
import 'package:yerke_test_app/feature/main_screen/data/datasource/main_screen_remote_datasource.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_object_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../shared/test_config.dart';

final Map<String, dynamic> defaultQueryParams = { 
  'p': '1', 
  'ps': '10', 
};

void main () {
  late MainScreenRemoteDatasourceImpl mainScreenRemoteDatasourceImpl;
  late Dio dio;
  late DioAdapter dioAdapter;

  final expectedResponseModel = [
    ArtObjectModel(
      links: ArtLinksModel(
        self: 'http://www.rijksmuseum.nl/api/nl/collection/SK-C-5',
        web: 'http://www.rijksmuseum.nl/nl/collectie/SK-C-5'
      ),
      id: "nl-SK-C-5",
      objectNumber: 'SK-C-5',
      title: 'De Nachtwacht',
      hasImage: true,
      showImage: true,
      permitDownload: true,
      principalOrFirstMaker: "Rembrandt van Rijn",
      longTitle: 'De Nachtwacht, Rembrandt van Rijn, 1642',
      webImageModel: ArtImageModel(
        guid: "aa08df9c-0af9-4195-b31b-f578fbe0a4c9", 
        offsetPercentageX: 0, 
        offsetPercentageY: 1, 
        width: 2500, 
        height: 2034, 
        url: "https://lh3.googleusercontent.com/J-mxAE7CPu-DXIOx4QKBtb0GC4ud37da1QK7CzbTIDswmvZHXhLm4Tv2-1H3iBXJWAW_bHm7dMl3j5wv_XiWAg55VOM=s0"
      ),
      headerImageModel: ArtImageModel(
        guid: "29a2a516-f1d2-4713-9cbd-7a4458026057", 
        offsetPercentageX: 0, 
        offsetPercentageY: 0, 
        width: 1920, 
        height: 460, 
        url: "https://lh3.googleusercontent.com/O7ES8hCeygPDvHSob5Yl4bPIRGA58EoCM-ouQYN6CYBw5jlELVqk2tLkHF5C45JJj-5QBqF6cA6zUfS66PUhQamHAw=s0"
      ),
      productionPlaces: ['Amsterdam'],
    )
  ];


  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter();
    dio.httpClientAdapter = dioAdapter;
    mainScreenRemoteDatasourceImpl = MainScreenRemoteDatasourceImpl(dio);
  });

  group ("fetchArtObjects method", () {
    test("Correctly send model", () async {
      // Arrange
      
      dioAdapter..onGet(
        '/api/nl/collection', 
        (request) { 
          return request.reply(200, json.decode(fixture(FixtureTypes.artObjectsResponse.name)));
        },
        queryParameters: defaultQueryParams,
      );
      
      // Act 
      final result = await mainScreenRemoteDatasourceImpl.fetchArtObjects();

      // Assert 
      expect(result, expectedResponseModel);
    });


    test("Send Exception when there is an exception", () async {
      // Arrange
      
      dioAdapter..onGet(
        '/api/nl/collection', 
        (request) { 
          return request.reply(403, 'No access');
        },
        queryParameters: defaultQueryParams
      );
      
      // Act 
      final call = mainScreenRemoteDatasourceImpl.fetchArtObjects;
        
      // Assert 
      expect(() => call(), throwsA(isA<AppExceptions>()));
    });
  }); 
}