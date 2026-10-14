// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:gal/gal.dart';
import 'package:http/http.dart' as http;

Future<bool> saveImageToGallery(String imageUrl) async {
  // Add your function code here!
  //
  try {
    // Check photo gallery permissions
    final hasAccess = await Gal.hasAccess();
    if (!hasAccess) {
      final requestGranted = await Gal.requestAccess();
      if (!requestGranted) {
        return false;
      }
    }

    // Download the image bytes
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final Uint8List imageBytes = response.bodyBytes;

      // Save directly to device photo gallery
      await Gal.putImageBytes(imageBytes);
      return true;
    }
    return false;
  } catch (e) {
    print('Error saving image to gallery: $e');
    return false;
  }
}
