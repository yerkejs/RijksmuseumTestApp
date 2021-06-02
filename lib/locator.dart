import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yerke_test_app/core/api/dio_client.dart';
import 'package:yerke_test_app/core/constants/app_constants.dart';
import 'package:yerke_test_app/core/services/internet_connection_checker.dart';
import 'package:yerke_test_app/feature/details_screen/data/datasource/details_screen_datasource.dart';
import 'package:yerke_test_app/feature/details_screen/data/repository/details_screen_repository_impl.dart';
import 'package:yerke_test_app/feature/details_screen/domain/repository/details_screen_repository.dart';
import 'package:yerke_test_app/feature/details_screen/domain/usecase/get_art_object_details.dart';
import 'package:yerke_test_app/feature/details_screen/presentation/cubit/details_screen_cubit.dart';
import 'package:yerke_test_app/feature/main_screen/data/datasource/main_screen_remote_datasource.dart';
import 'package:yerke_test_app/feature/main_screen/data/repositories/main_screen_repository_impl.dart';
import 'package:yerke_test_app/feature/main_screen/domain/repository/main_screen_repository.dart';
import 'package:yerke_test_app/feature/main_screen/domain/usecases/fetchArtModels.dart';
import 'package:yerke_test_app/feature/main_screen/presentation/cubit/main_cubit.dart';

import 'core/api/interceptors/api_key_interceptor.dart';
import 'core/api/interceptors/internet_error_interceptor.dart';

/// Service locator's instance
final sl = GetIt.instance;

Future<void> init() async { 

  // Cubit 

  sl.registerFactory(() => MainCubit(fetchArtObjects: sl()));
  sl.registerFactory(() => DetailsScreenCubit(sl()));

  // Usecase layers 

  sl.registerLazySingleton(
    () => FetchArtObjects(mainScreenRepository: sl())
  );

  sl.registerLazySingleton(
    () => GetArtObjectDetails(sl())
  );

  // Repository layers 

  sl.registerLazySingleton<MainScreenRepository>(
    () => MainScreenRepositoryImpl(mainScreenRemoteDatasource: sl())
  );

  sl.registerLazySingleton<DetailsScreenRepository>(
    () => DetailsScreenRepositoryImpl(detailsScreenDatasource: sl())
  );

  // Datasource layers 
  
  sl.registerLazySingleton<MainScreenRemoteDatasource>(
    () => MainScreenRemoteDatasourceImpl(sl())
  );

  sl.registerLazySingleton<DetailsScreenDatasource>(
    () => DetailsScreenDatasourceImpl(sl())
  );

  // Dio 
  sl.registerLazySingleton(
    () => DioClient.createDIO(
      baseUrl: AppConstants.baseUrl, 
      getInterceptors: (Dio dio) {
        return [
          ApiKeyInterceptor(),
          InternetErrorRetryInterceptor(
            DioRetryRequestHandler(
              dio: dio, 
              internetChecker: InternetConnetionCheckerService()
            )
          ),
          LogInterceptor()
        ];
      },
    )
  );
}
