import 'package:yerke_test_app/feature/details_screen/data/models/art_color_model.dart';
import 'package:yerke_test_app/feature/details_screen/data/models/person_model.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_object_detailed.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';

/// Model of the [ArtObjectDetailed] entity  
/// decodes JSON and returns [ArtObjectDetailed] via factory 
/// also encodes [ArtObjectDetailed] into JSON
class ArtObjectDetailedModel extends ArtObjectDetailed {
  final ArtLinksModel links;
  final String objectNumber;
  final String title;
  final ArtImageModel? webImage;
  final List<ArtColorModel> colors;
  final String? description;
  final List<String> objectTypes;
  final List<String> objectCollection;
  final List<PersonModel> principalMakers;
  final String? principalMaker;
  final List<String> materials;
  final List<String> historicalPersons;
  final String? subtitle;

  ArtObjectDetailedModel({
    required this.links,
    required this.objectNumber,
    required this.title,
    required this.colors,
    required this.objectTypes,
    required this.objectCollection,
    required this.principalMakers,
    required this.historicalPersons,
    required this.materials,
    this.principalMaker,
    this.webImage,
    this.description,
    this.subtitle
  }) : super(
    links: links,
    objectNumber: objectNumber,
    title: title,
    webImage: webImage,
    colors: colors,
    description: description,
    objectTypes: objectTypes,
    objectCollection: objectCollection,
    principalMakers: principalMakers,
    principalMaker: principalMaker,
    materials: materials,
    historicalPersons: historicalPersons,
    subtitle: subtitle
  );

  factory ArtObjectDetailedModel.fromJson (Map<String, dynamic> json) {
    List<ArtColorModel> decodedColors = (json['colors'] as List)
      .map((e) => ArtColorModel.fromJson(e))
      .toList();
    List<PersonModel> decodedMakers = (json['principalMakers'] as List)
      .map((e) => PersonModel.fromJson(e))
      .toList();

    return ArtObjectDetailedModel(
      title: json['title'],
      links: ArtLinksModel.fromJson(json['links']),
      objectNumber: json['objectNumber'],
      webImage: json['webImage'] != null ? ArtImageModel.fromJson(json['webImage']) : null,
      description: json['description'],
      objectTypes: ((json['objectTypes'] ?? []) as List).cast<String>(),
      objectCollection: ((json['objectCollection'] ?? []) as List).cast<String>(),
      colors: decodedColors,    
      principalMakers: decodedMakers,   
      principalMaker: json['principalMaker'],
      materials: ((json['materials'] ?? []) as List).cast<String>(),
      historicalPersons: ((json['historicalPersons'] ?? []) as List).cast<String>(),
      subtitle: json['longTitle']
    );
  }

  Map<String, dynamic> toJson () {
    return {
      'title': title,
      'links': links.toJson(),
      'objectNumber': objectNumber,
      'webImage': webImage?.toJson() ?? null,
      'description': description,
      'objectTypes': objectTypes,
      'objectCollection': objectCollection,
      'colors': colors.map((e) => e.toJson()).toList(),
      'principalMakers': principalMakers.map((e) => e.toJson()).toList(),
      'principalMaker': principalMaker,
      'materials': materials,
      'historicalPersons': historicalPersons
    };
  }
}