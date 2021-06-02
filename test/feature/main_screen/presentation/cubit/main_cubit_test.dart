import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_image_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_links_model.dart';
import 'package:yerke_test_app/feature/main_screen/data/models/art_object_model.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/fetchArtModels.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/cubit/main_cubit.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/cubit/main_state_status.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'main_cubit_test.mocks.dart';




@GenerateMocks([FetchArtObjects])
void main () {
  late MainCubit mainCubit;
  late MockFetchArtObjects mockFetchArtObjects;

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
    mockFetchArtObjects = MockFetchArtObjects();
    mainCubit = MainCubit(fetchArtObjects: mockFetchArtObjects);
  });

  test("Check initial state of the main cubit", () {
    expect(mainCubit.state, equals(MainScreenState(
      status: MainScreenStatus.success(),
      artObjects: [],
      hasReachedMax: false 
    )));
  });

  group ("Fetch art objects method", () {
    blocTest<MainCubit, MainScreenState>(
      'Should emit success status', 
      build: () {
        /// Arrange
        mockito.when(mockFetchArtObjects.call(mockito.any))
          .thenAnswer((_) async =>  Right(expectedResults));
        return mainCubit;
      },
      act: (cubit) => cubit.loadArtObjects(),
      expect: () => <MainScreenState>[
        MainScreenState(
          status: MainScreenStatus.loading()
        ),
        MainScreenState(
          status: MainScreenStatus.success(),
          artObjects: expectedResults
        )
      ]
    );

    blocTest<MainCubit, MainScreenState>(
      'Should correctly paginate', 
      build: () {
        /// Arrange
        mainCubit.emit(mainCubit.state.copyWith(
          artObjects: expectedResults
        ));
        mockito.when(mockFetchArtObjects.call(mockito.any))
          .thenAnswer((_) async =>  Right(expectedResults));
        return mainCubit;
      },
      act: (cubit) => cubit.loadArtObjects(),
      skip: 1,
      expect: () => <MainScreenState>[
        MainScreenState(
          status: MainScreenStatus.success(),
          artObjects: List.of(expectedResults)..addAll(expectedResults)
        )
      ]
    );

    blocTest<MainCubit, MainScreenState>(
      'Check pagination successfully finished', 
      build: () {
        /// Arrange
        
        mainCubit.emit(mainCubit.state.copyWith(
          artObjects: expectedResults
        ));

        /// We send empty array [] as the pagination finished (no more results)
        mockito.when(mockFetchArtObjects.call(mockito.any))
          .thenAnswer((_) async => Right([]));
        return mainCubit;
      },
      act: (cubit) => cubit.loadArtObjects(),
      skip: 1,
      expect: () => <MainScreenState>[
        MainScreenState(
          status: MainScreenStatus.success(),
          artObjects: expectedResults,
          hasReachedMax: true
        )
      ]
    );
  });
}