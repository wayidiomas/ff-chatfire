import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'info_conexao_model.dart';
export 'info_conexao_model.dart';

class InfoConexaoWidget extends StatefulWidget {
  const InfoConexaoWidget({
    super.key,
    required this.conexao,
  });

  final ConexoesRow? conexao;

  @override
  State<InfoConexaoWidget> createState() => _InfoConexaoWidgetState();
}

class _InfoConexaoWidgetState extends State<InfoConexaoWidget> {
  late InfoConexaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoConexaoModel());

    _model.textField1TextController ??= TextEditingController();
    _model.textField1FocusNode ??= FocusNode();

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
        width: 480.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informações',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                      Container(
                        width: 107.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 38.0,
                    hoverColor: FlutterFlowTheme.of(context).tertiary,
                    hoverIconColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.conexao?.nome,
                              'Vazio',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Identificador',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              functions.mascararNumero(valueOrDefault<String>(
                                widget!.conexao?.numero,
                                'N/A',
                              )),
                              'N/A',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plataforma',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.conexao?.plataforma,
                              'Vazio',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Setor Principal',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          FutureBuilder<List<SetoresRow>>(
                            future: SetoresTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget!.conexao?.setorPrincipal,
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
                              List<SetoresRow> textSetoresRowList =
                                  snapshot.data!;

                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textSetoresRow =
                                  textSetoresRowList.isNotEmpty
                                      ? textSetoresRowList.first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  textSetoresRow?.nome,
                                  'Sem setor principal',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.conexao!.status!
                                  ? 'Conectada'
                                  : 'Desconectada',
                              'N/A',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Conexão Principal?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.conexao?.setorPrincipal != null
                                  ? 'Sim'
                                  : 'Não',
                              'Não',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (widget!.conexao?.status == true) {
                                  _model.apiResultp2d =
                                      await ChatFireInstanciaGroup
                                          .terminarSessaoCall
                                          .call(
                                    instanceKey:
                                        FFAppState().colabUser.keyColabUser,
                                  );

                                  if ((_model.apiResultp2d?.succeeded ??
                                      true)) {
                                    await ConexoesTable().update(
                                      data: {
                                        'Status': false,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget!.conexao?.id,
                                      ),
                                    );
                                    await SetorConexaoTable().delete(
                                      matchingRows: (rows) => rows.eq(
                                        'id_conexao',
                                        widget!.conexao?.id,
                                      ),
                                    );
                                    Navigator.pop(context);
                                    await action_blocks.alertChatfire(
                                      context,
                                      titulo: 'Conexão desconectada!',
                                      cor: 'verde',
                                    );
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Falha na solicitação!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                } else {
                                  await ConexoesTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget!.conexao?.id,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  await action_blocks.alertChatfire(
                                    context,
                                    titulo: 'Conexão deletada!',
                                    cor: 'vermelho',
                                  );
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              text: widget!.conexao?.status == false
                                  ? 'Deletar'
                                  : 'Desconectar',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 35.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget!.conexao?.status == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Número para teste',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.textField1TextController,
                                      focusNode: _model.textField1FocusNode,
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color: Color(0xFF9E9E9E),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        hintText: 'Digite aqui...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color: Color(0xFF9E9E9E),
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF9E9E9E),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      maxLength: 15,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.phone,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textField1TextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [_model.textField1Mask],
                                    ),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.textField1TextController.text !=
                                          null &&
                                      _model.textField1TextController.text !=
                                          '') {
                                    if (widget!.conexao?.status != true) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    if (!functions.validarNumeroCelular(
                                        _model.textField1TextController.text)) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: PopupErrorContatoWidget(
                                              titulo:
                                                  'Número informado inválido',
                                              info:
                                                  'Este número precisa corresponder a um número brasileiro${functions.newLine()}Exemplo: (11) 91111-1111',
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      FFAppState().numeroValido = false;
                                      FFAppState().fotoValida = false;
                                      FFAppState().fotoPerfilContato =
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.textField1TextController
                                            ?.clear();
                                      });
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  _model.apiResultfmc =
                                      await ChatFireInstanciaGroup
                                          .obterStatusValidandoUsuarioCall
                                          .call(
                                    key: FFAppState().colabUser.keyColabUser,
                                    numeroContato: functions.formatPhoneNumber(
                                        _model.textField1TextController.text),
                                  );

                                  _shouldSetState = true;
                                  if ((_model.apiResultfmc?.succeeded ??
                                      true)) {
                                    if (ChatFireInstanciaGroup
                                            .obterStatusValidandoUsuarioCall
                                            .dataSetAt(
                                          (_model.apiResultfmc?.jsonBody ?? ''),
                                        ) ==
                                        '1970-01-01T00:00:00.000Z') {
                                      _model.apiResultlo90 =
                                          await ChatFireMensagemGroup
                                              .enviarMensagemCall
                                              .call(
                                        instanceKey:
                                            FFAppState().colabUser.keyColabUser,
                                        id: functions.ajustarNonoDigito9(_model
                                            .textField1TextController.text),
                                        message:
                                            'Atenção${functions.newLine()}Esse é um disparo de teste da plataforma ChatFire!            ${functions.newLine()}${'Empresa: ${FFAppState().colabUser.nomeEmpresa}'}${functions.newLine()}${'Conexão:${widget!.conexao?.nome}'}${functions.newLine()}${'Número: ${functions.mascararNumero(widget!.conexao!.numero!)}'}',
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultlo90?.succeeded ??
                                          true)) {
                                        safeSetState(() {
                                          _model.textField1TextController
                                              ?.clear();
                                        });
                                        Navigator.pop(context);
                                        await action_blocks.alertChatfire(
                                          context,
                                          titulo: 'Mensagem enviada!',
                                          cor: 'azul',
                                        );
                                        safeSetState(() {});
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: PopupErrorAPIWidget(),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    } else {
                                      _model.apiResultlo9 =
                                          await ChatFireMensagemGroup
                                              .enviarMensagemCall
                                              .call(
                                        instanceKey:
                                            FFAppState().colabUser.keyColabUser,
                                        id: '55${functions.formatarNumero(_model.textField1TextController.text)}',
                                        message:
                                            'Atenção${functions.newLine()}Esse é um disparo de teste da plataforma ChatFire!            ${functions.newLine()}${'Empresa: ${FFAppState().colabUser.nomeEmpresa}'}${functions.newLine()}${'Conexão:${widget!.conexao?.nome}'}${functions.newLine()}${'Número: ${functions.mascararNumero(widget!.conexao!.numero!)}'}',
                                      );

                                      _shouldSetState = true;
                                      if ((_model.apiResultlo9?.succeeded ??
                                          true)) {
                                        safeSetState(() {
                                          _model.textField1TextController
                                              ?.clear();
                                        });
                                        Navigator.pop(context);
                                        await action_blocks.alertChatfire(
                                          context,
                                          titulo: 'Mensagem enviada!',
                                          cor: 'azul',
                                        );
                                        safeSetState(() {});
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: PopupErrorAPIWidget(),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    }
                                  } else if (ChatFireInstanciaGroup
                                          .obterStatusValidandoUsuarioCall
                                          .mensagemErro(
                                        (_model.apiResultfmc?.jsonBody ?? ''),
                                      ) ==
                                      'TypeError: Cannot read properties of undefined (reading \'toString\')') {
                                    _model.apiResultlo908 =
                                        await ChatFireMensagemGroup
                                            .enviarMensagemCall
                                            .call(
                                      instanceKey:
                                          FFAppState().colabUser.keyColabUser,
                                      id: functions.formatPhoneNumber(
                                          _model.textField1TextController.text),
                                      message:
                                          'Atenção${functions.newLine()}Esse é um disparo de teste da plataforma ChatFire!            ${functions.newLine()}${'Empresa: ${FFAppState().colabUser.nomeEmpresa}'}${functions.newLine()}${'Conexão:${widget!.conexao?.nome}'}${functions.newLine()}${'Número: ${functions.mascararNumero(widget!.conexao!.numero!)}'}',
                                    );

                                    _shouldSetState = true;
                                    if ((_model.apiResultlo908?.succeeded ??
                                        true)) {
                                      safeSetState(() {
                                        _model.textField1TextController
                                            ?.clear();
                                      });
                                      Navigator.pop(context);
                                      await action_blocks.alertChatfire(
                                        context,
                                        titulo: 'Mensagem enviada!',
                                        cor: 'azul',
                                      );
                                      safeSetState(() {});
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: PopupErrorAPIWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  } else if ((ChatFireInstanciaGroup
                                              .obterStatusValidandoUsuarioCall
                                              .mensagemErro(
                                            (_model.apiResultfmc?.jsonBody ??
                                                ''),
                                          ) !=
                                          'TypeError: Cannot read properties of undefined (reading \'toString\')') &&
                                      ChatFireInstanciaGroup
                                          .obterStatusValidandoUsuarioCall
                                          .isErro(
                                        (_model.apiResultfmc?.jsonBody ?? ''),
                                      )!) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: PopupErrorContatoWidget(
                                            titulo: 'Número informado inválido',
                                            info: 'Este número não existe.',
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Enviar disparo',
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: widget!.conexao?.status == false
                                      ? Color(0xFF9E9E9E)
                                      : FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
