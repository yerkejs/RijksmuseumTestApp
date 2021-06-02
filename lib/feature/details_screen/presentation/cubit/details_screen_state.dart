part of 'details_screen_cubit.dart';

class DetailsScreenState extends Equatable {
  
  /// MARK: - Props
  
  final DetailsScreenStatus status;
  final ArtObjectDetailed? artObjectDetailed;

  // MARK: - Constructor
  
  DetailsScreenState({
    this.status = const DetailsScreenStatus.loading(),
    this.artObjectDetailed
  });
  
  // MARK: - Public 

  DetailsScreenState copyWith ({
    DetailsScreenStatus? status,
    ArtObjectDetailed? artObjectDetailed
  }) => DetailsScreenState(
    status: status ?? this.status,
    artObjectDetailed: artObjectDetailed ?? this.artObjectDetailed
  );

  @override
  List<Object?> get props => [
    status,
    artObjectDetailed
  ];
}