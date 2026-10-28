import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/steps_pages/bill_container/bill_container_widget.dart';
import '/index.dart';
import 'step3_widget.dart' show Step3Widget;
import 'package:flutter/material.dart';

class Step3Model extends FlutterFlowModel<Step3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for BillContainer component.
  late BillContainerModel billContainerModel;
  // Stores action output result for [Backend Call - Query Rows] action in BillContainer widget.
  List<ProfilesRow>? userData;
  // Stores action output result for [Backend Call - API (chatUserTokenHubspot)] action in BillContainer widget.
  ApiCallResponse? chatToken;
  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    billContainerModel = createModel(context, () => BillContainerModel());
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    billContainerModel.dispose();
    chatbotActionCardModel.dispose();
  }
}
