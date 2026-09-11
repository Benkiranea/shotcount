import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index_page/index_conatainer/index_conatainer_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'index_page_widget.dart' show IndexPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IndexPageModel extends FlutterFlowModel<IndexPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel1;
  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel2;
  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel3;
  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel4;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ProfilesRow>? userData;
  // Stores action output result for [Backend Call - API (chatUserTokenHubspot)] action in Image widget.
  ApiCallResponse? chatToken;

  @override
  void initState(BuildContext context) {
    indexConatainerModel1 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel2 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel3 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel4 = createModel(context, () => IndexConatainerModel());
  }

  @override
  void dispose() {
    indexConatainerModel1.dispose();
    indexConatainerModel2.dispose();
    indexConatainerModel3.dispose();
    indexConatainerModel4.dispose();
  }
}
