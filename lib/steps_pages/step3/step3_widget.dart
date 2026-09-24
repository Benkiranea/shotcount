import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/steps_pages/bill_container/bill_container_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'step3_model.dart';
export 'step3_model.dart';

class Step3Widget extends StatefulWidget {
  const Step3Widget({
    super.key,
    required this.projectId,
  });

  final String? projectId;

  static String routeName = 'Step3';
  static String routePath = '/step3';

  @override
  State<Step3Widget> createState() => _Step3WidgetState();
}

class _Step3WidgetState extends State<Step3Widget> {
  late Step3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step3Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).backBtnClr,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x1A000000),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: FlutterFlowTheme.of(context).backIconClr,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Visualizer',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.playfair(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).headingClr,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).borderClr,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).success,
                        size: 12.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).borderClr,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).success,
                        size: 12.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '3',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.playfair(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).containerClr,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '4',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.playfair(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).containerClr,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '5',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.playfair(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).containerClr,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '6',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.playfair(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).containerClr,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Your Project is Ready',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.playfair(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        'Review & Approve',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    FutureBuilder<List<ProjectsRow>>(
                      future: ProjectsTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          widget!.projectId,
                        ),
                      ),
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
                        List<ProjectsRow> billContainerProjectsRowList =
                            snapshot.data!;

                        final billContainerProjectsRow =
                            billContainerProjectsRowList.isNotEmpty
                                ? billContainerProjectsRowList.first
                                : null;

                        return wrapWithModel(
                          model: _model.billContainerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BillContainerWidget(
                            pdfPath: billContainerProjectsRow!.appointmentPdf!,
                            onTap: () async {
                              context.pushNamed(
                                Step4Widget.routeName,
                                queryParameters: {
                                  'projectId': serializeParam(
                                    widget!.projectId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              await ProjectsTable().update(
                                data: {
                                  'current_steps': 4,
                                },
                                matchingRows: (rows) => rows.eqOrNull(
                                  'id',
                                  widget!.projectId,
                                ),
                              );
                            },
                            openChat: () async {
                              _model.userData = await ProfilesTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  FFAppState().userId,
                                ),
                              );
                              _model.chatToken =
                                  await ChatUserTokenHubspotCall.call(
                                email: _model.userData?.firstOrNull?.email !=
                                            null &&
                                        _model.userData?.firstOrNull?.email !=
                                            ''
                                    ? _model.userData?.firstOrNull?.email
                                    : 'appuser@shotcount.com',
                                firstName: functions.getFirstName(
                                    _model.userData!.firstOrNull!.fullName!),
                                lastName: functions.getLastName(
                                    _model.userData!.firstOrNull!.fullName!),
                              );

                              if ((_model.chatToken?.succeeded ?? true)) {
                                await actions.identifyHubSpotUser(
                                  _model.userData!.firstOrNull!.id!,
                                  _model.userData!.firstOrNull!.deviceId!,
                                  _model.userData!.firstOrNull!.email!,
                                  getJsonField(
                                    (_model.chatToken?.jsonBody ?? ''),
                                    r'''$.token''',
                                  ).toString(),
                                );
                                await actions.openHubSpotChat();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to open the chatbot.',
                                      style: GoogleFonts.inter(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .addToStart(SizedBox(height: 25.0)),
                ),
              ]
                  .divide(SizedBox(height: 20.0))
                  .addToStart(SizedBox(height: 20.0))
                  .addToEnd(SizedBox(height: 41.0)),
            ),
          ),
        ),
      ),
    );
  }
}
