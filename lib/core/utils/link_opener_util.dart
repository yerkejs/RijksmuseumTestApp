import 'package:url_launcher/url_launcher.dart';

abstract class LinkOpenerUtil {
  static Future<void> openLink (String url) async {
    if (await canLaunch(url)) {
      launch(url);
    }
  } 
}