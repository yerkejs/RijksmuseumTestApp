import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

class ArtLinksModel extends ArtLinks {
  final String? web;
  final String? self;
  final String? search;

  ArtLinksModel({
    this.web,
    this.self,
    this.search
  }) : super(
    web: web,
    self: self,
    search: search 
  );

  factory ArtLinksModel.fromJson (Map <String, dynamic> json) => ArtLinksModel(
    web: json['web'],
    self: json['self'],
    search: json['search']
  );
  
  Map<String, dynamic> toJson() => {
    if (web != null)
      'web': web,
    if (self != null)
      'self': self,
    if (search != null)
      'search': search 
  };
}