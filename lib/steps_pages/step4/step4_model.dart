import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/steps_pages/time_slot/time_slot_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'step4_widget.dart' show Step4Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Step4Model extends FlutterFlowModel<Step4Widget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  List<String> timeSlots = [];
  void addToTimeSlots(String item) => timeSlots.add(item);
  void removeFromTimeSlots(String item) => timeSlots.remove(item);
  void removeAtIndexFromTimeSlots(int index) => timeSlots.removeAt(index);
  void insertAtIndexInTimeSlots(int index, String item) =>
      timeSlots.insert(index, item);
  void updateTimeSlotsAtIndex(int index, Function(String) updateFn) =>
      timeSlots[index] = updateFn(timeSlots[index]);

  String? selectedTime;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
