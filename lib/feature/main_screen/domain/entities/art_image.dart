import 'package:equatable/equatable.dart';

/// Contains main information about the art image 
class ArtImage extends Equatable {
  final String guid; 
  final num offsetPercentageX;
  final num offsetPercentageY;
  final num width;
  final num height;
  final String url;

  ArtImage({
    required this.guid,
    required this.offsetPercentageX,
    required this.offsetPercentageY,
    required this.width,
    required this.height,
    required this.url 
  });

  num get aspectRation => width / height;

  @override
  List<Object?> get props => [
    guid,
    offsetPercentageY,
    offsetPercentageX,
    width, 
    height, 
    url
  ];
}