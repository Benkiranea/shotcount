import '/backend/api_requests/api_calls.dart';
import '/components/app_header/app_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/your_projects/your_project_cards/your_project_cards_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'your_projects_page_model.dart';
export 'your_projects_page_model.dart';

class YourProjectsPageWidget extends StatefulWidget {
  const YourProjectsPageWidget({super.key});

  static String routeName = 'YourProjectsPage';
  static String routePath = '/yourProjectsPage';

  @override
  State<YourProjectsPageWidget> createState() => _YourProjectsPageWidgetState();
}

class _YourProjectsPageWidgetState extends State<YourProjectsPageWidget> {
  late YourProjectsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourProjectsPageModel());
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.appHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppHeaderWidget(
                    heading: 'YOUR PROJECTS',
                  ),
                ),
                Text(
                  'We’re here to help.\nReach shotcount in the way that is most convenient for you.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetAllProjectsCall.call(
                      pUserId: FFAppState().userId,
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
                      final listViewGetAllProjectsResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final projectCards = getJsonField(
                            listViewGetAllProjectsResponse.jsonBody,
                            r'''$''',
                          ).toList();

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              5.0,
                              0,
                              12.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: projectCards.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                            itemBuilder: (context, projectCardsIndex) {
                              final projectCardsItem =
                                  projectCards[projectCardsIndex];
                              return YourProjectCardsWidget(
                                key: Key(
                                    'Keyikf_${projectCardsIndex}_of_${projectCards.length}'),
                                title: getJsonField(
                                  projectCardsItem,
                                  r'''$.project_title''',
                                ).toString(),
                                description: getJsonField(
                                  projectCardsItem,
                                  r'''$.project_type''',
                                ).toString(),
                                date: getJsonField(
                                  projectCardsItem,
                                  r'''$.updated_date''',
                                ).toString(),
                                image:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shot-tracker-9ge9rk/assets/fbn46h40yfhq/Rectangle_10752.png',
                                progresText: getJsonField(
                                  projectCardsItem,
                                  r'''$.progress_text''',
                                ).toString(),
                                status: getJsonField(
                                  projectCardsItem,
                                  r'''$.status''',
                                ).toString(),
                                currentStep: getJsonField(
                                  projectCardsItem,
                                  r'''$.current_steps''',
                                ).toString(),
                                totalStep: getJsonField(
                                  projectCardsItem,
                                  r'''$.total_steps''',
                                ).toString(),
                                progressPercentage:
                                    functions.percentToDecimal(getJsonField(
                                  projectCardsItem,
                                  r'''$.progress_percentage''',
                                )),
                                onTap: () async {
                                  context.pushNamed(
                                    YourProjectDetailPageWidget.routeName,
                                    queryParameters: {
                                      'projectId': serializeParam(
                                        getJsonField(
                                          projectCardsItem,
                                          r'''$.project_id''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
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
