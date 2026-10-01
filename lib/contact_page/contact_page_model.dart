import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_page_widget.dart' show ContactPageWidget;
import 'package:flutter/material.dart';

class ContactPageModel extends FlutterFlowModel<ContactPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ProfilesRow>? userData1;
  // Stores action output result for [Backend Call - API (chatUserTokenHubspot)] action in Container widget.
  ApiCallResponse? chatToken;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
  }
}
