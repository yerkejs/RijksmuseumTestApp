import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yerke_test_app/feature/main_screen/data/datasource/main_screen_remote_datasource.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_object_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/repositories/main_screen_repository_impl.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'main_screen_repository_impl_test.mocks.dart';

@GenerateMocks([MainScreenRemoteDatasource])
void main () {
  late MainScreenRepositoryImpl mainScreenRepositoryImpl;
  late MockMainScreenRemoteDatasource mockMainScreenRemoteDatasource;
  
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
    mockMainScreenRemoteDatasource = MockMainScreenRemoteDatasource();
    mainScreenRepositoryImpl = MainScreenRepositoryImpl(mainScreenRemoteDatasource: mockMainScreenRemoteDatasource);
  });

  group ("fetchArtModels", () {
    test ("The call to the datasource is sent", () {
      // Arrange 
      when(mockMainScreenRemoteDatasource.fetchArtObjects())
        .thenAnswer((_) async => expectedResults); 

      // Act 
      mainScreenRepositoryImpl.fetchArtModels();
      
      // Assert 
      verify(
        mockMainScreenRemoteDatasource.fetchArtObjects()
      );
    });


    test ("The right data is retireved from the repository", () async {
      // Arrange 
      when(mockMainScreenRemoteDatasource.fetchArtObjects())
        .thenAnswer((_) async => expectedResults); 

      // Act 
      final result = await mainScreenRepositoryImpl.fetchArtModels();
      
      // Assert 

      expect(result.isRight(), true);
    });

    test ("The right model is retireved from the repository", () async {
      // Arrange 
      when(mockMainScreenRemoteDatasource.fetchArtObjects())
        .thenAnswer((_) async => expectedResults); 

      // Act 
      final result = await mainScreenRepositoryImpl.fetchArtModels();
      
      // Assert 

      expect(result.getOrElse(() => []), expectedResults);
    });
  });
}