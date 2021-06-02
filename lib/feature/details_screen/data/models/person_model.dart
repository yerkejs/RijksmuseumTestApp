import 'package:yerke_test_app/feature/details_screen/domain/entities/person.dart';

/// Model of the [Person]
/// Converts json into the [Person] entity
/// also encodes entity into the json
class PersonModel extends Person {
  final String name;
  final List<String> occupations;
  final String? placeOfBirth;
  final String? dateOfBirth;
  final String? nationality;

  PersonModel({
    required this.name,
    this.placeOfBirth,
    this.dateOfBirth,
    this.occupations = const <String>[],
    this.nationality
  }) : super(
    name: name,
    dateOfBirth: dateOfBirth,
    occupations: occupations,
    nationality: nationality,
    placeOfBirth: placeOfBirth
  );

  factory PersonModel.fromJson (Map<String, dynamic> json) => PersonModel(
    name: json['name'],
    placeOfBirth: json['placeOfBirth'],
    nationality: json['nationality'],
    dateOfBirth: json['dateOfBirth'],
    occupations: (json['occupation'] as List).cast<String>()
  );

  Map<String, dynamic> toJson () => {
    'name': name,
    'placeOfBirth': placeOfBirth,
    'nationality': nationality,
    'occupations': occupations,
    'dateOfBirth': dateOfBirth?.toString() ?? null 
  };
}