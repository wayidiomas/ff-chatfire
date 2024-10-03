import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/info_atendimentos_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_encaminhar_conversa_widget.dart';
import '/components/popup_encerrar_conversa_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_historico_widget.dart';
import '/components/popup_recusar_conversa_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/components/splash_chat_fire_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'relatorios_model.dart';
export 'relatorios_model.dart';

class RelatoriosWidget extends StatefulWidget {
  const RelatoriosWidget({super.key});

  @override
  State<RelatoriosWidget> createState() => _RelatoriosWidgetState();
}

class _RelatoriosWidgetState extends State<RelatoriosWidget>
    with TickerProviderStateMixin {
  late RelatoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelatoriosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultUser = await action_blocks.triagemUser(context);
      if (_model.resultUser == 'deslogar') {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.goNamedAuth(
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
      }
      await actions.desconectar(
        'conversas',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.conectar(
        'conversas',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
    });

    _model.textFieldnomeContatoTextController ??= TextEditingController();
    _model.textFieldnomeContatoFocusNode ??= FocusNode();

    _model.textFieldnumeroContatoTextController ??= TextEditingController();
    _model.textFieldnumeroContatoFocusNode ??= FocusNode();

    _model.textFieldProtocooTextController ??= TextEditingController();
    _model.textFieldProtocooFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Container(
          width: 230.0,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: wrapWithModel(
                model: _model.menuLateralMaiorModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuLateralMaiorWidget(),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F8F9),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        constraints: BoxConstraints(
                          minWidth: 80.0,
                          minHeight: MediaQuery.sizeOf(context).height * 1.0,
                          maxWidth: 250.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: MouseRegion(
                                opaque: false,
                                cursor: MouseCursor.defer ?? MouseCursor.defer,
                                child: wrapWithModel(
                                  model: _model.menuLateraMenorModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MenuLateraMenorWidget(),
                                ),
                                onEnter: ((event) async {
                                  safeSetState(() => _model
                                      .mouseRegionMenuLateralHovered = true);
                                  scaffoldKey.currentState!.openDrawer();
                                }),
                                onExit: ((event) async {
                                  safeSetState(() => _model
                                      .mouseRegionMenuLateralHovered = false);
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<ViewConversasPorEmpresaRow>>(
                          future: ViewConversasPorEmpresaTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'ref_empresa',
                              FFAppState().colabUser.refEmpresa,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return SplashChatFireWidget();
                            }
                            List<ViewConversasPorEmpresaRow>
                                containerViewConversasPorEmpresaRowList =
                                snapshot.data!;

                            final containerViewConversasPorEmpresaRow =
                                containerViewConversasPorEmpresaRowList
                                        .isNotEmpty
                                    ? containerViewConversasPorEmpresaRowList
                                        .first
                                    : null;

                            return Container(
                              width: 100.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.appBarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: AppBarWidget(),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 16.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Histórico de atendimentos',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nunito Sans'),
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0x237C9726),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 400.0,
                                                              maxWidth: 1000.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 4.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        24.0,
                                                                        34.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              _model.verFiltros = !_model.verFiltros;
                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'Filtros',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.filter_list,
                                                                              color: Color(0xFFBDBDBD),
                                                                              size: 18.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 35.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Color(0xFFBDBDBD),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 0.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              hoverColor: Color(0xFFF5F5F5),
                                                                              hoverTextColor: Color(0xFFBDBDBD),
                                                                              hoverElevation: 2.0,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 24.0)),
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .verFiltros)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Wrap(
                                                                              spacing: 12.0,
                                                                              runSpacing: 20.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Status',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownStatusValueController ??= FormFieldController<String>(null),
                                                                                            options: [
                                                                                              'Espera',
                                                                                              'Em Atendimento',
                                                                                              'Finalizado',
                                                                                              'Transferido'
                                                                                            ],
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownStatusValue = val),
                                                                                            height: 45.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                            hintText: 'Todos',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: Color(0xFF9E9E9E),
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            fillColor: Colors.white,
                                                                                            elevation: 2.0,
                                                                                            borderColor: valueOrDefault<Color>(
                                                                                              _model.mouseRegiontextfield888Hovered1! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                              Color(0xFFBDBDBD),
                                                                                            ),
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 16.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered1 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered1 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Nome cliente',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldnomeContatoTextController,
                                                                                              focusNode: _model.textFieldnomeContatoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldnomeContatoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Digite aqui',
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      _model.mouseRegiontextfieldHovered1! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                      Color(0xFFBDBDBD),
                                                                                                    ),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                suffixIcon: _model.textFieldnomeContatoTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldnomeContatoTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: Color(0xFFBDBDBD),
                                                                                                          size: 20.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.textFieldnomeContatoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered1 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered1 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Número telefone',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldnumeroContatoTextController,
                                                                                              focusNode: _model.textFieldnumeroContatoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldnumeroContatoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Digite aqui',
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      _model.mouseRegiontextfieldHovered2! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                      Color(0xFFBDBDBD),
                                                                                                    ),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                suffixIcon: _model.textFieldnumeroContatoTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldnumeroContatoTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: Color(0xFFBDBDBD),
                                                                                                          size: 20.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.textFieldnumeroContatoTextControllerValidator.asValidator(context),
                                                                                              inputFormatters: [
                                                                                                _model.textFieldnumeroContatoMask
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered2 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered2 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Protocolo',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldProtocooTextController,
                                                                                              focusNode: _model.textFieldProtocooFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldProtocooTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Digite aqui',
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      _model.mouseRegiontextfieldHovered3! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                      Color(0xFFBDBDBD),
                                                                                                    ),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                suffixIcon: _model.textFieldProtocooTextController!.text.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          _model.textFieldProtocooTextController?.clear();
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.clear,
                                                                                                          color: Color(0xFFBDBDBD),
                                                                                                          size: 20.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              validator: _model.textFieldProtocooTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered3 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfieldHovered3 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'rowOnPageLoadAnimation1']!),
                                                                    if (_model
                                                                        .verFiltros)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Wrap(
                                                                              spacing: 12.0,
                                                                              runSpacing: 20.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Conexão',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownConexoaValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownConexoaValue ??= '',
                                                                                            ),
                                                                                            options: List<String>.from(FFAppState().colabUser.setorConexao.map((e) => e.keyConexao).toList().unique((e) => e)),
                                                                                            optionLabels: FFAppState().colabUser.setorConexao.map((e) => e.nomeConexao).toList().unique((e) => e),
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownConexoaValue = val),
                                                                                            height: 45.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                            hintText: 'Escolha aqui',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: Color(0xFF9E9E9E),
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: valueOrDefault<Color>(
                                                                                              _model.mouseRegiontextfield888Hovered2! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                              Color(0xFFBDBDBD),
                                                                                            ),
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 16.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered2 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered2 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Setor',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          FutureBuilder<List<SetoresRow>>(
                                                                                            future: SetoresTable().queryRows(
                                                                                              queryFn: (q) => q.eq(
                                                                                                'id_empresas',
                                                                                                FFAppState().colabUser.refEmpresa,
                                                                                              ),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: CircularProgressIndicator(
                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<SetoresRow> dropDownSetorSetoresRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<String>(
                                                                                                controller: _model.dropDownSetorValueController ??= FormFieldController<String>(null),
                                                                                                options: dropDownSetorSetoresRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.dropDownSetorValue = val),
                                                                                                height: 45.0,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Escolha aqui',
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: Color(0xFF9E9E9E),
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: valueOrDefault<Color>(
                                                                                                  _model.mouseRegiontextfield888Hovered3! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                  Color(0xFFBDBDBD),
                                                                                                ),
                                                                                                borderWidth: 1.0,
                                                                                                borderRadius: 16.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                hidesUnderline: true,
                                                                                                isSearchable: false,
                                                                                                isMultiSelect: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered3 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered3 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: MouseRegion(
                                                                                    opaque: false,
                                                                                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Operador',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: Color(0x80000000),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          FutureBuilder<List<ColabUserRow>>(
                                                                                            future: ColabUserTable().queryRows(
                                                                                              queryFn: (q) => q.eq(
                                                                                                'Tipo',
                                                                                                'Operador',
                                                                                              ),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: CircularProgressIndicator(
                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<ColabUserRow> dropDownOperadorColabUserRowList = snapshot.data!;

                                                                                              return FlutterFlowDropDown<String>(
                                                                                                controller: _model.dropDownOperadorValueController ??= FormFieldController<String>(null),
                                                                                                options: dropDownOperadorColabUserRowList.map((e) => e.username).withoutNulls.toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.dropDownOperadorValue = val),
                                                                                                height: 45.0,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Escolha aqui',
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: Color(0xFF9E9E9E),
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: valueOrDefault<Color>(
                                                                                                  _model.mouseRegiontextfield888Hovered4! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                  Color(0xFFBDBDBD),
                                                                                                ),
                                                                                                borderWidth: 1.0,
                                                                                                borderRadius: 16.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                hidesUnderline: true,
                                                                                                isSearchable: false,
                                                                                                isMultiSelect: false,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    onEnter: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered4 = true);
                                                                                    }),
                                                                                    onExit: ((event) async {
                                                                                      safeSetState(() => _model.mouseRegiontextfield888Hovered4 = false);
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'rowOnPageLoadAnimation2']!),
                                                                    if (_model
                                                                        .verFiltros)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Wrap(
                                                                            spacing:
                                                                                12.0,
                                                                            runSpacing:
                                                                                20.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                decoration: BoxDecoration(),
                                                                                child: MouseRegion(
                                                                                  opaque: false,
                                                                                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            'Período Inicial',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: Color(0x80000000),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  lineHeight: 1.4,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            border: Border.all(
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.mouseRegiontextfielddtInicioHovered! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                Color(0xFFBDBDBD),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(6.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: 20.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 30.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                  icon: Icon(
                                                                                                    Icons.calendar_today,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    final _datePicked1Date = await showDatePicker(
                                                                                                      context: context,
                                                                                                      initialDate: getCurrentTimestamp,
                                                                                                      firstDate: DateTime(1900),
                                                                                                      lastDate: getCurrentTimestamp,
                                                                                                      builder: (context, child) {
                                                                                                        return wrapInMaterialDatePickerTheme(
                                                                                                          context,
                                                                                                          child!,
                                                                                                          headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                          headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                          headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                                fontSize: 32.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                                              ),
                                                                                                          pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                          selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                          selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                          actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                          iconSize: 24.0,
                                                                                                        );
                                                                                                      },
                                                                                                    );

                                                                                                    if (_datePicked1Date != null) {
                                                                                                      safeSetState(() {
                                                                                                        _model.datePicked1 = DateTime(
                                                                                                          _datePicked1Date.year,
                                                                                                          _datePicked1Date.month,
                                                                                                          _datePicked1Date.day,
                                                                                                        );
                                                                                                      });
                                                                                                    }
                                                                                                    _model.date1Inicio = _model.datePicked1;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                                if (_model.date1Inicio != null)
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yy",
                                                                                                        _model.date1Inicio,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if (_model.date1Inicio != null)
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      _model.date1Inicio = null;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.close,
                                                                                                      color: Color(0xFFBDBDBD),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  onEnter: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegiontextfielddtInicioHovered = true);
                                                                                  }),
                                                                                  onExit: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegiontextfielddtInicioHovered = false);
                                                                                  }),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.2,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: MouseRegion(
                                                                                  opaque: false,
                                                                                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            'Período Final',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: Color(0x80000000),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  lineHeight: 1.4,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 45.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            border: Border.all(
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.mouseRegiontextfieldfinalHovered! ? FlutterFlowTheme.of(context).primary : Color(0xFFBDBDBD),
                                                                                                Color(0xFFBDBDBD),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(6.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: 20.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 30.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                  icon: Icon(
                                                                                                    Icons.calendar_today,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    size: 14.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    final _datePicked2Date = await showDatePicker(
                                                                                                      context: context,
                                                                                                      initialDate: getCurrentTimestamp,
                                                                                                      firstDate: DateTime(1900),
                                                                                                      lastDate: getCurrentTimestamp,
                                                                                                      builder: (context, child) {
                                                                                                        return wrapInMaterialDatePickerTheme(
                                                                                                          context,
                                                                                                          child!,
                                                                                                          headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                          headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                          headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                                fontSize: 32.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                                              ),
                                                                                                          pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                          selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                          selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                          actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                          iconSize: 24.0,
                                                                                                        );
                                                                                                      },
                                                                                                    );

                                                                                                    if (_datePicked2Date != null) {
                                                                                                      safeSetState(() {
                                                                                                        _model.datePicked2 = DateTime(
                                                                                                          _datePicked2Date.year,
                                                                                                          _datePicked2Date.month,
                                                                                                          _datePicked2Date.day,
                                                                                                        );
                                                                                                      });
                                                                                                    }
                                                                                                    _model.date2Fim = _model.datePicked2;
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                                if (_model.date2Fim != null)
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yy",
                                                                                                        _model.date2Fim,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if (_model.date2Fim != null)
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      _model.date2Fim = null;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.close,
                                                                                                      color: Color(0xFFBDBDBD),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  onEnter: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegiontextfieldfinalHovered = true);
                                                                                  }),
                                                                                  onExit: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegiontextfieldfinalHovered = false);
                                                                                  }),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'rowOnPageLoadAnimation3']!),
                                                                    if (_model
                                                                        .verFiltros)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.apiResultvbt = await GetDataGroup.getRelatoriosCall.call(
                                                                                  idEmpresa: FFAppState().colabUser.refEmpresa,
                                                                                  filtros: functions.filtroRelatorios(_model.dropDownStatusValue, _model.textFieldnomeContatoTextController.text, _model.textFieldnumeroContatoTextController.text, _model.textFieldProtocooTextController.text, _model.dropDownConexoaValue, _model.dropDownSetorValue, _model.dropDownOperadorValue, _model.date1Inicio, _model.date2Fim),
                                                                                );

                                                                                if ((_model.apiResultvbt?.succeeded ?? true)) {
                                                                                  _model.searchON = true;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  _model.searchON = false;
                                                                                  safeSetState(() {});
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: PopupErrorAPIWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: 'Pesquisar',
                                                                              icon: Icon(
                                                                                Icons.search,
                                                                                color: Color(0xFFFAFAFA),
                                                                                size: 18.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Color(0xFFFAFAFA),
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 3.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                safeSetState(() {
                                                                                  _model.dropDownStatusValueController?.reset();
                                                                                  _model.dropDownSetorValueController?.reset();
                                                                                  _model.dropDownOperadorValueController?.reset();
                                                                                  _model.dropDownConexoaValueController?.reset();
                                                                                });
                                                                                safeSetState(() {
                                                                                  _model.textFieldnomeContatoTextController?.clear();
                                                                                  _model.textFieldnumeroContatoTextController?.clear();
                                                                                  _model.textFieldProtocooTextController?.clear();
                                                                                });
                                                                                _model.searchON = false;
                                                                                _model.date1Inicio = null;
                                                                                _model.date2Fim = null;
                                                                                safeSetState(() {});
                                                                              },
                                                                              text: 'Limpar busca',
                                                                              icon: Icon(
                                                                                Icons.settings_backup_restore_rounded,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 18.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 0.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                                hoverColor: Color(0xFFF5F5F5),
                                                                                hoverBorderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 0.0,
                                                                                ),
                                                                                hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                hoverElevation: 2.0,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 24.0)),
                                                                        ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation4']!),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 24.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 4.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            24.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (!_model
                                                                .searchON)
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F8F9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ConversasRelatorioRow>>(
                                                                  future: (_model.requestCompleter ??= Completer<
                                                                          List<
                                                                              ConversasRelatorioRow>>()
                                                                        ..complete(
                                                                            ConversasRelatorioTable().queryRows(
                                                                          queryFn: (q) =>
                                                                              q.eq(
                                                                            'ref_empresa',
                                                                            FFAppState().colabUser.refEmpresa,
                                                                          ),
                                                                        )))
                                                                      .future,
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return ShimmerEffectWidget();
                                                                    }
                                                                    List<ConversasRelatorioRow>
                                                                        listViewOFF1ConversasRelatorioRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    if (listViewOFF1ConversasRelatorioRowList
                                                                        .isEmpty) {
                                                                      return ListasemdadosWidget();
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewOFF1ConversasRelatorioRowList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewOFF1Index) {
                                                                        final listViewOFF1ConversasRelatorioRow =
                                                                            listViewOFF1ConversasRelatorioRowList[listViewOFF1Index];
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                    child: Wrap(
                                                                                      spacing: 8.0,
                                                                                      runSpacing: 8.0,
                                                                                      alignment: WrapAlignment.spaceAround,
                                                                                      crossAxisAlignment: WrapCrossAlignment.center,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 130.0,
                                                                                          height: 36.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: valueOrDefault<Color>(
                                                                                              () {
                                                                                                if (listViewOFF1ConversasRelatorioRow.status == 'Em Atendimento') {
                                                                                                  return Color(0xFF303F9F);
                                                                                                } else if (listViewOFF1ConversasRelatorioRow.status == 'Espera') {
                                                                                                  return Color(0xFFFF9100);
                                                                                                } else if (listViewOFF1ConversasRelatorioRow.status == 'Finalizado') {
                                                                                                  return Color(0xFF43A047);
                                                                                                } else if (listViewOFF1ConversasRelatorioRow.status == 'Bot') {
                                                                                                  return Color(0xFFFDD835);
                                                                                                } else {
                                                                                                  return Color(0xFF795548);
                                                                                                }
                                                                                              }(),
                                                                                              Color(0xFFFDD835),
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(3.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewOFF1ConversasRelatorioRow.status,
                                                                                                  'N/A',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontSize: valueOrDefault<double>(
                                                                                                        () {
                                                                                                          if (listViewOFF1ConversasRelatorioRow.status == 'Em Atendimento') {
                                                                                                            return 10.0;
                                                                                                          } else if (listViewOFF1ConversasRelatorioRow.status == 'Bot') {
                                                                                                            return 10.0;
                                                                                                          } else {
                                                                                                            return 12.0;
                                                                                                          }
                                                                                                        }(),
                                                                                                        10.0,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 200.0,
                                                                                          height: 50.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (listViewOFF1ConversasRelatorioRow.fotoContato != null && listViewOFF1ConversasRelatorioRow.fotoContato != '')
                                                                                                Container(
                                                                                                  width: 48.0,
                                                                                                  height: 48.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewOFF1ConversasRelatorioRow.fotoContato,
                                                                                                      'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHx1c2VyfGVufDB8fHx8MTY5NDk1MTY0OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                                                    ),
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              if (listViewOFF1ConversasRelatorioRow.fotoContato == null || listViewOFF1ConversasRelatorioRow.fotoContato == '')
                                                                                                Container(
                                                                                                  width: 48.0,
                                                                                                  height: 48.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.asset(
                                                                                                    'assets/images/unavailable.jpg',
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          listViewOFF1ConversasRelatorioRow.nomeContato,
                                                                                                          'N/A',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        functions.mascararNumero(valueOrDefault<String>(
                                                                                                          listViewOFF1ConversasRelatorioRow.numeroContato,
                                                                                                          'N/A',
                                                                                                        )),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 190.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Setor:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewOFF1ConversasRelatorioRow.setorNomenclatura,
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Conexão:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewOFF1ConversasRelatorioRow.conexaoNomenclatura,
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Atendente:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewOFF1ConversasRelatorioRow.colabuserNome,
                                                                                                      'Vazio',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 180.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Inicio:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yyyy HH:mm",
                                                                                                        listViewOFF1ConversasRelatorioRow.createdAt,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      'Vazio',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Fim:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yyyy HH:mm",
                                                                                                        listViewOFF1ConversasRelatorioRow.horaFinalizada,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      'Não finalizada',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 140.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Protocolo:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        () {
                                                                                                          if ((listViewOFF1ConversasRelatorioRow.status == 'Em Atendimento') && (listViewOFF1ConversasRelatorioRow.istransferida == false)) {
                                                                                                            return listViewOFF1ConversasRelatorioRow.id?.toString();
                                                                                                          } else if (listViewOFF1ConversasRelatorioRow.istransferida == true) {
                                                                                                            return listViewOFF1ConversasRelatorioRow.protocolo;
                                                                                                          } else {
                                                                                                            return listViewOFF1ConversasRelatorioRow.id?.toString();
                                                                                                          }
                                                                                                        }(),
                                                                                                        'Atendimento não iniciado.',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 184.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Encaminhar',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: listViewOFF1ConversasRelatorioRow.status != 'Finalizado',
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 36.0,
                                                                                                        hoverIconColor: Color(0xFFFFCA28),
                                                                                                        icon: Icon(
                                                                                                          Icons.compare_arrows_sharp,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 17.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c1 = await actions.getRowByIdConversas(
                                                                                                            listViewOFF1ConversasRelatorioRow.id?.toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupEncaminharConversaWidget(
                                                                                                                    conversa: _model.c1!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Encerrar',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: (listViewOFF1ConversasRelatorioRow.status != 'Finalizado') && (listViewOFF1ConversasRelatorioRow.status != 'Espera'),
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 34.0,
                                                                                                        hoverIconColor: Color(0xFFE53935),
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.phoneSlash,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c2 = await actions.getRowByIdConversas(
                                                                                                            listViewOFF1ConversasRelatorioRow.id?.toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupEncerrarConversaWidget(
                                                                                                                    conversa: _model.c2!,
                                                                                                                    administrador: true,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Recusar ',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: listViewOFF1ConversasRelatorioRow.status == 'Espera',
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 34.0,
                                                                                                        hoverIconColor: Color(0xFFE53935),
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.phoneSlash,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c3 = await actions.getRowByIdConversas(
                                                                                                            listViewOFF1ConversasRelatorioRow.id?.toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupRecusarConversaWidget(
                                                                                                                    conversa: _model.c3!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Histórico',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 20.0,
                                                                                                      buttonSize: 36.0,
                                                                                                      hoverIconColor: Color(0xFF3F51B5),
                                                                                                      icon: Icon(
                                                                                                        Icons.mark_unread_chat_alt,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        _model.c4 = await actions.getRowByIdConversas(
                                                                                                          listViewOFF1ConversasRelatorioRow.id?.toString(),
                                                                                                        );
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: PopupHistoricoWidget(
                                                                                                                  conversa: _model.c4!,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Informações',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 20.0,
                                                                                                      buttonSize: 36.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.info_outlined,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 18.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        _model.c5 = await actions.getRowByIdConversas(
                                                                                                          listViewOFF1ConversasRelatorioRow.id?.toString(),
                                                                                                        );
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: InfoAtendimentosWidget(
                                                                                                                  conversa: _model.c5!,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFE0E0E0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (_model.searchON)
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF5F8F9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final conversasRelatorioSearch =
                                                                        (_model.apiResultvbt?.jsonBody ??
                                                                                '')
                                                                            .toList();
                                                                    if (conversasRelatorioSearch
                                                                        .isEmpty) {
                                                                      return ListasemdadosWidget();
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          conversasRelatorioSearch
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              conversasRelatorioSearchIndex) {
                                                                        final conversasRelatorioSearchItem =
                                                                            conversasRelatorioSearch[conversasRelatorioSearchIndex];
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                    child: Wrap(
                                                                                      spacing: 8.0,
                                                                                      runSpacing: 8.0,
                                                                                      alignment: WrapAlignment.spaceAround,
                                                                                      crossAxisAlignment: WrapCrossAlignment.center,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 130.0,
                                                                                          height: 36.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: valueOrDefault<Color>(
                                                                                              () {
                                                                                                if (functions.jsonTostring(getJsonField(
                                                                                                      conversasRelatorioSearchItem,
                                                                                                      r'''$.Status''',
                                                                                                    )) ==
                                                                                                    'Em Atendimento') {
                                                                                                  return Color(0xFF303F9F);
                                                                                                } else if (functions.jsonTostring(getJsonField(
                                                                                                      conversasRelatorioSearchItem,
                                                                                                      r'''$.Status''',
                                                                                                    )) ==
                                                                                                    'Espera') {
                                                                                                  return Color(0xFFFF9100);
                                                                                                } else if (functions.jsonTostring(getJsonField(
                                                                                                      conversasRelatorioSearchItem,
                                                                                                      r'''$.Status''',
                                                                                                    )) ==
                                                                                                    'Finalizado') {
                                                                                                  return Color(0xFF43A047);
                                                                                                } else if (functions.jsonTostring(getJsonField(
                                                                                                      conversasRelatorioSearchItem,
                                                                                                      r'''$.Status''',
                                                                                                    )) ==
                                                                                                    'Bot') {
                                                                                                  return Color(0xFFFDD835);
                                                                                                } else {
                                                                                                  return Color(0xFF795548);
                                                                                                }
                                                                                              }(),
                                                                                              Color(0xFFFDD835),
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(3.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    conversasRelatorioSearchItem,
                                                                                                    r'''$.Status''',
                                                                                                  )?.toString(),
                                                                                                  'N/A',
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontSize: valueOrDefault<double>(
                                                                                                        () {
                                                                                                          if (functions.jsonTostring(getJsonField(
                                                                                                                conversasRelatorioSearchItem,
                                                                                                                r'''$.Status''',
                                                                                                              )) ==
                                                                                                              'Em Atendimento') {
                                                                                                            return 10.0;
                                                                                                          } else if (functions.jsonTostring(getJsonField(
                                                                                                                conversasRelatorioSearchItem,
                                                                                                                r'''$.Status''',
                                                                                                              )) ==
                                                                                                              'Bot') {
                                                                                                            return 10.0;
                                                                                                          } else {
                                                                                                            return 12.0;
                                                                                                          }
                                                                                                        }(),
                                                                                                        10.0,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 200.0,
                                                                                          height: 50.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (getJsonField(
                                                                                                    conversasRelatorioSearchItem,
                                                                                                    r'''$.foto_contato''',
                                                                                                  ) !=
                                                                                                  null)
                                                                                                Container(
                                                                                                  width: 48.0,
                                                                                                  height: 48.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        conversasRelatorioSearchItem,
                                                                                                        r'''$.foto_contato''',
                                                                                                      )?.toString(),
                                                                                                      'https://picsum.photos/seed/551/600',
                                                                                                    ),
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              if (getJsonField(
                                                                                                    conversasRelatorioSearchItem,
                                                                                                    r'''$.foto_contato''',
                                                                                                  ) ==
                                                                                                  null)
                                                                                                Container(
                                                                                                  width: 48.0,
                                                                                                  height: 48.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.asset(
                                                                                                    'assets/images/unavailable.jpg',
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.nome_contato''',
                                                                                                          )?.toString(),
                                                                                                          'N/A',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        functions.mascararNumero(valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.numero_contato''',
                                                                                                          )?.toString(),
                                                                                                          'N/A',
                                                                                                        )),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 190.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Setor:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        conversasRelatorioSearchItem,
                                                                                                        r'''$.Setor_nomenclatura''',
                                                                                                      )?.toString(),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Conexão:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        conversasRelatorioSearchItem,
                                                                                                        r'''$.conexao_nomenclatura''',
                                                                                                      )?.toString(),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Atendente:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        conversasRelatorioSearchItem,
                                                                                                        r'''$.colabuser_nome''',
                                                                                                      )?.toString(),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 180.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Inicio:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yy HH:mm",
                                                                                                        functions.formatJsonDate(getJsonField(
                                                                                                          conversasRelatorioSearchItem,
                                                                                                          r'''$.created_at''',
                                                                                                        )),
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Fim:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      dateTimeFormat(
                                                                                                        "dd/MM/yy HH:mm",
                                                                                                        functions.formatJsonDate(getJsonField(
                                                                                                          conversasRelatorioSearchItem,
                                                                                                          r'''$.hora_finalizada''',
                                                                                                        )),
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      'N/A',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 140.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Protocolo:',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        () {
                                                                                                          if ((functions.jsonTostring(getJsonField(
                                                                                                                    conversasRelatorioSearchItem,
                                                                                                                    r'''$.Status''',
                                                                                                                  )) ==
                                                                                                                  'Em Atendimento') &&
                                                                                                              !functions.jsonToBoolean(getJsonField(
                                                                                                                conversasRelatorioSearchItem,
                                                                                                                r'''$.istransferida''',
                                                                                                              ))) {
                                                                                                            return getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString();
                                                                                                          } else if (functions.jsonToBoolean(getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.istransferida''',
                                                                                                          ))) {
                                                                                                            return getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.Protocolo''',
                                                                                                            ).toString();
                                                                                                          } else {
                                                                                                            return getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString();
                                                                                                          }
                                                                                                        }(),
                                                                                                        'Atendimento não iniciado.',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 184.0,
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Encaminhar',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: functions.jsonTostring(getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.Status''',
                                                                                                          )) !=
                                                                                                          'Finalizado',
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 36.0,
                                                                                                        hoverIconColor: Color(0xFFFFCA28),
                                                                                                        icon: Icon(
                                                                                                          Icons.compare_arrows_sharp,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 17.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c11 = await actions.getRowByIdConversas(
                                                                                                            getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupEncaminharConversaWidget(
                                                                                                                    conversa: _model.c11!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Encerrar',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: (functions.jsonTostring(getJsonField(
                                                                                                                conversasRelatorioSearchItem,
                                                                                                                r'''$.Status''',
                                                                                                              )) !=
                                                                                                              'Finalizado') &&
                                                                                                          (functions.jsonTostring(getJsonField(
                                                                                                                conversasRelatorioSearchItem,
                                                                                                                r'''$.Status''',
                                                                                                              )) !=
                                                                                                              'Espera'),
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 34.0,
                                                                                                        hoverIconColor: Color(0xFFE53935),
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.phoneSlash,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c22 = await actions.getRowByIdConversas(
                                                                                                            getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupEncerrarConversaWidget(
                                                                                                                    conversa: _model.c22!,
                                                                                                                    administrador: true,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Recusar ',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: Visibility(
                                                                                                      visible: functions.jsonTostring(getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.Status''',
                                                                                                          )) ==
                                                                                                          'Espera',
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        buttonSize: 34.0,
                                                                                                        hoverIconColor: Color(0xFFE53935),
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.phoneSlash,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 14.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.c33 = await actions.getRowByIdConversas(
                                                                                                            getJsonField(
                                                                                                              conversasRelatorioSearchItem,
                                                                                                              r'''$.id''',
                                                                                                            ).toString(),
                                                                                                          );
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: PopupRecusarConversaWidget(
                                                                                                                    conversa: _model.c33!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Histórico',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 20.0,
                                                                                                      buttonSize: 36.0,
                                                                                                      hoverIconColor: Color(0xFF3F51B5),
                                                                                                      icon: Icon(
                                                                                                        Icons.mark_unread_chat_alt,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        _model.c44 = await actions.getRowByIdConversas(
                                                                                                          getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.id''',
                                                                                                          ).toString(),
                                                                                                        );
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: PopupHistoricoWidget(
                                                                                                                  conversa: _model.c44!,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  AlignedTooltip(
                                                                                                    content: Padding(
                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                      child: Text(
                                                                                                        'Informações',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    offset: 4.0,
                                                                                                    preferredDirection: AxisDirection.down,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 4.0,
                                                                                                    tailBaseWidth: 24.0,
                                                                                                    tailLength: 12.0,
                                                                                                    waitDuration: Duration(milliseconds: 100),
                                                                                                    showDuration: Duration(milliseconds: 800),
                                                                                                    triggerMode: TooltipTriggerMode.tap,
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 20.0,
                                                                                                      buttonSize: 36.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.info_outlined,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 18.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        _model.c55 = await actions.getRowByIdConversas(
                                                                                                          getJsonField(
                                                                                                            conversasRelatorioSearchItem,
                                                                                                            r'''$.id''',
                                                                                                          ).toString(),
                                                                                                        );
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: InfoAtendimentosWidget(
                                                                                                                  conversa: _model.c55!,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFE0E0E0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Total atendimentos: ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        _model.searchON
                                                                            ? functions.jsonLength((_model.apiResultvbt?.jsonBody ?? '')).toString()
                                                                            : valueOrDefault<String>(
                                                                                containerViewConversasPorEmpresaRow?.numeroDeConversas?.toString(),
                                                                                '0',
                                                                              ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            lineHeight:
                                                                                1.4,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
