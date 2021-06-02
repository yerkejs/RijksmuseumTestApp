import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';

class ArtObjectModel extends ArtObject {
  final String id;
  final String objectNumber;
  final ArtLinksModel links;
  final String title;
  final bool hasImage;
  final bool permitDownload;
  final bool showImage;
  final String longTitle;
  final String principalOrFirstMaker;
  final List<String> productionPlaces;
  final ArtImageModel webImageModel;
  final ArtImageModel headerImageModel;

  ArtObjectModel({
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
    required this.webImageModel, 
    required this.headerImageModel  
  }) : super(
    id: id,
    objectNumber: objectNumber,
    links: links,
    title: title,
    hasImage: hasImage,
    showImage: showImage,
    permitDownload: permitDownload,
    longTitle: longTitle,
    principalOrFirstMaker: principalOrFirstMaker,
    productionPlaces: productionPlaces,
    headerImage: headerImageModel,
    webImage: webImageModel
  );

  factory ArtObjectModel.fromJson (Map<String, dynamic> json) {
    return ArtObjectModel(
      links: ArtLinksModel.fromJson(json['links']),
      title: json['title'],
      id: json['id'],
      objectNumber: json['objectNumber'],
      hasImage: json['hasImage'],
      showImage: json['showImage'],
      permitDownload: json['permitDownload'],
      longTitle: json['longTitle'],
      principalOrFirstMaker: json['principalOrFirstMaker'],
      webImageModel: ArtImageModel.fromJson(json['webImage']),
      headerImageModel: ArtImageModel.fromJson(json['headerImage']),
      productionPlaces: (json['productionPlaces'] as List).cast<String>()
    );
  }

  Map <String, dynamic> toJson () {
    return {
      'title': title,
      'links': links.toJson(),
      'productionPlaces': productionPlaces,
      'showImage': showImage,
      'permitDownload': permitDownload,
      'hasImage': hasImage,
      'id': id,
      'objectNumber': objectNumber,
      'headerImage': headerImageModel.toJson(),
      'webImage': webImageModel.toJson(),
      'principalOrFirstMaker': principalOrFirstMaker,
      'longTitle': longTitle
    };
  }
}