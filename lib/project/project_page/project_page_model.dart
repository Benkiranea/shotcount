import '/backend/api_requests/api_calls.dart';
import '/components/app_header/app_header_widget.dart';
import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'project_page_widget.dart' show ProjectPageWidget;
import 'package:flutter/material.dart';

class ProjectPageModel extends FlutterFlowModel<ProjectPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (InstagramFeed)] action in ProjectPage widget.
  ApiCallResponse? apiResulteho;
  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
    chatbotActionCardModel.dispose();
  }
}
