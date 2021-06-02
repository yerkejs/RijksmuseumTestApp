/// Config file for all the server endpoints 
enum Endpoints {
  /// Endpoint for retriving list of the art objects from the backend
  fetchArtObjects,
  /// Endpoint for getting detailed information about one object by it's specific id
  fetchArtObjectDetails
}

extension EndpointsExtension on Endpoints {
  /// Returns path of the request 
  /// [List<String> params] - contains parameters which are used in path 
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