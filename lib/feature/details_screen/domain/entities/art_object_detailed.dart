import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_color.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/person.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

class ArtObjectDetailed extends Equatable {
  final ArtLinks links;
  final String objectNumber;
  final String title;
  final ArtImage? webImage;
  final List<ArtColor> colors;
  final String? description;
  final List<String> objectTypes;
  final List<String> objectCollection;
  final List<Person> principalMakers;
  final String? principalMaker;
  final List<String> materials;
  final List<String> historicalPersons;
  final String? subtitle;

  ArtObjectDetailed({
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
  });

  @override
  List<Object?> get props => [
    links,
    objectNumber,
    title,
    webImage,
    colors,
    description,
    objectTypes,
    objectCollection,
    principalMakers,
    principalMaker,
    materials,
    historicalPersons,
    subtitle
  ];
}