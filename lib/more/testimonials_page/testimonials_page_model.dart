import '/backend/schema/enums/enums.dart';
import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'testimonials_page_widget.dart' show TestimonialsPageWidget;
import 'package:flutter/material.dart';

class TestimonialsPageModel extends FlutterFlowModel<TestimonialsPageWidget> {
  ///  Local state fields for this page.

  TestimonialSelection? selectedTestimonial = TestimonialSelection.Google;

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
