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

String timeToISO8601(
  String timeString,
  DateTime date,
) {
  final parts = timeString.trim().split(' ');

  if (parts.length != 2) {
    return '';
  }

  final timeParts = parts[0].split(':');

  if (timeParts.length != 2) {
    return '';
  }

  int hour = int.tryParse(timeParts[0]) ?? 0;
  final int minute = int.tryParse(timeParts[1]) ?? 0;

  final period = parts[1].toUpperCase();

  if (period == 'PM' && hour != 12) {
    hour += 12;
  }

  if (period == 'AM' && hour == 12) {
    hour = 0;
  }

  final result = DateTime(
    date.year,
    date.month,
    date.day,
    hour,
    minute,
  );

  final offset = result.timeZoneOffset;

  final sign = offset.isNegative ? '-' : '+';
  final offsetHours = offset.inHours.abs().toString().padLeft(2, '0');
  final offsetMinutes =
      (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');

  return '${result.toIso8601String().split('.').first}'
      '$sign$offsetHours:$offsetMinutes';
}
