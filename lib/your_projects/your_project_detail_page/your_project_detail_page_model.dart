import '/components/app_header/app_header_widget.dart';
import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/your_projects/your_detail_card/your_detail_card_widget.dart';
import '/index.dart';
import 'your_project_detail_page_widget.dart' show YourProjectDetailPageWidget;
import 'package:flutter/material.dart';

class YourProjectDetailPageModel
    extends FlutterFlowModel<YourProjectDetailPageWidget> {
  ///  Local state fields for this page.

  int? currentStep = 1;

  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // Model for YourDetailCard component.
  late YourDetailCardModel yourDetailCardModel;
  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
    yourDetailCardModel = createModel(context, () => YourDetailCardModel());
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
    yourDetailCardModel.dispose();
    chatbotActionCardModel.dispose();
  }
}
