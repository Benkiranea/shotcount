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

import 'package:shotcount/custom_code/HubSpotChat.dart';

Future identifyHubSpotUser(
  String userId,
  String deviceId,
  String email,
  String identityToken,
) async {
  // Add your function code here!
  await HubSpotChat.identifyUser(
    userId: userId,
    deviceId: deviceId,
    email: email,
    identityToken: identityToken,
  );
}
