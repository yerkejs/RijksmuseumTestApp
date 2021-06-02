import 'package:yerke_test_app/core/api/exceptions.dart';

/// Presentation extension of the app exceptions
extension AppExceptionsUIExtension on AppExceptions {
  /// Gives title to each type of the [AppExceptions]
  String get name {
    switch (this) {
      case AppExceptions.notImplemented:
        return "Not Implemented";
      case AppExceptions.requestCancelled:
        return "Request Cancelled";
      case AppExceptions.internalServerError:
        return "Internal Server Error";
      case AppExceptions.notFound: 
        return "Not Found";
      case AppExceptions.serviceUnavailable:
        return "Service unavailable";
      case AppExceptions.methodNotAllowed:
        return "Method Allowed";
      case AppExceptions.badRequest:
        return "Bad request";
      case AppExceptions.unauthorizedRequest:
        return "Unauthorized request";
      case AppExceptions.unexpectedError:
        return "Unexpected error occurred";
      case AppExceptions.requestTimeout:
        return "Connection request timeout";
      case AppExceptions.noInternetConnection:
        return "No internet connection";
      case AppExceptions.conflict:
        return "Error due to a conflict";
      case AppExceptions.sendTimeout:
        return "Send timeout in connection with API server";
      case AppExceptions.unableToProcess:
        return "Unable to process the data";
      case AppExceptions.defaultError:
        return "Undefined error";
      case AppExceptions.formatException:
        return "Unexpected error occurred";
      case AppExceptions.notAcceptable:
        return "Not acceptable";
      default:
        return "";
    }
  }
}