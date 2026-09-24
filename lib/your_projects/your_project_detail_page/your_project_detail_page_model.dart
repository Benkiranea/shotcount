import '/backend/api_requests/api_calls.dart';
import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/your_projects/project_detail_card/project_detail_card_widget.dart';
import '/your_projects/your_detail_card/your_detail_card_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'your_project_detail_page_widget.dart' show YourProjectDetailPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YourProjectDetailPageModel
    extends FlutterFlowModel<YourProjectDetailPageWidget> {
  ///  Local state fields for this page.

  int? currentStep = 1;

  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // Model for YourDetailCard component.
  late YourDetailCardModel yourDetailCardModel;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
    yourDetailCardModel = createModel(context, () => YourDetailCardModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
    yourDetailCardModel.dispose();
  }
}
