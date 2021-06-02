enum FixtureTypes {
  artImage, artObject, artLinks, artObjectsResponse
} 

extension FixtureTypesExtension on FixtureTypes {
  String get name {
    switch (this) {
      case FixtureTypes.artImage:
        return "art_image.json";
      case FixtureTypes.artObject:
        return "art_object.json";
      case FixtureTypes.artLinks:
        return 'art_links.json';
      case FixtureTypes.artObjectsResponse:
        return 'art_objects_response.json';
    }
  }
}