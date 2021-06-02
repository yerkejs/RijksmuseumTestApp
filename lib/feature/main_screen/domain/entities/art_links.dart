import 'package:equatable/equatable.dart';

/// Links of the art object to different websites
/// There are three types of them [web, self, search]
class ArtLinks extends Equatable {
  final String? web;
  final String? self;
  final String? search;

  ArtLinks({
    this.web,
    this.self,
    this.search
  });

  @override
  List<Object?> get props => [
    web,
    self,
    search
  ];
}