import 'package:url_launcher/url_launcher.dart';

/// Utility which is responsible for opening links of websites
/// Uses built in default browser
abstract class LinkOpenerUtil {
  static Future<void> openLink (String url) async {
    if (await canLaunch(url)) {
      launch(url);
    }
  } 
}