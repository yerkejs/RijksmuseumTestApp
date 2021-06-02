part of 'main_cubit.dart';

class MainScreenState extends Equatable {
  final MainScreenStatus status;
  final List<ArtObject> artObjects;
  final bool hasReachedMax;

  const MainScreenState({
    this.status = const MainScreenStatus.success(),
    this.artObjects = const <ArtObject>[],
    this.hasReachedMax = false
  });  

  MainScreenState copyWith ({
    MainScreenStatus? status,
    List<ArtObject> ? artObjects,
    bool? hasReachedMax,
  }) {
    return MainScreenState(
      status: status ?? this.status,
      artObjects: artObjects ?? this.artObjects,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object?> get props => [
    status,
    artObjects,
    hasReachedMax
  ];
}