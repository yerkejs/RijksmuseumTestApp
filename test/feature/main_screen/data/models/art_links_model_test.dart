import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../shared/test_config.dart';

void main () {
  final ArtLinksModel artLinksModel = ArtLinksModel(
    self: 'http://www.rijksmuseum.nl/api/nl/collection/SK-C-5',
    web: 'http://www.rijksmuseum.nl/nl/collectie/SK-C-5'
  );


  /// Check whether [ArtLinksModel] is the subclass of the [ArtLinks]
  test(
    'should be a subclass of [ArtObject] entity',
    () async {
      // assert
      expect(artLinksModel, isA<ArtLinks>());
    },
  );

  test("[ArtLinksModel.fromJson] factory correctly decodes JSON file", () {
    // Arrange 
    final Map<String, dynamic> jsonObject = json.decode(fixture(FixtureTypes.artLinks.name));

    // Act 
    final result = ArtLinksModel.fromJson(jsonObject);

    // Assert 
    expect(result, equals(artLinksModel));
  });

  test("[toJson] method correctly converts model to the JSON", () {
    // Arrange 
    final Map<String, dynamic> jsonObject = json.decode(fixture(FixtureTypes.artLinks.name));

    // Act 
    final result = artLinksModel.toJson();

    // Assert 
    expect(result, equals(jsonObject));
  });
}