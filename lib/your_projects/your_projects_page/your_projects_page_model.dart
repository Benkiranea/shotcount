import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'your_projects_page_widget.dart' show YourProjectsPageWidget;
import 'package:flutter/material.dart';

class YourProjectsPageModel extends FlutterFlowModel<YourProjectsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
  }
}
