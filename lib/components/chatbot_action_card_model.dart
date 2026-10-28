import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_action_card_widget.dart' show ChatbotActionCardWidget;
import 'package:flutter/material.dart';

class ChatbotActionCardModel extends FlutterFlowModel<ChatbotActionCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ProfilesRow>? userData;
  // Stores action output result for [Backend Call - API (chatUserTokenHubspot)] action in Image widget.
  ApiCallResponse? chatToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
