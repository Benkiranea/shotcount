// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the `</>` button on the right!
import 'package:readmore/readmore.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadMoreWidget extends StatefulWidget {
  const ReadMoreWidget({
    super.key,
    this.width,
    this.height,
    this.data,
    this.color,
  });

  final double? width;
  final double? height;
  final String? data;
  final Color? color;

  @override
  State<ReadMoreWidget> createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.data ?? "",
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      lessStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: widget.color,
      ),
      moreStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: widget.color,
      ),
      style: FlutterFlowTheme.of(context).titleMedium.override(
            font: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              //fontStyle: FontStyle.italic,
            ),
            color: FlutterFlowTheme.of(context).containerClr,
            letterSpacing: 0.0,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            // fontStyle: FontStyle.italic,
            lineHeight: 1.5,
          ),
    );
  }
}
