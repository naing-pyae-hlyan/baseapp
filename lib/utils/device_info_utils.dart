import '../lib_exp.dart';

class DeviceInfoUtils {
  static DeviceInfo? _deviceInfo;

  static Future<DeviceInfo> getDeviceInfo() async {
    if (_deviceInfo != null) return _deviceInfo!;

    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;

        _deviceInfo = DeviceInfo(
          udid: build.androidId ?? '',
          model: build.model ?? '',
          osPlatform: 'Android',
          osVersion: build.version.release ?? '',
        );
      } else if (Platform.isIOS) {
        IosDeviceInfo build = await deviceInfoPlugin.iosInfo;

        _deviceInfo = DeviceInfo(
          udid: build.identifierForVendor ?? '',
          model: build.name ?? '',
          osPlatform: 'iOS',
          osVersion: build.systemVersion ?? '',
        );
      }
    } catch (e) {
      _deviceInfo = DeviceInfo(
        udid: '',
        model: '',
        osPlatform: '',
        osVersion: '',
      );
    }

    return _deviceInfo!;
  }
}

class DeviceInfo {
  final String udid;
  final String model;
  final String osPlatform;
  final String osVersion;

  DeviceInfo({
    required this.udid,
    required this.model,
    required this.osPlatform,
    required this.osVersion,
  });
}
