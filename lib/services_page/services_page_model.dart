import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'services_page_widget.dart' show ServicesPageWidget;
import 'package:flutter/material.dart';

class ServicesPageModel extends FlutterFlowModel<ServicesPageWidget> {
  ///  Local state fields for this page.

  bool homeownerExpanded = false;

  bool interiorExpanded = false;

  bool contractorExpanded = false;

  bool servicesExpanded = false;

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
