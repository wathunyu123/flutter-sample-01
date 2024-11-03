import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

class Version {
  Version._();
  static final Version instance = Version._();

  Future<String> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    return '$version.$buildNumber';
  }
}
