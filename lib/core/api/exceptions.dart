import 'dart:io';

import 'package:dio/dio.dart';

/// Exception Types

enum AppExceptions {
  requestCancelled,
  unauthorizedRequest,
  badRequest,
  notFound,
  methodNotAllowed,
  notAcceptable,
  requestTimeout,
  sendTimeout,
  conflict,
  internalServerError,
  notImplemented,
  serviceUnavailable,
  noInternetConnection,
  formatException,
  unableToProcess,
  defaultError,
  unexpectedError
}

/// API-layer exception for handling errors

extension AppExceptionsExtension on AppExceptions {
  
  /// Returns [AppExceptions] for the any error
  static AppExceptions getDioException(error) {
    if (error is Exception) {
      try {
        late AppExceptions appException;
        
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              appException = AppExceptions.requestCancelled;
              break;
            case DioErrorType.connectTimeout:
              appException = AppExceptions.requestTimeout;
              break;
            case DioErrorType.other:
              appException = AppExceptions.noInternetConnection;
              break;
            case DioErrorType.receiveTimeout:
              appException = AppExceptions.sendTimeout;
              break;
            case DioErrorType.response:
              appException = AppExceptionsExtension.handleResponse(
                error.response!.statusCode!
              );
              break;
            case DioErrorType.sendTimeout:
              appException = AppExceptions.sendTimeout;
              break;
          }
        } else if (error is SocketException) {
          appException = AppExceptions.noInternetConnection;
        } else {
          appException = AppExceptions.unexpectedError;
        }

        return appException;
      } on FormatException catch (_) {
        return AppExceptions.formatException;
      } catch (_) {
        return AppExceptions.unexpectedError;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return AppExceptions.unableToProcess;
      } else {
        return AppExceptions.unexpectedError;
      }
    }
  }

  /// Returns [AppExceptions] from the [int statusCode]
  static AppExceptions handleResponse(int statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return AppExceptions.unauthorizedRequest;
      case 404:
        return AppExceptions.notFound;
      case 409:
        return AppExceptions.conflict;
      case 408:
        return AppExceptions.requestTimeout;
      case 500:
        return AppExceptions.internalServerError;
      case 503:
        return AppExceptions.serviceUnavailable;
      default:
        return AppExceptions.defaultError;
    }
  }
}