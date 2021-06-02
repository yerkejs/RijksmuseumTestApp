import 'package:dio/dio.dart';
import 'package:yerke_test_app/core/constants/app_constants.dart';

/// Interceptor used to automatically add ApiKey to every request
class ApiKeyInterceptor extends InterceptorsWrapper {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'key': AppConstants.apiKey
    });
    
    super.onRequest(options, handler);
  }
}