import 'package:equatable/equatable.dart';

/// Entity, holds information about the colors of the art objects
class ArtColor extends Equatable {
  final num percentage;
  final String colorHex;

  ArtColor({
    required this.percentage,
    required this.colorHex 
  });

  @override
  List<Object?> get props => [
    percentage,
    colorHex 
  ];
}