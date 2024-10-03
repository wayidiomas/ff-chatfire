import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_latera_menor_model.dart';
export 'menu_latera_menor_model.dart';

class MenuLateraMenorWidget extends StatefulWidget {
  const MenuLateraMenorWidget({super.key});

  @override
  State<MenuLateraMenorWidget> createState() => _MenuLateraMenorWidgetState();
}

class _MenuLateraMenorWidgetState extends State<MenuLateraMenorWidget> {
  late MenuLateraMenorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuLateraMenorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 10.0, 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 48.0,
                      height: 45.0,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo-chatfire-curva_(1).png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'dashboard'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.business,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'dashboard'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 26.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'relatorios'
                          ? FlutterFlowTheme.of(context).info
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.dashboard_outlined,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'relatorios'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'bot'
                          ? FlutterFlowTheme.of(context).info
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: FaIcon(
                        FontAwesomeIcons.robot,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'bot'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'corporacao'
                          ? FlutterFlowTheme.of(context).info
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: FaIcon(
                        FontAwesomeIcons.building,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'corporacao'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'usuarios'
                          ? FlutterFlowTheme.of(context).info
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.person_outlined,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'usuarios'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FFAppState().pagina == 'contatos'
                          ? FlutterFlowTheme.of(context).info
                          : Color(0x00000000),
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.people_outline,
                        color: valueOrDefault<Color>(
                          FFAppState().pagina == 'contatos'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 40.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      hoverColor: Color(0x7DFFFFFF),
                      hoverIconColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.compare_arrows_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 23.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(SizedBox(height: 13.0)),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Color(0xFFC4C4C4),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 26.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              hoverColor: Color(0x7DFFFFFF),
              hoverIconColor: FlutterFlowTheme.of(context).primary,
              icon: FaIcon(
                FontAwesomeIcons.powerOff,
                color: FlutterFlowTheme.of(context).primary,
                size: 28.0,
              ),
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.pushNamedAuth('HomePage', context.mounted);
              },
            ),
          ),
        ],
      ),
    );
  }
}
