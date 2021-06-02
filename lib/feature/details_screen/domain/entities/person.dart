import 'package:equatable/equatable.dart';

/// Entity of the person
class Person extends Equatable {
  final String name;
  final List<String> occupations;
  final String? placeOfBirth;
  final String? dateOfBirth;
  final String? nationality;

  Person({
    required this.name,
    this.placeOfBirth,
    this.dateOfBirth,
    this.occupations = const <String>[],
    this.nationality
  });

  @override
  List<Object?> get props => [
    name,
    occupations,
    placeOfBirth,
    dateOfBirth,
    nationality
  ];
}