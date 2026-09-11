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

List<String> generateTimeSlots(DateTime selectedDate) {
  final now = DateTime.now();

  const int openingHour = 0;
  const int closingHour = 23;

  final bool isToday = selectedDate.year == now.year &&
      selectedDate.month == now.month &&
      selectedDate.day == now.day;

  int startHour = openingHour;

  // If today, start from the next full hour
  if (isToday) {
    startHour = now.hour + 1;

    // If current time is before opening hour
    if (startHour < openingHour) {
      startHour = openingHour;
    }
  }

  List<String> slots = [];

  for (int hour = startHour; hour <= closingHour; hour++) {
    String period = hour >= 12 ? 'PM' : 'AM';

    int displayHour = hour % 12;

    if (displayHour == 0) {
      displayHour = 12;
    }

    String formattedHour = displayHour.toString().padLeft(2, '0');

    slots.add('$formattedHour:00 $period');
  }

  return slots;
}
