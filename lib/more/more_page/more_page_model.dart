import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index_page/index_conatainer/index_conatainer_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'more_page_widget.dart' show MorePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MorePageModel extends FlutterFlowModel<MorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // Model for IndexConatainer component.
  late IndexConatainerModel indexConatainerModel;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
    indexConatainerModel = createModel(context, () => IndexConatainerModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
    indexConatainerModel.dispose();
  }
}
