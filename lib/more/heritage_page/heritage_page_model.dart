import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'heritage_page_widget.dart' show HeritagePageWidget;
import 'package:flutter/material.dart';

class HeritagePageModel extends FlutterFlowModel<HeritagePageWidget> {
  ///  Local state fields for this page.

  String playVideo = 'https://vimeo.com/1218234792?fl=pl&fe=sh';

  ///  State fields for stateful widgets in this page.

  // Model for AppHeader component.
  late AppHeaderModel appHeaderModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    appHeaderModel = createModel(context, () => AppHeaderModel());
  }

  @override
  void dispose() {
    appHeaderModel.dispose();
  }
}
