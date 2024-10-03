import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/contatos_criar_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/components/shimmer_effectsolo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_chat_contatos_model.dart';
export 'popup_chat_contatos_model.dart';

class PopupChatContatosWidget extends StatefulWidget {
  const PopupChatContatosWidget({
    super.key,
    int? tab,
    bool? encaminharContatos,
  })  : this.tab = tab ?? 1,
        this.encaminharContatos = encaminharContatos ?? false;

  final int tab;
  final bool encaminharContatos;

  @override
  State<PopupChatContatosWidget> createState() =>
      _PopupChatContatosWidgetState();
}

class _PopupChatContatosWidgetState extends State<PopupChatContatosWidget>
    with TickerProviderStateMixin {
  late PopupChatContatosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupChatContatosModel());

    _model.tabBarChatContatosController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));
    _model.textFieldbuscarpopTextController ??= TextEditingController();
    _model.textFieldbuscarpopFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 600.0,
        height: 580.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    hoverColor: FlutterFlowTheme.of(context).tertiary,
                    hoverIconColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                      safeSetState(() {
                        _model.contatosCriarModel
                            .textFieldiTelenfoneTextController
                            ?.clear();
                        _model.contatosCriarModel
                            .textFieldplataformacriarTextController
                            ?.clear();
                        _model.contatosCriarModel.textFieldcriar1TextController
                            ?.clear();
                      });
                      FFAppState().numeroValido = false;
                      FFAppState().fotoValida = false;
                      safeSetState(() {});
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: 'Novo Contato',
                          ),
                          Tab(
                            text: 'Contatos',
                          ),
                        ],
                        controller: _model.tabBarChatContatosController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarChatContatosController,
                        children: [
                          wrapWithModel(
                            model: _model.contatosCriarModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: ContatosCriarWidget(
                              tela: 'ChatContatos',
                              callback: (contato) async {
                                _model.criarConversacallback =
                                    await ConversasTable().insert({
                                  'ref_contatos': contato?.id,
                                  'nome_contato': contato?.nome,
                                  'foto_contato': contato?.foto,
                                  'Protocolo': 'Atendimento não iniciado',
                                  'numero_contato': contato?.numero,
                                  'Status': 'Visualizar',
                                  'id_setor': FFAppState()
                                      .colabUser
                                      .setoresUsers
                                      .first
                                      .setorId,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'colabuser_nome': FFAppState().colabUser.nome,
                                  'isdeleted_conversas': true,
                                  'key_instancia':
                                      FFAppState().colabUser.keyColabUser,
                                  'id_api': random_data.randomString(
                                    30,
                                    30,
                                    true,
                                    true,
                                    true,
                                  ),
                                });
                                Navigator.pop(
                                    context, _model.criarConversacallback);

                                safeSetState(() {});
                              },
                              callbackClose: () async {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 10.0, 8.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Pesquisar nome',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: 255.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldbuscarpopTextController,
                                                        focusNode: _model
                                                            .textFieldbuscarpopFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldbuscarpopTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            if (_model.textFieldbuscarpopTextController
                                                                        .text !=
                                                                    null &&
                                                                _model.textFieldbuscarpopTextController
                                                                        .text !=
                                                                    '') {
                                                              _model.apiResult89rh =
                                                                  await SearchChatFireGroup
                                                                      .searchContatosCall
                                                                      .call(
                                                                searchText: _model
                                                                    .textFieldbuscarpopTextController
                                                                    .text,
                                                                refEmpresa:
                                                                    FFAppState()
                                                                        .colabUser
                                                                        .refEmpresa,
                                                              );

                                                              if ((_model
                                                                      .apiResult89rh
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.pesquisapop =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          PopupErrorAPIWidget(),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            } else {
                                                              _model.pesquisapop =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Inter'),
                                                                  ),
                                                          hintText: 'Buscar...',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    color: Color(
                                                                        0xFF08365A),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          prefixIcon: Icon(
                                                            Icons.search,
                                                            color: Color(
                                                                0x4E000000),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFF08365A),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Inter'),
                                                                ),
                                                        cursorColor:
                                                            Color(0x73000000),
                                                        validator: _model
                                                            .textFieldbuscarpopTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.pesquisapop ==
                                                      false)
                                                    Icon(
                                                      Icons.filter_alt_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  if (_model.pesquisapop ==
                                                      true)
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.pesquisapop =
                                                            false;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .textFieldbuscarpopTextController
                                                              ?.clear();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .filter_alt_off_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 6.0)),
                                          ),
                                        ].divide(SizedBox(width: 24.0)),
                                      ),
                                    ),
                                  ),
                                  if (_model.pesquisapop == false)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: FutureBuilder<List<ContatosRow>>(
                                          future: ContatosTable().queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'ref_empresa',
                                                  FFAppState()
                                                      .colabUser
                                                      .refEmpresa,
                                                )
                                                .eq(
                                                  'isconexao',
                                                  false,
                                                ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return ShimmerEffectWidget();
                                            }
                                            List<ContatosRow>
                                                listViewOffContatosRowList =
                                                snapshot.data!;

                                            if (listViewOffContatosRowList
                                                .isEmpty) {
                                              return Center(
                                                child: ListasemdadosWidget(),
                                              );
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewOffContatosRowList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewOffIndex) {
                                                final listViewOffContatosRow =
                                                    listViewOffContatosRowList[
                                                        listViewOffIndex];
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 76.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 140.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (listViewOffContatosRow
                                                                          .foto !=
                                                                      null &&
                                                                  listViewOffContatosRow
                                                                          .foto !=
                                                                      '')
                                                                Container(
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewOffContatosRow
                                                                          .foto,
                                                                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx1c2VyfGVufDB8fHx8MTcwMDA4MzQ1OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (listViewOffContatosRow
                                                                          .foto ==
                                                                      null ||
                                                                  listViewOffContatosRow
                                                                          .foto ==
                                                                      '')
                                                                Container(
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/unavailable.jpg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewOffContatosRow
                                                                          .nome,
                                                                      'vazio',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewOffContatosRow
                                                                      .numeroRelatorios,
                                                                  'N/A',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                if (((listViewOffContatosRow.statusConversa == 'Finalizado') ||
                                                                        (listViewOffContatosRow.statusConversa ==
                                                                            'Visualizar') ||
                                                                        (listViewOffContatosRow.statusConversa ==
                                                                                null ||
                                                                            listViewOffContatosRow.statusConversa ==
                                                                                '') ||
                                                                        (listViewOffContatosRow.statusConversa ==
                                                                            'Bot')) &&
                                                                    !widget!
                                                                        .encaminharContatos)
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.criarConversa1 =
                                                                          await ConversasTable()
                                                                              .insert({
                                                                        'ref_contatos':
                                                                            listViewOffContatosRow.id,
                                                                        'nome_contato':
                                                                            listViewOffContatosRow.nome,
                                                                        'foto_contato':
                                                                            listViewOffContatosRow.foto,
                                                                        'Protocolo':
                                                                            'Atendimento não iniciado',
                                                                        'numero_contato':
                                                                            listViewOffContatosRow.numero,
                                                                        'Status':
                                                                            'Visualizar',
                                                                        'id_setor': FFAppState()
                                                                            .colabUser
                                                                            .setoresUsers
                                                                            .first
                                                                            .setorId,
                                                                        'ref_empresa': FFAppState()
                                                                            .colabUser
                                                                            .refEmpresa,
                                                                        'colabuser_nome': FFAppState()
                                                                            .colabUser
                                                                            .nome,
                                                                        'isdeleted_conversas':
                                                                            true,
                                                                        'key_instancia': FFAppState()
                                                                            .colabUser
                                                                            .keyColabUser,
                                                                        'id_api':
                                                                            random_data.randomString(
                                                                          30,
                                                                          30,
                                                                          true,
                                                                          true,
                                                                          true,
                                                                        ),
                                                                      });
                                                                      Navigator.pop(
                                                                          context,
                                                                          _model
                                                                              .criarConversa1);

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Visualizar',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                if (((listViewOffContatosRow.statusConversa ==
                                                                            'Em Atendimento') ||
                                                                        (listViewOffContatosRow.statusConversa ==
                                                                            'Espera')) &&
                                                                    !widget!
                                                                        .encaminharContatos)
                                                                  Flexible(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.lookUpConversas =
                                                                            await actions.getRowByIdConversas(
                                                                          listViewOffContatosRow
                                                                              .refConversa
                                                                              ?.toString(),
                                                                        );
                                                                        Navigator.pop(
                                                                            context,
                                                                            _model.lookUpConversas);

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Visualizar',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (widget!
                                                                    .encaminharContatos)
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState().contatoEncaminhar =
                                                                              listViewOffContatosRow.id;
                                                                          FFAppState().contatoEncaminharNome =
                                                                              listViewOffContatosRow.nome!;
                                                                          FFAppState().contatoEncaminharNumero =
                                                                              listViewOffContatosRow.numero!;
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        text:
                                                                            'Encaminhar',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 14.0)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (_model.pesquisapop == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final apiresults =
                                              (_model.apiResult89rh?.jsonBody ??
                                                      '')
                                                  .toList();
                                          if (apiresults.isEmpty) {
                                            return Center(
                                              child: ListasemdadosWidget(),
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: apiresults.length,
                                            itemBuilder:
                                                (context, apiresultsIndex) {
                                              final apiresultsItem =
                                                  apiresults[apiresultsIndex];
                                              return FutureBuilder<
                                                  List<ContatosRow>>(
                                                future: ContatosTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eq(
                                                    'id',
                                                    getJsonField(
                                                      apiresultsItem,
                                                      r'''$.id''',
                                                    ),
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerEffectsoloWidget();
                                                  }
                                                  List<ContatosRow>
                                                      containerContatosRowList =
                                                      snapshot.data!;

                                                  final containerContatosRow =
                                                      containerContatosRowList
                                                              .isNotEmpty
                                                          ? containerContatosRowList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 76.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            width: 140.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (containerContatosRow
                                                                            ?.foto !=
                                                                        null &&
                                                                    containerContatosRow
                                                                            ?.foto !=
                                                                        '')
                                                                  Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerContatosRow
                                                                            ?.foto,
                                                                        'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHx1c2VyfGVufDB8fHx8MTY5NjcwNTEzMXww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.jpg',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (containerContatosRow
                                                                            ?.foto ==
                                                                        null ||
                                                                    containerContatosRow
                                                                            ?.foto ==
                                                                        '')
                                                                  Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/unavailable.jpg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerContatosRow
                                                                            ?.nome,
                                                                        'vazio',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                              width: 120.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerContatosRow
                                                                        ?.numeroRelatorios,
                                                                    'N/A',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (containerContatosRow
                                                                  ?.statusConversa !=
                                                              'Em Atendimento')
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.criarConversaS =
                                                                    await ConversasTable()
                                                                        .insert({
                                                                  'ref_contatos':
                                                                      containerContatosRow
                                                                          ?.id,
                                                                  'nome_contato':
                                                                      containerContatosRow
                                                                          ?.nome,
                                                                  'foto_contato':
                                                                      containerContatosRow
                                                                          ?.foto,
                                                                  'Protocolo':
                                                                      random_data
                                                                          .randomString(
                                                                    6,
                                                                    6,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  ),
                                                                  'numero_contato':
                                                                      containerContatosRow
                                                                          ?.numero,
                                                                  'Status':
                                                                      'Em Atendimento',
                                                                  'id_setor':
                                                                      FFAppState()
                                                                          .colabUser
                                                                          .idSetor,
                                                                  'ref_empresa':
                                                                      FFAppState()
                                                                          .colabUser
                                                                          .refEmpresa,
                                                                  'colabuser_nome':
                                                                      FFAppState()
                                                                          .colabUser
                                                                          .nome,
                                                                  'authid':
                                                                      currentUserUid,
                                                                  'key_instancia':
                                                                      FFAppState()
                                                                          .colabUser
                                                                          .keyColabUser,
                                                                  'id_api':
                                                                      random_data
                                                                          .randomString(
                                                                    30,
                                                                    30,
                                                                    true,
                                                                    true,
                                                                    true,
                                                                  ),
                                                                });
                                                                await ContatosTable()
                                                                    .update(
                                                                  data: {
                                                                    'ref_conversa':
                                                                        _model
                                                                            .criarConversaS
                                                                            ?.id,
                                                                    'conversa_ativa':
                                                                        true,
                                                                    'status_conversa':
                                                                        'Em Atendimento',
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'id',
                                                                    _model
                                                                        .criarConversaS
                                                                        ?.id,
                                                                  ),
                                                                );
                                                                Navigator.pop(
                                                                    context,
                                                                    _model
                                                                        .criarConversaS);

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: 'Iniciar',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 120.0,
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  if ((containerContatosRow?.statusConversa == 'Finalizado') ||
                                                                      (containerContatosRow
                                                                              ?.statusConversa ==
                                                                          'Visualizar') ||
                                                                      (containerContatosRow?.statusConversa ==
                                                                              null ||
                                                                          containerContatosRow?.statusConversa ==
                                                                              '') ||
                                                                      (containerContatosRow
                                                                              ?.statusConversa ==
                                                                          'Bot'))
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.criarConversa2 =
                                                                            await ConversasTable().insert({
                                                                          'ref_contatos':
                                                                              containerContatosRow?.id,
                                                                          'nome_contato':
                                                                              containerContatosRow?.nome,
                                                                          'foto_contato':
                                                                              containerContatosRow?.foto,
                                                                          'Protocolo':
                                                                              'Atendimento não iniciado',
                                                                          'numero_contato':
                                                                              containerContatosRow?.numero,
                                                                          'Status':
                                                                              'Visualizar',
                                                                          'id_setor': FFAppState()
                                                                              .colabUser
                                                                              .idSetor,
                                                                          'ref_empresa': FFAppState()
                                                                              .colabUser
                                                                              .refEmpresa,
                                                                          'colabuser_nome': FFAppState()
                                                                              .colabUser
                                                                              .nome,
                                                                          'isdeleted_conversas':
                                                                              true,
                                                                          'key_instancia': FFAppState()
                                                                              .colabUser
                                                                              .keyColabUser,
                                                                          'id_api':
                                                                              random_data.randomString(
                                                                            30,
                                                                            30,
                                                                            true,
                                                                            true,
                                                                            true,
                                                                          ),
                                                                        });
                                                                        Navigator.pop(
                                                                            context,
                                                                            _model.criarConversa2);

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Visualizar',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  if ((containerContatosRow
                                                                              ?.statusConversa ==
                                                                          'Em Atendimento') ||
                                                                      (containerContatosRow
                                                                              ?.statusConversa ==
                                                                          'Espera'))
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            _model.lookUpConversas2 =
                                                                                await actions.getRowByIdConversas(
                                                                              containerContatosRow?.refConversa?.toString(),
                                                                            );
                                                                            Navigator.pop(context,
                                                                                _model.lookUpConversas2);

                                                                            safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              'Visualizar',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                120.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 20.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
