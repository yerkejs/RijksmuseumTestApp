import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:yerke_test_app/core/services/internet_connection_checker.dart';

/// This interceptor is needed to retry sending request when some failures occured
class InternetErrorRetryInterceptor extends InterceptorsWrapper {
  
  final DioRetryRequestHandler _dioRetryRequestHandler;

  InternetErrorRetryInterceptor(this._dioRetryRequestHandler);

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try { 
        return await _dioRetryRequestHandler
          .scheduleRequestRetry(err)
          .then(
            (value) => handler.resolve(value),
            onError: (error) => handler.reject(error)
          );
      } catch (e) {
        return e;
      }
    } 

    return err;
  }

  /// Identitfies whether app should send request one more time 
  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other 
      && err.error != null 
      && err.error is SocketException;
  }
}

/// This class is responsible for sending request one more time 
/// when it's failed due to the specific issues (no internet connectino e.t.c)
/// [Dio] - instance of the dio package, 
/// [Connectivity] - package for listening to the internet connection changes
class DioRetryRequestHandler {
  final Dio dio;
  final InternetConnetionCheckerService internetChecker;

  DioRetryRequestHandler({
    required this.dio,
    required this.internetChecker,
  });

  /// Handles retrying to send request one more time 
  Future<Response> scheduleRequestRetry(DioError error, ) async {
    final requestOptions = error.requestOptions;
    
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = internetChecker.onStatusChange.listen(
      (bool hasInternetConnection) async {
        /// Internet connection status changed
        if (hasInternetConnection) {
          /// No need to listen so subscription anymore 
          streamSubscription.cancel();
          
          /// Taking [RequestOptions] of the failed request and retrying
          
          responseCompleter.complete(
            dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: requestOptions.toOptions()
            )
          );
        }
      },
    );

    return responseCompleter.future;
  }
}



/// [RequestOptions] Extension 
extension RequestOptionsExtensions on RequestOptions {
  /// Converts [RequestOptions] to [Options] class
  Options toOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}