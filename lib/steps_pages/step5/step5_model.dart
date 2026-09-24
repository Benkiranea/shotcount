import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/steps_pages/steps_container/steps_container_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'step5_widget.dart' show Step5Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Step5Model extends FlutterFlowModel<Step5Widget> {
  ///  Local state fields for this page.

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  // Model for StepsContainer component.
  late StepsContainerModel stepsContainerModel;

  @override
  void initState(BuildContext context) {
    stepsContainerModel = createModel(context, () => StepsContainerModel());
  }

  @override
  void dispose() {
    stepsContainerModel.dispose();
  }
}
