import 'dart:async';
import 'package:flutter/services.dart';

class FlutterAlertDemo {
  static const MethodChannel _channel =
      const MethodChannel('flutter_alert_demo');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
