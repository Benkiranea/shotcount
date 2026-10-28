import '/components/chatbot_action_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index_page/index_conatainer/index_conatainer_widget.dart';
import '/index.dart';
import 'index_page_widget.dart' show IndexPageWidget;
import 'package:flutter/material.dart';

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
  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel5;
  // Model for ChatbotActionCard component.
  late ChatbotActionCardModel chatbotActionCardModel;

  @override
  void initState(BuildContext context) {
    indexConatainerModel1 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel2 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel3 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel4 = createModel(context, () => IndexConatainerModel());
    indexConatainerModel5 = createModel(context, () => IndexConatainerModel());
    chatbotActionCardModel =
        createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    indexConatainerModel1.dispose();
    indexConatainerModel2.dispose();
    indexConatainerModel3.dispose();
    indexConatainerModel4.dispose();
    indexConatainerModel5.dispose();
    chatbotActionCardModel.dispose();
  }
}
