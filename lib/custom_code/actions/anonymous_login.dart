// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<dynamic> anonymousLogin() async {
  final supabase = SupaFlow.client;

  try {
    final deviceInfo = DeviceInfoPlugin();

    String deviceId = '';
    String platform = 'unknown';
    String deviceModel = 'unknown';

    // ==========================================
    // 1. GET DEVICE ID
    // ==========================================

    if (!kIsWeb && Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;

      platform = 'android';
      deviceModel = androidInfo.model;
      deviceId = androidInfo.id;

      print('Android Device ID: $deviceId');
    } else if (!kIsWeb && Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;

      platform = 'ios';
      deviceModel = iosInfo.utsname.machine;
      deviceId = iosInfo.identifierForVendor ?? '';

      print('iOS Device ID: $deviceId');
    }

    // ==========================================
    // 2. CHECK EXISTING AUTH SESSION
    // ==========================================

    final existingUser = supabase.auth.currentUser;

    if (existingUser != null) {
      print('Existing Auth User: ${existingUser.id}');

      return {
        'user_id': existingUser.id,
        'device_id': deviceId,
        'platform': platform,
        'device_model': deviceModel,
        'is_new_user': false,
      };
    }

    // ==========================================
    // 3. CHECK EXISTING PROFILE BY DEVICE ID
    // ==========================================

    final existingProfile = await supabase
        .from('profiles')
        .select('id, device_id')
        .eq('device_id', deviceId)
        .maybeSingle();

    if (existingProfile != null) {
      print('Existing profile found: ${existingProfile['id']}');

      return {
        'user_id': existingProfile['id'],
        'device_id': deviceId,
        'platform': platform,
        'device_model': deviceModel,
        'is_new_user': false,
      };
    }

    // ==========================================
    // 4. CREATE NEW ANONYMOUS USER
    // ==========================================

    print('Creating new anonymous user...');

    final response = await supabase.auth.signInAnonymously();

    final user = response.user;

    if (user == null) {
      throw Exception('Anonymous login failed');
    }

    return {
      'user_id': user.id,
      'device_id': deviceId,
      'platform': platform,
      'device_model': deviceModel,
      'is_new_user': true,
    };
  } catch (e) {
    print('Anonymous login error: $e');
    rethrow;
  }
}
