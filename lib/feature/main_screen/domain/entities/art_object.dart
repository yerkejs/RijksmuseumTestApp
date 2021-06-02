import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

class ArtObject extends Equatable {
  final String id;
  final String objectNumber;
  final ArtLinks links;
  final String title;
  final bool hasImage;
  final bool permitDownload;
  final bool showImage;
  final String longTitle;
  final String principalOrFirstMaker;
  final List<String> productionPlaces;
  final ArtImage webImage;
  final ArtImage headerImage;

  ArtObject({
    required this.id, 
    required this.objectNumber, 
    required this.links, 
    required this.title, 
    required this.hasImage, 
    required this.permitDownload, 
    required this.showImage, 
    required this.longTitle, 
    required this.principalOrFirstMaker, 
    required this.productionPlaces, 
    required this.webImage, 
    required this.headerImage  
  });

  @override
  List<Object?> get props => [
    id,
    objectNumber,
    links,
    title,
    hasImage,
    permitDownload,
    showImage,
    longTitle,
    principalOrFirstMaker,
    productionPlaces,
    webImage,
    headerImage
  ];
}
