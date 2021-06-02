import 'package:equatable/equatable.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/art_color.dart';
import 'package:yerke_test_app/feature/details_screen/domain/entities/person.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

/// Entity of the detailed object 
class ArtObjectDetailed extends Equatable {
  /// Links to the specific websites
  final ArtLinks links;
  
  /// Specific id of the object 
  final String objectNumber;
  
  /// Titlte of the object 
  final String title;
  
  /// Image entity of the object 
  final ArtImage? webImage;
  
  /// Colors used in object 
  final List<ArtColor> colors;
  
  /// Description text of the object, can be null 
  final String? description;
  
  // Types of the objects 
  final List<String> objectTypes;
  
  /// Collections of the object 
  final List<String> objectCollection;
  
  /// Principal makers (People) 
  final List<Person> principalMakers;
  
  /// Main principal maker, can be null
  final String? principalMaker;
  
  /// Materials names used in object 
  final List<String> materials;

  /// Historical people connected with the object 
  final List<String> historicalPersons;

  /// Subtitle of the object [String]
  final String? subtitle;

  // MARK: - Constructor

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