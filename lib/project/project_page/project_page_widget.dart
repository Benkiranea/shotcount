import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_header/app_header_widget.dart';
import '/components/feeds/feeds_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_page_model.dart';
export 'project_page_model.dart';

class ProjectPageWidget extends StatefulWidget {
  const ProjectPageWidget({super.key});

  static String routeName = 'ProjectPage';
  static String routePath = '/projectPage';

  @override
  State<ProjectPageWidget> createState() => _ProjectPageWidgetState();
}

class _ProjectPageWidgetState extends State<ProjectPageWidget> {
  late ProjectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResulteho = await InstagramFeedCall.call();

      if (!(_model.apiResulteho?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Enable to fetch recent posts.',
              style: GoogleFonts.inter(
                color: FlutterFlowTheme.of(context).info,
                fontSize: 14.0,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    });
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.appHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppHeaderWidget(
                    heading: 'PROJECTS AND TRENDS',
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<InstagramPostsRow>>(
                  future: InstagramPostsTable().queryRows(
                    queryFn: (q) => q.order('timestamp'),
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
                    List<InstagramPostsRow> listViewInstagramPostsRowList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewInstagramPostsRowList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewInstagramPostsRow =
                            listViewInstagramPostsRowList[listViewIndex];
                        return FeedsWidget(
                          key: Key(
                              'Keyap2_${listViewIndex}_of_${listViewInstagramPostsRowList.length}'),
                          userName: listViewInstagramPostsRow.username!,
                          profileImage:
                              listViewInstagramPostsRow.profilePictureUrl!,
                          caption: listViewInstagramPostsRow.caption!,
                          mediaType: listViewInstagramPostsRow.mediaType!,
                          singleImage: listViewInstagramPostsRow.mediaUrl!,
                          childrenUrl: listViewInstagramPostsRow.childrenUrls
                              ?.toString(),
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 15.0)).addToStart(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
