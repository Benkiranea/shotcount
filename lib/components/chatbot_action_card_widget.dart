import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatbot_action_card_model.dart';
export 'chatbot_action_card_model.dart';

class ChatbotActionCardWidget extends StatefulWidget {
  const ChatbotActionCardWidget({super.key});

  @override
  State<ChatbotActionCardWidget> createState() =>
      _ChatbotActionCardWidgetState();
}

class _ChatbotActionCardWidgetState extends State<ChatbotActionCardWidget> {
  late ChatbotActionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatbotActionCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.userData = await ProfilesTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              FFAppState().userId,
            ),
          );
          _model.chatToken = await ChatUserTokenHubspotCall.call(
            email: _model.userData?.firstOrNull?.email != null &&
                    _model.userData?.firstOrNull?.email != ''
                ? _model.userData?.firstOrNull?.email
                : 'appuser@shotcount.com',
            firstName:
                functions.getFirstName(_model.userData!.firstOrNull!.fullName!),
            lastName:
                functions.getLastName(_model.userData!.firstOrNull!.fullName!),
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
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 14.0,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }

          safeSetState(() {});
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/Group_1000009273.png',
            width: 137.0,
            height: 99.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
