import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'slot_empty_state_model.dart';
export 'slot_empty_state_model.dart';

class SlotEmptyStateWidget extends StatefulWidget {
  const SlotEmptyStateWidget({super.key});

  @override
  State<SlotEmptyStateWidget> createState() => _SlotEmptyStateWidgetState();
}

class _SlotEmptyStateWidgetState extends State<SlotEmptyStateWidget> {
  late SlotEmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlotEmptyStateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'No slots are available for the selected date. Please select another date to view available slots.',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.playfair(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ),
    );
  }
}
