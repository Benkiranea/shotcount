import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

String encodeHtmlForWebView() {
  var htmlContent = '''
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
      body {
        margin: 0;
        padding: 0;
        background-color: transparent;
      }
</style>
</head>
<body>
<!-- Target container for TrustIndex to inject into -->
<div class="trustindex-widget" data-widget-id="48b82ff28d1242700d36aff6b69"></div>
 
    <!-- TrustIndex Script -->
<script defer async src="https://cdn.trustindex.io/loader.js?48b82ff28d1242700d36aff6b69"></script>
</body>
</html>
''';

  return Uri.dataFromString(
    htmlContent.trim(),
    mimeType: 'text/html',
    encoding: Encoding.getByName('utf-8'),
  ).toString();
}
