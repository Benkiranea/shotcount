import '/auth/custom_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.guestLogin = await actions.anonymousLogin();
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signIn(
        authenticationToken: currentAuthenticationToken,
        refreshToken: currentAuthRefreshToken,
        tokenExpiration: currentAuthTokenExpiration,
        authUid: currentUserUid,
      );
      if (true ==
          getJsonField(
            _model.guestLogin,
            r'''$.is_new_user''',
          )) {
        await ProfilesTable().insert({
          'device_id': getJsonField(
            _model.guestLogin,
            r'''$.device_id''',
          ).toString(),
        });
        FFAppState().userId = getJsonField(
          _model.guestLogin,
          r'''$.user_id''',
        ).toString();
        safeSetState(() {});
      } else {
        FFAppState().userId = getJsonField(
          _model.guestLogin,
          r'''$.user_id''',
        ).toString();
        safeSetState(() {});
      }

      context.goNamedAuth(IndexPageWidget.routeName, context.mounted);
    });
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/PzOcaI1S_1.png',
                    width: 197.0,
                    height: 209.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
