import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_sem_keycolab_widget.dart';
import '/components/popup_sem_setor_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_lateral_maior_model.dart';
export 'menu_lateral_maior_model.dart';

class MenuLateralMaiorWidget extends StatefulWidget {
  const MenuLateralMaiorWidget({super.key});

  @override
  State<MenuLateralMaiorWidget> createState() => _MenuLateralMaiorWidgetState();
}

class _MenuLateralMaiorWidgetState extends State<MenuLateralMaiorWidget>
    with TickerProviderStateMixin {
  late MenuLateralMaiorModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuLateralMaiorModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Stack(
      children: [
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(),
              ),
            ],
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered = false);
            Navigator.pop(context);
          }),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 0.0, 30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 160.0,
                              height: 60.0,
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo-chatfire-curva.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Dashboard',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 240),
                                      ),
                                    },
                                  );

                                  FFAppState().subMenus = '';
                                  FFAppState().pagina = 'dashboard';
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: () {
                                        if (FFAppState().pagina ==
                                            'dashboard') {
                                          return FlutterFlowTheme.of(context)
                                              .info;
                                        } else if (_model
                                            .mouseRegiondashboardHovered!) {
                                          return Color(0x7DFFFFFF);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      hoverColor: Color(0x7DFFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.business_rounded,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (FFAppState().pagina ==
                                                'dashboard') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (_model
                                                .mouseRegiondashboardHovered!) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context).info,
                                        ),
                                        size: 23.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'Dashboard',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .topToBottom,
                                              duration:
                                                  Duration(milliseconds: 240),
                                            ),
                                          },
                                        );

                                        FFAppState().subMenus = '';
                                        FFAppState().pagina = 'dashboard';
                                        safeSetState(() {});
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        'Dashboard',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegiondashboardHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegiondashboardHovered = false);
                            }),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().subMenus == 'atendimentos') {
                                    FFAppState().subMenus = '';
                                    safeSetState(() {});
                                    FFAppState().pagina = 'relatorios';
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().subMenus = 'atendimentos';
                                    safeSetState(() {});
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: () {
                                        if (FFAppState().pagina ==
                                            'relatorios') {
                                          return FlutterFlowTheme.of(context)
                                              .info;
                                        } else if (_model
                                            .mouseRegionrelatorioHovered!) {
                                          return Color(0x7DFFFFFF);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      hoverColor: Color(0x7DFFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.dashboard_outlined,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (FFAppState().pagina ==
                                                'relatorios') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (_model
                                                .mouseRegionrelatorioHovered!) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context).info,
                                        ),
                                        size: 23.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        'Relatórios',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                    if (FFAppState().subMenus != 'atendimentos')
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                    if (FFAppState().subMenus == 'atendimentos')
                                      Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionrelatorioHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionrelatorioHovered = false);
                            }),
                          ),
                          if (valueOrDefault<bool>(
                            FFAppState().subMenus == 'atendimentos',
                            false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().subMenus = '';
                                        FFAppState().pagina = 'relatorios';
                                        safeSetState(() {});

                                        context.pushNamed(
                                          'Relatorios',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .topToBottom,
                                              duration:
                                                  Duration(milliseconds: 240),
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Atendimentos',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                              lineHeight: 1.4,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        hoverElevation: 2.0,
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation1']!),
                              ),
                            ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().subMenus = '';
                                  FFAppState().pagina = 'bot';
                                  safeSetState(() {});

                                  context.pushNamed(
                                    'Bot',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 240),
                                      ),
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: () {
                                        if (FFAppState().pagina == 'bot') {
                                          return FlutterFlowTheme.of(context)
                                              .info;
                                        } else if (_model
                                            .mouseRegionBotHovered!) {
                                          return Color(0x7DFFFFFF);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      hoverColor: Color(0x7DFFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: FaIcon(
                                        FontAwesomeIcons.robot,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (FFAppState().pagina == 'bot') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (_model
                                                .mouseRegionBotHovered!) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context).info,
                                        ),
                                        size: 23.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState().subMenus = '';
                                        FFAppState().pagina = 'bot';
                                        safeSetState(() {});

                                        context.pushNamed(
                                          'Bot',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                              duration:
                                                  Duration(milliseconds: 240),
                                            ),
                                          },
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        'Bot',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionBotHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionBotHovered = false);
                            }),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MouseRegion(
                                opaque: false,
                                cursor: MouseCursor.defer ?? MouseCursor.defer,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().subMenus ==
                                          'corporações') {
                                        FFAppState().subMenus = '';
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().subMenus = 'corporações';
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 40.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          fillColor: () {
                                            if (FFAppState().pagina ==
                                                'corporacao') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            } else if (_model
                                                .mouseRegioncorporacaoHovered!) {
                                              return Color(0x7DFFFFFF);
                                            } else {
                                              return Color(0x00000000);
                                            }
                                          }(),
                                          hoverColor: Color(0x7DFFFFFF),
                                          hoverIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: FaIcon(
                                            FontAwesomeIcons.building,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (FFAppState().pagina ==
                                                    'corporacao') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else if (_model
                                                    .mouseRegioncorporacaoHovered!) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .info;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context).info,
                                            ),
                                            size: 23.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              'Corporação',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                        lineHeight: 1.4,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        if (FFAppState().subMenus !=
                                            'corporações')
                                          Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                        if (FFAppState().subMenus ==
                                            'corporações')
                                          Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                onEnter: ((event) async {
                                  safeSetState(() => _model
                                      .mouseRegioncorporacaoHovered = true);
                                }),
                                onExit: ((event) async {
                                  safeSetState(() => _model
                                      .mouseRegioncorporacaoHovered = false);
                                }),
                              ),
                              if (valueOrDefault<bool>(
                                FFAppState().subMenus == 'corporações',
                                false,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    width: 160.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().subMenus = '';
                                            FFAppState().pagina = 'corporacao';
                                            safeSetState(() {});

                                            context.pushNamed(
                                              'EncerramentoAtendimento',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .topToBottom,
                                                  duration: Duration(
                                                      milliseconds: 240),
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Configurações',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                      lineHeight: 1.4,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverElevation: 2.0,
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (FFAppState()
                                                    .colabUser
                                                    .idSetor !=
                                                null) {
                                              FFAppState().subMenus = '';
                                              FFAppState().pagina =
                                                  'corporacao';
                                              safeSetState(() {});

                                              context.pushNamed(
                                                'Conexoes',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .topToBottom,
                                                    duration: Duration(
                                                        milliseconds: 240),
                                                  ),
                                                },
                                              );
                                            } else {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x26000000),
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PopupSemSetorWidget(),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          text: 'Conexões',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                      lineHeight: 1.4,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverElevation: 2.0,
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().subMenus = '';
                                            FFAppState().pagina = 'corporacao';
                                            safeSetState(() {});

                                            context.pushNamed(
                                              'Setores',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 240),
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Setores',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                      lineHeight: 1.4,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverElevation: 2.0,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation2']!),
                                  ),
                                ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Usuarios',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                      ),
                                    },
                                  );

                                  FFAppState().subMenus = '';
                                  FFAppState().pagina = 'usuarios';
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: () {
                                        if (FFAppState().pagina == 'usuarios') {
                                          return FlutterFlowTheme.of(context)
                                              .info;
                                        } else if (_model
                                            .mouseRegionusariosHovered!) {
                                          return Color(0x7DFFFFFF);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      hoverColor: Color(0x7DFFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.person_outlined,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (FFAppState().pagina ==
                                                'usuarios') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (_model
                                                .mouseRegionusariosHovered!) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context).info,
                                        ),
                                        size: 23.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'Usuarios',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 240),
                                            ),
                                          },
                                        );

                                        FFAppState().subMenus = '';
                                        FFAppState().pagina = 'usuarios';
                                        safeSetState(() {});
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        'Usuários',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionusariosHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(() =>
                                  _model.mouseRegionusariosHovered = false);
                            }),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().subMenus = '';
                              FFAppState().pagina = 'contatos';
                              safeSetState(() {});

                              context.pushNamed(
                                'Contatos',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 240),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              decoration: BoxDecoration(),
                              child: MouseRegion(
                                opaque: false,
                                cursor: MouseCursor.defer ?? MouseCursor.defer,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 40.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        fillColor: () {
                                          if (FFAppState().pagina ==
                                              'contatos') {
                                            return FlutterFlowTheme.of(context)
                                                .info;
                                          } else if (_model
                                              .mouseRegionContatosHovered!) {
                                            return Color(0x7DFFFFFF);
                                          } else {
                                            return Color(0x00000000);
                                          }
                                        }(),
                                        hoverColor: Color(0x7DFFFFFF),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        icon: Icon(
                                          Icons.people_outline,
                                          color: valueOrDefault<Color>(
                                            () {
                                              if (FFAppState().pagina ==
                                                  'contatos') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if (_model
                                                  .mouseRegionContatosHovered!) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .info;
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context).info,
                                          ),
                                          size: 23.0,
                                        ),
                                        onPressed: () async {
                                          FFAppState().subMenus = '';
                                          FFAppState().pagina = 'contatos';
                                          safeSetState(() {});

                                          context.pushNamed(
                                            'Contatos',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 240),
                                              ),
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Contatos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                                onEnter: ((event) async {
                                  safeSetState(() =>
                                      _model.mouseRegionContatosHovered = true);
                                }),
                                onExit: ((event) async {
                                  safeSetState(() => _model
                                      .mouseRegionContatosHovered = false);
                                }),
                              ),
                            ),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().colabUser.keyColabUser !=
                                          null &&
                                      FFAppState().colabUser.keyColabUser !=
                                          '') {
                                    FFAppState().subMenus = '';
                                    FFAppState().pagina = 'chat';
                                    safeSetState(() {});

                                    context.pushNamed(
                                      'Chat',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.topToBottom,
                                          duration: Duration(milliseconds: 240),
                                        ),
                                      },
                                    );
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: PopupSemKeycolabWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 40.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: () {
                                        if (FFAppState().pagina == 'chat') {
                                          return FlutterFlowTheme.of(context)
                                              .info;
                                        } else if (_model
                                            .mouseRegionChatHovered!) {
                                          return Color(0x7DFFFFFF);
                                        } else {
                                          return Color(0x00000000);
                                        }
                                      }(),
                                      hoverColor: Color(0x7DFFFFFF),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (FFAppState().pagina == 'chat') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (_model
                                                .mouseRegionChatHovered!) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .info;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context).info,
                                        ),
                                        size: 23.0,
                                      ),
                                      onPressed: () async {
                                        if (FFAppState()
                                                    .colabUser
                                                    .keyColabUser !=
                                                null &&
                                            FFAppState()
                                                    .colabUser
                                                    .keyColabUser !=
                                                '') {
                                          FFAppState().subMenus = '';
                                          FFAppState().pagina = 'chat';
                                          safeSetState(() {});

                                          context.pushNamed(
                                            'Chat',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .topToBottom,
                                                duration:
                                                    Duration(milliseconds: 240),
                                              ),
                                            },
                                          );
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: PopupSemKeycolabWidget(),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                    ),
                                    Text(
                                      'Chat',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionChatHovered = true);
                            }),
                            onExit: ((event) async {
                              safeSetState(
                                  () => _model.mouseRegionChatHovered = false);
                            }),
                          ),
                        ].divide(SizedBox(height: 13.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 40.0,
                  borderWidth: 1.0,
                  buttonSize: 48.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  hoverColor: Color(0x7DFFFFFF),
                  hoverIconColor: FlutterFlowTheme.of(context).primary,
                  icon: FaIcon(
                    FontAwesomeIcons.powerOff,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 23.0,
                  ),
                  onPressed: () async {
                    unawaited(
                      () async {
                        await ColabUserTable().update(
                          data: {
                            'online': false,
                          },
                          matchingRows: (rows) => rows.eq(
                            'auth_id',
                            currentUserUid,
                          ),
                        );
                      }(),
                    );
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    FFAppState().colabUser = ColabUserStruct();
                    safeSetState(() {});

                    context.pushNamedAuth(
                      'HomePage',
                      context.mounted,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
