import 'dart:io';

/// Checks whether user has reliable network connection 
/// Alternative of the [Connectivity] package, but that one is not stable
class InternetConnetionCheckerService {
  
  /// Identifier whether phone has internet connection right now 
  Future<bool> get hasConnection async {
    bool _hasConnection = false; 

    try {
      /// Gonna send request to the servers of google
      final list = await InternetAddress.lookup('google.com');
      
      if (list.isNotEmpty && list[0].rawAddress.isNotEmpty) {
        _hasConnection = true;
      }
    } on SocketException catch (_) {
      _hasConnection = false;
      return _hasConnection;
    }

    return _hasConnection;
  }

  /// Responsible for the change of the network connection status
  Stream<bool> get onStatusChange =>
    Stream.periodic(Duration(seconds: 10)).asyncMap<bool>((c) async {
      return await hasConnection;
    }).distinct();
}