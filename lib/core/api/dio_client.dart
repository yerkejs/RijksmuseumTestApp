import 'package:dio/dio.dart';

abstract class DioClient {
  /// Static method which creates instance of the [DIO]
  /// [baseUrl] -  main base url of the api endpoints
  /// [interceptors] = Interceptors of the [dio] package 
  static Dio createDIO ({
    required String baseUrl,
    required List<Interceptor> Function(Dio) getInterceptors
  }) {
    final _dio = Dio();

    /// Set up dio configuration
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout  = Duration.millisecondsPerMinute
      ..options.receiveTimeout = Duration.millisecondsPerMinute
      ..httpClientAdapter
      ..interceptors.addAll(getInterceptors(_dio));

    return _dio;
  }
}