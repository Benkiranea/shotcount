import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'large_p_d_f_view_model.dart';
export 'large_p_d_f_view_model.dart';

class LargePDFViewWidget extends StatefulWidget {
  const LargePDFViewWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<LargePDFViewWidget> createState() => _LargePDFViewWidgetState();
}

class _LargePDFViewWidgetState extends State<LargePDFViewWidget> {
  late LargePDFViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LargePDFViewModel());
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
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        border: FlutterFlowStyledBorder(
          side: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
          ),
          style: FlutterFlowDashStyle.solid,
          showRight: false,
          showBottom: false,
          showLeft: false,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: (FFCrossAxisAlignment.start).flutterValue,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:
                  (FFMainAxisAlignment.spaceBetween).flutterValue,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 40.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'PDF View',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.playfair(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: FaIcon(
                          FaIconData(const IconData(/* shareSquare */ 0xf14d,
                              fontFamily: 'FontAwesomeRegular',
                              fontPackage: 'font_awesome_flutter')),
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await Share.share(
                            widget.url!,
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FaIconData(const IconData(/* download */ 0xf019,
                            fontFamily: 'FontAwesomeSolid',
                            fontPackage: 'font_awesome_flutter')),
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await downloadFile(
                          filename: 'Wallpaper_proposal',
                          url: valueOrDefault<String>(
                            widget.url,
                            'N/A',
                          ),
                        );
                      },
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterFlowPdfViewer(
              networkPath: widget.url!,
              horizontalScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
