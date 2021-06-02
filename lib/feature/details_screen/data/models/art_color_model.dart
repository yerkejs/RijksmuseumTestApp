import 'package:yerke_test_app/feature/details_screen/domain/entities/art_color.dart';

/// Model of the [ArtColor]
/// Used to decode JSON and return [ArtColor] entity
/// also can encode hashable [ArtColor] to Map 
class ArtColorModel extends ArtColor {
  final num percentage;
  final String hex;

  // MARK: - Constructor
  ArtColorModel({
    required this.percentage,
    required this.hex 
  }) : super(
    colorHex: hex,
    percentage: percentage
  );


  factory ArtColorModel.fromJson (Map<String, dynamic> json) => ArtColorModel(
    percentage: json['percentage'],
    hex: json['hex']
  );

  Map<String, dynamic> toJson () => {
    'hex': hex,
    'percentage': percentage
  };
}