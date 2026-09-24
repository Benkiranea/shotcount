import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feeds_model.dart';
export 'feeds_model.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({
    super.key,
    required this.userName,
    required this.profileImage,
    required this.caption,
    required this.mediaType,
    required this.singleImage,
    this.childrenUrl,
  });

  final String? userName;
  final String? profileImage;
  final String? caption;
  final String? mediaType;
  final String? singleImage;
  final String? childrenUrl;

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  late FeedsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget!.profileImage!,
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.userName,
                    'Shotcount',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).containerClr,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 7.0)).addToStart(SizedBox(width: 8.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.keyboard_control,
                color: FlutterFlowTheme.of(context).iconClr,
                size: 13.0,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 352.0,
                child: custom_widgets.InstagramMediaViewer(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 352.0,
                  mediaType: widget!.mediaType!,
                  mediaUrl: widget!.singleImage!,
                  childrenUrl: widget!.childrenUrl,
                ),
              ),
            ],
          ),
        ),
        if (false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (widget!.mediaType == 'CAROUSEL_ALBUM') {
                        return Builder(
                          builder: (context) {
                            final images = List.generate(
                                    random_data.randomInteger(5, 5),
                                    (index) => random_data.randomInteger(0, 3))
                                .toList();

                            return Container(
                              width: double.infinity,
                              height: 352.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: PageView.builder(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(0,
                                                  min(0, images.length - 1))),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  'https://picsum.photos/seed/739/600',
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(0,
                                                    min(0, images.length - 1))),
                                        count: images.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          safeSetState(() {});
                                        },
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 4.0,
                                          radius: 8.0,
                                          dotWidth: 6.0,
                                          dotHeight: 6.0,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .iconClr,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/739/600',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      FFIcons.kheart,
                      color: FlutterFlowTheme.of(context).accent3,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.mode_comment_outlined,
                      color: FlutterFlowTheme.of(context).accent3,
                      size: 24.0,
                    ),
                    Icon(
                      FFIcons.kshare,
                      color: FlutterFlowTheme.of(context).accent3,
                      size: 24.0,
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Icon(
                  FFIcons.kbookmark,
                  color: FlutterFlowTheme.of(context).accent3,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
        if (false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget!.caption,
                'Shotcount’s artistic interpretation of American Pie transforms one of music’s most iconic images into a minimalist Van Gogh Impressionist mural.... ',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).containerClr,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 0.0),
          child: custom_widgets.ReadMoreWidget(
            width: double.infinity,
            height: 16.0,
            data: widget!.caption,
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        if (false)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '#Shotcount #AmericanPie #DonMcLean #VanGogh',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ].addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
          ),
        if (false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 0.0, 0.0),
            child: Text(
              '10 comments',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).accent3,
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
      ].addToEnd(SizedBox(height: 9.0)),
    );
  }
}
