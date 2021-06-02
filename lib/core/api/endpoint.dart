enum Endpoints {
  fetchArtObjects,
  fetchArtObjectDetails
}

extension EndpointsExtension on Endpoints {
  String getPath ([List<String> params = const <String>[]]) {
    switch (this) {
      case Endpoints.fetchArtObjects:
        return "/api/nl/collection";
      case Endpoints.fetchArtObjectDetails:
        assert(params.length == 1, "Params should contain object number");
        return '/api/nl/collection/${params[0]}';
    }
  }
}