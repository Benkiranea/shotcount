import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/steps_pages/bill_container/bill_container_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'step3_widget.dart' show Step3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Step3Model extends FlutterFlowModel<Step3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for BillContainer component.
  late BillContainerModel billContainerModel;

  @override
  void initState(BuildContext context) {
    billContainerModel = createModel(context, () => BillContainerModel());
  }

  @override
  void dispose() {
    billContainerModel.dispose();
  }
}
