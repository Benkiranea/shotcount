import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choice_container_model.dart';
export 'choice_container_model.dart';

class ChoiceContainerWidget extends StatefulWidget {
  const ChoiceContainerWidget({
    super.key,
    required this.category,
    required this.icon,
    bool? isSelected,
    required this.onTap,
  }) : this.isSelected = isSelected ?? false;

  final String? category;
  final Widget? icon;
  final bool isSelected;
  final Future Function()? onTap;

  @override
  State<ChoiceContainerWidget> createState() => _ChoiceContainerWidgetState();
}

class _ChoiceContainerWidgetState extends State<ChoiceContainerWidget> {
  late ChoiceContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Color(0x1AD7A94F)
              : FlutterFlowTheme.of(context).containerClr,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: widget.isSelected
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).conBorderClr,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 11.0, 10.0, 11.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    widget.icon!,
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.category,
                          'Category',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ),
              if (!widget.isSelected)
                Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).containerClr,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).conBorderClr,
                      width: 1.0,
                    ),
                  ),
                ),
              if (widget.isSelected)
                Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).containerClr,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFFA07D45),
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
