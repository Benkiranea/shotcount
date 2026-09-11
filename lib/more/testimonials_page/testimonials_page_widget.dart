import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/more/google/google_widget.dart';
import '/more/yelp/yelp_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'testimonials_page_model.dart';
export 'testimonials_page_model.dart';

class TestimonialsPageWidget extends StatefulWidget {
  const TestimonialsPageWidget({super.key});

  static String routeName = 'TestimonialsPage';
  static String routePath = '/testimonialsPage';

  @override
  State<TestimonialsPageWidget> createState() => _TestimonialsPageWidgetState();
}

class _TestimonialsPageWidgetState extends State<TestimonialsPageWidget> {
  late TestimonialsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestimonialsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.appHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppHeaderWidget(
                    heading: 'TESTIMONIALS',
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).containerClr,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.selectedTestimonial !=
                                  TestimonialSelection.Google) {
                                _model.selectedTestimonial =
                                    TestimonialSelection.Google;
                                safeSetState(() {});
                                return;
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: 100.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: _model.selectedTestimonial ==
                                        TestimonialSelection.Google
                                    ? FlutterFlowTheme.of(context).choiceClr
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Google',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.playfair(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: _model.selectedTestimonial ==
                                              TestimonialSelection.Google
                                          ? FlutterFlowTheme.of(context)
                                              .containerClr
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.selectedTestimonial !=
                                  TestimonialSelection.Yelp) {
                                _model.selectedTestimonial =
                                    TestimonialSelection.Yelp;
                                safeSetState(() {});
                                return;
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: 100.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: _model.selectedTestimonial ==
                                        TestimonialSelection.Yelp
                                    ? FlutterFlowTheme.of(context).choiceClr
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Yelp',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.playfair(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: _model.selectedTestimonial ==
                                              TestimonialSelection.Yelp
                                          ? FlutterFlowTheme.of(context)
                                              .containerClr
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.selectedTestimonial !=
                                  TestimonialSelection.Trustpilot) {
                                _model.selectedTestimonial =
                                    TestimonialSelection.Trustpilot;
                                safeSetState(() {});
                                return;
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: 100.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: _model.selectedTestimonial ==
                                        TestimonialSelection.Trustpilot
                                    ? FlutterFlowTheme.of(context).choiceClr
                                    : Color(0x00000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Trustpilot',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.playfair(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: _model.selectedTestimonial ==
                                              TestimonialSelection.Trustpilot
                                          ? FlutterFlowTheme.of(context)
                                              .containerClr
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.selectedTestimonial ==
                            TestimonialSelection.Google) {
                          return FutureBuilder<ApiCallResponse>(
                            future: GetGoogleReviewsCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final listViewGetGoogleReviewsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final googleReviews = getJsonField(
                                    listViewGetGoogleReviewsResponse.jsonBody,
                                    r'''$.reviews''',
                                  ).toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      32.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: googleReviews.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder: (context, googleReviewsIndex) {
                                      final googleReviewsItem =
                                          googleReviews[googleReviewsIndex];
                                      return GoogleWidget(
                                        key: Key(
                                            'Keyto2_${googleReviewsIndex}_of_${googleReviews.length}'),
                                        name: getJsonField(
                                          googleReviewsItem,
                                          r'''$.author_name''',
                                        ).toString(),
                                        date: getJsonField(
                                          googleReviewsItem,
                                          r'''$.publish_time''',
                                        ).toString(),
                                        note: getJsonField(
                                          googleReviewsItem,
                                          r'''$.text''',
                                        ).toString(),
                                        image:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shot-tracker-9ge9rk/assets/6qjg4fqtml7v/Ellipse_9.png',
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        } else if (_model.selectedTestimonial ==
                            TestimonialSelection.Yelp) {
                          return Builder(
                            builder: (context) {
                              final yelpReviews = List.generate(
                                      random_data.randomInteger(5, 5),
                                      (index) =>
                                          random_data.randomInteger(0, 10))
                                  .toList();

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  32.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: yelpReviews.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, yelpReviewsIndex) {
                                  final yelpReviewsItem =
                                      yelpReviews[yelpReviewsIndex];
                                  return YelpWidget(
                                    key: Key(
                                        'Key15n_${yelpReviewsIndex}_of_${yelpReviews.length}'),
                                    name: 'K U.',
                                    date: '10 November 2024',
                                    note:
                                        'We were very excited to use shotcount... his policies were clear, his estimate based on our photos seemed fair. But when he emailed a docusign document...',
                                    image:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shot-tracker-9ge9rk/assets/6qjg4fqtml7v/Ellipse_9.png',
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Trustpilot_Review_Title.png',
                                      width: double.infinity,
                                      height: 160.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM.png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(3).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/image_28.png',
                                    width: double.infinity,
                                    height: 237.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(4).png',
                                    width: double.infinity,
                                    height: 237.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(5).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(5)_(1).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(6).png',
                                      width: double.infinity,
                                      height: 210.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(7).png',
                                      width: double.infinity,
                                      height: 210.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(10).png',
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(9).png',
                                      width: double.infinity,
                                      height: 350.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(11).png',
                                      width: double.infinity,
                                      height: 190.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(12).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(13).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(14).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(15).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(16).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_23_39_AM_(17).png',
                                      width: double.infinity,
                                      height: 170.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_25_AM.png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_25_AM_(1).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_25_AM_(4).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_25_AM_(5).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(1).png',
                                      width: double.infinity,
                                      height: 280.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(4).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(5).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(7).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(8).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(6).png',
                                      width: double.infinity,
                                      height: 430.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(12).png',
                                      width: double.infinity,
                                      height: 210.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_27_26_AM_(13).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(1)_(1).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(1)_(1).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(10).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(11).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(13).png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(15).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_11_AM_(15)_(1).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_14_2026,_6_03_02_PM_(2).png',
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_14_2026,_6_03_02_PM_(3).png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_14_2026,_6_03_02_PM_(4).png',
                                      width: double.infinity,
                                      height: 197.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_14_2026,_6_02_01_PM.png',
                                      width: double.infinity,
                                      height: 237.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_37_AM_(4).png',
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_37_AM_(3).png',
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_14_2026,_6_03_02_PM.png',
                                      width: double.infinity,
                                      height: 185.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_37_AM_(1).png',
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.asset(
                                      'assets/images/Photo_Aug_13_2026,_9_28_37_AM_(2).png',
                                      width: double.infinity,
                                      height: 245.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 2.0))
                                  .addToEnd(SizedBox(height: 20.0)),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 15.0))
                  .addToStart(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
