import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreService {
  static void launchStore() {
    if (kIsWeb) {
      final appId = '1644035976';
      final url = Uri.parse("https://apps.apple.com/app/id$appId");
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
