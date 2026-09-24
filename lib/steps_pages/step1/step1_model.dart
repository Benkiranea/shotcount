import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_container/choice_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/steps_pages/steps_container/steps_container_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'step1_widget.dart' show Step1Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Step1Model extends FlutterFlowModel<Step1Widget> {
  ///  Local state fields for this page.

  bool isExpanded = false;

  String? selectedValue;

  String? image;

  bool isLoading = false;

  List<FFUploadedFile> selectedFiles = [];
  void addToSelectedFiles(FFUploadedFile item) => selectedFiles.add(item);
  void removeFromSelectedFiles(FFUploadedFile item) =>
      selectedFiles.remove(item);
  void removeAtIndexFromSelectedFiles(int index) =>
      selectedFiles.removeAt(index);
  void insertAtIndexInSelectedFiles(int index, FFUploadedFile item) =>
      selectedFiles.insert(index, item);
  void updateSelectedFilesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      selectedFiles[index] = updateFn(selectedFiles[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for StepsContainer component.
  late StepsContainerModel stepsContainerModel1;
  bool isDataUploading_uploadRoomImage = false;
  FFUploadedFile uploadedLocalFile_uploadRoomImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadRoomImage = '';

  // Stores action output result for [Backend Call - API (GenerateWallpaperVisualization)] action in Container widget.
  ApiCallResponse? imageRes;
  bool isDataUploading_uploadWallpaper = false;
  FFUploadedFile uploadedLocalFile_uploadWallpaper =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadWallpaper = '';

  // Stores action output result for [Backend Call - API (GenerateWallpaperVisualization)] action in Container widget.
  ApiCallResponse? imageRes1;
  // State field(s) for FullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Full name is required';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email address is required';
    }

    return null;
  }

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  late MaskTextInputFormatter phoneMask;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone number is required';
    }

    return null;
  }

  // State field(s) for ProjectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameTextController;
  String? Function(BuildContext, String?)? projectNameTextControllerValidator;
  String? _projectNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Project Name is required';
    }

    return null;
  }

  // Model for StepsContainer component.
  late StepsContainerModel stepsContainerModel2;
  // State field(s) for AboutProject widget.
  FocusNode? aboutProjectFocusNode;
  TextEditingController? aboutProjectTextController;
  String? Function(BuildContext, String?)? aboutProjectTextControllerValidator;
  String? _aboutProjectTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Example: is required';
    }

    return null;
  }

  // Model for StepsContainer component.
  late StepsContainerModel stepsContainerModel3;
  // Stores action output result for [Custom Action - pickAndAddFiles] action in Container widget.
  List<FFUploadedFile>? pickAndAddFiles;
  // Model for StepsContainer component.
  late StepsContainerModel stepsContainerModel4;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel1;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel2;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel3;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel4;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel5;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel6;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel7;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel8;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel9;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel10;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel11;
  // Model for ChoiceContainer component.
  late ChoiceContainerModel choiceContainerModel12;
  // State field(s) for DescribeRoom widget.
  FocusNode? describeRoomFocusNode;
  TextEditingController? describeRoomTextController;
  String? Function(BuildContext, String?)? describeRoomTextControllerValidator;
  // Stores action output result for [Validate Form] action in Container widget.
  bool? formValidate;
  // Stores action output result for [Custom Action - uploadFilesToSupabase] action in Container widget.
  dynamic? uploadFilesToSupabase;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ProjectsRow? projectCreated;

  @override
  void initState(BuildContext context) {
    stepsContainerModel1 = createModel(context, () => StepsContainerModel());
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    projectNameTextControllerValidator = _projectNameTextControllerValidator;
    stepsContainerModel2 = createModel(context, () => StepsContainerModel());
    aboutProjectTextControllerValidator = _aboutProjectTextControllerValidator;
    stepsContainerModel3 = createModel(context, () => StepsContainerModel());
    stepsContainerModel4 = createModel(context, () => StepsContainerModel());
    choiceContainerModel1 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel2 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel3 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel4 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel5 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel6 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel7 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel8 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel9 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel10 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel11 = createModel(context, () => ChoiceContainerModel());
    choiceContainerModel12 = createModel(context, () => ChoiceContainerModel());
  }

  @override
  void dispose() {
    stepsContainerModel1.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    projectNameFocusNode?.dispose();
    projectNameTextController?.dispose();

    stepsContainerModel2.dispose();
    aboutProjectFocusNode?.dispose();
    aboutProjectTextController?.dispose();

    stepsContainerModel3.dispose();
    stepsContainerModel4.dispose();
    choiceContainerModel1.dispose();
    choiceContainerModel2.dispose();
    choiceContainerModel3.dispose();
    choiceContainerModel4.dispose();
    choiceContainerModel5.dispose();
    choiceContainerModel6.dispose();
    choiceContainerModel7.dispose();
    choiceContainerModel8.dispose();
    choiceContainerModel9.dispose();
    choiceContainerModel10.dispose();
    choiceContainerModel11.dispose();
    choiceContainerModel12.dispose();
    describeRoomFocusNode?.dispose();
    describeRoomTextController?.dispose();
  }

  /// Action blocks.
  Future processAiImage(BuildContext context) async {
    ApiCallResponse? imageRes;

    imageRes = await GenerateWallpaperVisualizationCall.call(
      roomUrl: uploadedFileUrl_uploadRoomImage,
      wallpaperUrl: uploadedFileUrl_uploadWallpaper,
    );

    if ((imageRes?.succeeded ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getJsonField(
              (imageRes?.jsonBody ?? ''),
              r'''$.result_url''',
            ).toString(),
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).info,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something went eorn g',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).info,
        ),
      );
    }
  }
}
