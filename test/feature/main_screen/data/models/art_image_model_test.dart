import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../shared/test_config.dart';

void main () {
  final ArtImageModel artImageModel = ArtImageModel(
    guid: "aa08df9c-0af9-4195-b31b-f578fbe0a4c9", 
    offsetPercentageX: 0, 
    offsetPercentageY: 1, 
    width: 2500, 
    height: 2034, 
    url: "https://lh3.googleusercontent.com/J-mxAE7CPu-DXIOx4QKBtb0GC4ud37da1QK7CzbTIDswmvZHXhLm4Tv2-1H3iBXJWAW_bHm7dMl3j5wv_XiWAg55VOM=s0"
  );


  /// Check whether [ArtImageModel] is the subclass of the [ArtImage]
  test(
    'should be a subclass of [ArtImage] entity',
    () async {
      // assert
      expect(artImageModel, isA<ArtImage>());
    },
  );


  test("[ArtImageModel.fromJson] factory correctly decodes JSON file", () {
    // Arrange 
    final Map<String, dynamic> jsonObject = json.decode(fixture(FixtureTypes.artImage.name));

    // Act 
    final result = ArtImageModel.fromJson(jsonObject);

    // Assert 
    expect(result, equals(artImageModel));
  });

  test("[toJson] method correctly converts model to the JSON", () {
    // Arrange 
    final Map<String, dynamic> jsonObject = json.decode(fixture(FixtureTypes.artImage.name));

    // Act 
    final result = artImageModel.toJson();

    // Assert 
    expect(result, equals(jsonObject));
  });
}