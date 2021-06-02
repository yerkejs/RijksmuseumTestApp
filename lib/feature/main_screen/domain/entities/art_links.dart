import 'package:equatable/equatable.dart';

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