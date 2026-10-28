import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'step4_widget.dart' show Step4Widget;
import 'package:flutter/material.dart';

class Step4Model extends FlutterFlowModel<Step4Widget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  String? selectedTime;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProfilesRow>? profileData;
  // Stores action output result for [Backend Call - API (CalendlyBookMeeting)] action in Button widget.
  ApiCallResponse? calendlyBooking;
  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    chatbotActionCardModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
