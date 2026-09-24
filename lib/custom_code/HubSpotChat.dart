import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class HubSpotChat {
  static const MethodChannel _channel = MethodChannel('hubspot_chat');

  static Future<void> initialize() async {
    try {
      await _channel.invokeMethod('initialize');
    } on PlatformException catch (e) {
      debugPrint(
        'HubSpot initialization failed: '
        '${e.code} - ${e.message}',
      );

      rethrow;
    }
  }

  static Future<void> identifyUser({
    required String userId,
    required String deviceId,
    required String email,
    required String identityToken,
  }) async {
    await _channel.invokeMethod(
      'setChatProperties',
      {
        'userId': userId,
        'deviceId': deviceId,
      },
    );

    await _channel.invokeMethod(
      'setUserIdentity',
      {
        'email': email,
        'identityToken': identityToken,
      },
    );
  }

  static Future<void> openChat() async {
    try {
      await _channel.invokeMethod('openChat');
    } on PlatformException catch (e) {
      debugPrint(
        'HubSpot chat failed: '
        '${e.code} - ${e.message}',
      );

      rethrow;
    }
  }

  static Future<void> logout() async {
    await _channel.invokeMethod('logout');
  }
}
