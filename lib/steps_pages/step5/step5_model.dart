import '/flutter_flow/flutter_flow_util.dart';
import '/steps_pages/steps_container/steps_container_widget.dart';
import '/index.dart';
import 'step5_widget.dart' show Step5Widget;
import 'package:flutter/material.dart';

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
