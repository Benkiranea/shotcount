import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step2_widget.dart' show Step2Widget;
import 'package:flutter/material.dart';

class Step2Model extends FlutterFlowModel<Step2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    chatbotActionCardModel.dispose();
  }
}
