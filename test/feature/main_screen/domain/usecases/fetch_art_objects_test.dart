
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_object_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/repositories/main_screen_repository_impl.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/fetchArtModels.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/params.dart';

import 'fetch_art_objects_test.mocks.dart';

@GenerateMocks([MainScreenRepositoryImpl])
void main () {
  late FetchArtObjects fetchArtObjects;
  late MockMainScreenRepositoryImpl repositoryImpl;

  final List<ArtObject> expectedResults = [
    ArtObjectModel(
      links: ArtLinksModel(
        self: 'http://www.rijksmuseum.nl/api/nl/collection/SK-C-5',
        web: 'http://www.rijksmuseum.nl/nl/collectie/SK-C-5'
      ),
      id: "nl-SK-C-5",
      objectNumber: 'SK-C-5',
      title: 'De Nachtwacht',
      hasImage: true,
      showImage: true,
      permitDownload: true,
      principalOrFirstMaker: "Rembrandt van Rijn",
      longTitle: 'De Nachtwacht, Rembrandt van Rijn, 1642',
      webImageModel: ArtImageModel(
        guid: "aa08df9c-0af9-4195-b31b-f578fbe0a4c9", 
        offsetPercentageX: 0, 
        offsetPercentageY: 1, 
        width: 2500, 
        height: 2034, 
        url: "https://lh3.googleusercontent.com/J-mxAE7CPu-DXIOx4QKBtb0GC4ud37da1QK7CzbTIDswmvZHXhLm4Tv2-1H3iBXJWAW_bHm7dMl3j5wv_XiWAg55VOM=s0"
      ),
      headerImageModel: ArtImageModel(
        guid: "29a2a516-f1d2-4713-9cbd-7a4458026057", 
        offsetPercentageX: 0, 
        offsetPercentageY: 0, 
        width: 1920, 
        height: 460, 
        url: "https://lh3.googleusercontent.com/O7ES8hCeygPDvHSob5Yl4bPIRGA58EoCM-ouQYN6CYBw5jlELVqk2tLkHF5C45JJj-5QBqF6cA6zUfS66PUhQamHAw=s0"
      ),
      productionPlaces: ['Amsterdam'],
    )
  ];


  setUp(() {
    repositoryImpl = MockMainScreenRepositoryImpl();
    fetchArtObjects = FetchArtObjects(mainScreenRepository: repositoryImpl);
  });

  test ("Should return list of art object entities from the repository", () async {
    // Arrange 
    when(repositoryImpl.fetchArtModels(any))
      .thenAnswer((_) async => Right(expectedResults));
    
    // Act 
    final result = await fetchArtObjects.call(FetchArtModelsInpuParams());

    // Assert 
    
    expect(result, Right(expectedResults));
    verify(repositoryImpl.fetchArtModels());
  });
}