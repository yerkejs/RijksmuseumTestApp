import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';

class ArtImageModel extends ArtImage {
  final String guid; 
  final num offsetPercentageX;
  final num offsetPercentageY;
  final num width;
  final num height;
  final String url;
  
  ArtImageModel({
    required this.guid,
    required this.offsetPercentageX,
    required this.offsetPercentageY,
    required this.width,
    required this.height,
    required this.url 
  }) : super(
    guid: guid,
    offsetPercentageX: offsetPercentageX,
    offsetPercentageY: offsetPercentageY,
    width: width,
    height: height,
    url: url
  );

  factory ArtImageModel.fromJson (Map<String, dynamic> json) {
    return ArtImageModel(
      guid: json["guid"],
      offsetPercentageX: json["offsetPercentageX"],
      offsetPercentageY: json["offsetPercentageY"],
      width: json["width"],
      height: json["height"],
      url: json["url"]
    );
  }

  Map<String, dynamic> toJson () => {
    "guid": guid,
    "offsetPercentageX": offsetPercentageX,
    "offsetPercentageY": offsetPercentageY,
    "width": width,
    "height": height,
    "url": url,
  };
}