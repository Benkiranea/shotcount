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
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

String timeToISO8601(
  String timeString,
  DateTime date,
) {
  final parts = timeString.trim().split(' ');
  if (parts.length != 2) return '';

  final timeParts = parts[0].split(':');
  if (timeParts.length != 2) return '';

  int hour = int.tryParse(timeParts[0]) ?? 0;
  final int minute = int.tryParse(timeParts[1]) ?? 0;
  final period = parts[1].toUpperCase();

  if (period == 'PM' && hour != 12) {
    hour += 12;
  }
  if (period == 'AM' && hour == 12) {
    hour = 0;
  }

  // Check if Eastern Time is currently in Daylight Saving Time (EDT: UTC-4) or Standard Time (EST: UTC-5)
  // US DST runs roughly from second Sunday in March to first Sunday in November
  final bool isDST = date.month > 3 && date.month < 11;
  final int nyUtcOffsetHours = isDST ? -4 : -5;

  // Construct DateTime representing New York local time
  final nyLocalTime = DateTime.utc(
    date.year,
    date.month,
    date.day,
    hour - nyUtcOffsetHours, // Convert to UTC
    minute,
  );

  return nyLocalTime.toIso8601String();
}
