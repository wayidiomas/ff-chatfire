import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'contatos_criar_model.dart';
export 'contatos_criar_model.dart';

class ContatosCriarWidget extends StatefulWidget {
  const ContatosCriarWidget({
    super.key,
    required this.callback,
    this.tela,
    this.callbackClose,
  });

  final Future Function(ContatosRow? contato)? callback;
  final String? tela;
  final Future Function()? callbackClose;

  @override
  State<ContatosCriarWidget> createState() => _ContatosCriarWidgetState();
}

class _ContatosCriarWidgetState extends State<ContatosCriarWidget> {
  late ContatosCriarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContatosCriarModel());

    _model.textFieldiTelenfoneTextController ??= TextEditingController();
    _model.textFieldiTelenfoneFocusNode ??= FocusNode();

    _model.textFieldcriar1TextController ??= TextEditingController();
    _model.textFieldcriar1FocusNode ??= FocusNode();

    _model.textFieldplataformacriarTextController ??= TextEditingController();
    _model.textFieldplataformacriarFocusNode ??= FocusNode();

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Preencha os campos conforme a necessidade e confirme para adicionar a lista de contatos.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: Color(0xFF284273),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  'Perfil',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: Color(0xFFA6A6A6),
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().fotoValida)
                          Container(
                            width: 100.0,
                            height: 100.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                FFAppState().fotoPerfilContato,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg',
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (!FFAppState().fotoValida)
                          Container(
                            width: 100.0,
                            height: 100.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.memory(
                              _model.uploadedLocalFile1.bytes ??
                                  Uint8List.fromList([]),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (!FFAppState().fotoValida)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile1 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }
                              },
                              text: 'Inserir imagem',
                              options: FFButtonOptions(
                                height: 30.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 14.0,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      child: TextFormField(
                                        controller: _model
                                            .textFieldiTelenfoneTextController,
                                        focusNode:
                                            _model.textFieldiTelenfoneFocusNode,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        readOnly: FFAppState().numeroValido,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Telefone',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
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
                                              color: _model.vermelho
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondary
                                                  : Color(0xFFC4C4C4),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: valueOrDefault<Color>(
                                            FFAppState().numeroValido
                                                ? Color(0xFFF5F5F5)
                                                : Colors.white,
                                            Colors.white,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.0,
                                            ),
                                        maxLength: 15,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.phone,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        validator: _model
                                            .textFieldiTelenfoneTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.textFieldiTelenfoneMask
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (FFAppState().numeroValido) {
                                          FFAppState().numeroValido = false;
                                          FFAppState().fotoValida = false;
                                          FFAppState().fotoPerfilContato =
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model
                                                .textFieldiTelenfoneTextController
                                                ?.clear();
                                          });
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (!functions.validarNumeroCelular(_model
                                              .textFieldiTelenfoneTextController
                                              .text)) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      PopupErrorContatoWidget(
                                                    titulo:
                                                        'Número nao encontrado',
                                                    info:
                                                        'Este número precisa corresponder a um número brasileiro${functions.newLine()}Exemplo: (11) 91111-1111',
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            FFAppState().numeroValido = false;
                                            FFAppState().fotoValida = false;
                                            FFAppState().fotoPerfilContato =
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model
                                                  .textFieldiTelenfoneTextController
                                                  ?.clear();
                                            });
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.apiResultjn299 =
                                            await ChatFireInstanciaGroup
                                                .obterStatusValidandoUsuarioCall
                                                .call(
                                          key: FFAppState()
                                              .colabUser
                                              .keyColabUser,
                                          numeroContato:
                                              functions.formatPhoneNumber(_model
                                                  .textFieldiTelenfoneTextController
                                                  .text),
                                        );

                                        _shouldSetState = true;
                                        if ((_model.apiResultjn299?.succeeded ??
                                            true)) {
                                          if (ChatFireInstanciaGroup
                                                  .obterStatusValidandoUsuarioCall
                                                  .dataSetAt(
                                                (_model.apiResultjn299
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              '1970-01-01T00:00:00.000Z') {
                                            await action_blocks
                                                .fluxpAPIFotoContato(
                                              context,
                                              numero: functions
                                                  .ajustarNonoDigito9(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            safeSetState(() {});
                                            _model.verificarresult1 =
                                                await action_blocks
                                                    .verificarContato(
                                              context,
                                              numero: functions
                                                  .ajustarNonoDigito9(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            _shouldSetState = true;
                                            if (_model.verificarresult1!) {
                                              FFAppState().numeroValido = false;
                                              FFAppState().fotoValida = false;
                                              FFAppState().fotoPerfilContato =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .textFieldiTelenfoneTextController
                                                    ?.clear();
                                              });
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          } else {
                                            await action_blocks
                                                .fluxpAPIFotoContato(
                                              context,
                                              numero: functions
                                                  .formatPhoneNumber(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            safeSetState(() {});
                                            _model.verificarresult12 =
                                                await action_blocks
                                                    .verificarContato(
                                              context,
                                              numero: functions
                                                  .formatPhoneNumber(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            _shouldSetState = true;
                                            if (_model.verificarresult12!) {
                                              FFAppState().numeroValido = false;
                                              FFAppState().fotoValida = false;
                                              FFAppState().fotoPerfilContato =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .textFieldiTelenfoneTextController
                                                    ?.clear();
                                              });
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.vermelho = false;
                                          safeSetState(() {});
                                        } else {
                                          if (ChatFireInstanciaGroup
                                                  .obterStatusValidandoUsuarioCall
                                                  .mensagemErro(
                                                (_model.apiResultjn299
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              'TypeError: Cannot read properties of undefined (reading \'toString\')') {
                                            await action_blocks
                                                .fluxpAPIFotoContato(
                                              context,
                                              numero: functions
                                                  .formatPhoneNumber(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            safeSetState(() {});
                                            _model.verificarresult2 =
                                                await action_blocks
                                                    .verificarContato(
                                              context,
                                              numero: functions
                                                  .formatPhoneNumber(_model
                                                      .textFieldiTelenfoneTextController
                                                      .text),
                                            );
                                            _shouldSetState = true;
                                            if (_model.verificarresult2!) {
                                              FFAppState().numeroValido = false;
                                              FFAppState().fotoValida = false;
                                              FFAppState().fotoPerfilContato =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .textFieldiTelenfoneTextController
                                                    ?.clear();
                                              });
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        PopupErrorContatoWidget(
                                                      titulo:
                                                          'Este número ativou as políticas e privacidade.',
                                                      info:
                                                          'insira manualmente a foto de perfil e nome do contato',
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }

                                            _model.vermelho = false;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().numeroValido = false;
                                            safeSetState(() {});
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      PopupErrorContatoWidget(
                                                    titulo:
                                                        'Número nao encontrado',
                                                    info:
                                                        'Não foi encotrado uma conta de WhatsApp associado a esse número',
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: valueOrDefault<String>(
                                        FFAppState().numeroValido
                                            ? 'Limpar'
                                            : 'Buscar',
                                        'Buscar',
                                      ),
                                      options: FFButtonOptions(
                                        width: 110.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: _model.vermelho
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondary
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: _model.vermelho
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: TextFormField(
                                controller:
                                    _model.textFieldcriar1TextController,
                                focusNode: _model.textFieldcriar1FocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC4C4C4),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                      lineHeight: 1.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                validator: _model
                                    .textFieldcriar1TextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model
                                    .textFieldplataformacriarTextController,
                                focusNode:
                                    _model.textFieldplataformacriarFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.go,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC4C4C4),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                      lineHeight: 1.0,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                validator: _model
                                    .textFieldplataformacriarTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      safeSetState(() {
                        _model.textFieldiTelenfoneTextController?.clear();
                        _model.textFieldcriar1TextController?.clear();
                        _model.textFieldplataformacriarTextController?.clear();
                      });
                      FFAppState().numeroValido = false;
                      FFAppState().fotoValida = false;
                      safeSetState(() {});
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      width: 110.0,
                      height: 35.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  if (!FFAppState().fotoValida)
                    FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().numeroValido) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (functions.listContainsString(
                              functions.ajustarNonoDigito9(_model
                                  .textFieldiTelenfoneTextController.text),
                              FFAppState().conexoesEmpresa.toList())!) {
                            _model.isConexao = true;
                            safeSetState(() {});
                          } else {
                            _model.isConexao = false;
                            safeSetState(() {});
                          }

                          if (_model.uploadedLocalFile1 != null &&
                              (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                  false)) {
                            {
                              safeSetState(
                                  () => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedFiles = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles =
                                    _model.uploadedLocalFile1.bytes!.isNotEmpty
                                        ? [_model.uploadedLocalFile1]
                                        : <FFUploadedFile>[];
                                selectedFiles = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                  storageFolderPath: 'Fotos contatos',
                                );
                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'Imagens',
                                  selectedFiles: selectedFiles,
                                );
                              } finally {
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedFiles.length &&
                                  downloadUrls.length == selectedFiles.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }
                          }
                          if (ChatFireInstanciaGroup
                                  .obterStatusValidandoUsuarioCall
                                  .dataSetAt(
                                (_model.apiResultjn299?.jsonBody ?? ''),
                              ) ==
                              '1970-01-01T00:00:00.000Z') {
                            _model.c4 = await ContatosTable().insert({
                              'nome': _model.textFieldcriar1TextController.text,
                              'numero': functions.ajustarNonoDigito9(_model
                                  .textFieldiTelenfoneTextController.text),
                              'email': _model
                                  .textFieldplataformacriarTextController.text,
                              'foto': _model.uploadedFileUrl2,
                              'ref_empresa': FFAppState().colabUser.refEmpresa,
                              'numero_relatorios':
                                  _model.textFieldiTelenfoneTextController.text,
                              'status_conversa': 'Visualizar',
                              'isconexao': _model.isConexao,
                            });
                            if (_model.isConexao) {
                              if (widget!.tela == 'adminContato') {
                                await widget.callbackClose?.call();
                              }
                            } else {
                              await widget.callback?.call(
                                _model.c4,
                              );
                            }
                          } else if (ChatFireInstanciaGroup
                                  .obterStatusValidandoUsuarioCall
                                  .dataSetAt(
                                (_model.apiResultjn299?.jsonBody ?? ''),
                              ) !=
                              '1970-01-01T00:00:00.000Z') {
                            _model.c5 = await ContatosTable().insert({
                              'nome': _model.textFieldcriar1TextController.text,
                              'numero':
                                  '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                              'email': _model
                                  .textFieldplataformacriarTextController.text,
                              'foto': _model.uploadedFileUrl2,
                              'ref_empresa': FFAppState().colabUser.refEmpresa,
                              'status_conversa': 'Visualizar',
                              'numero_relatorios':
                                  _model.textFieldiTelenfoneTextController.text,
                              'isconexao': _model.isConexao,
                            });
                            if (_model.isConexao) {
                              if (widget!.tela == 'adminContato') {
                                await widget.callbackClose?.call();
                              }
                            } else {
                              await widget.callback?.call(
                                _model.c5,
                              );
                            }
                          } else if (ChatFireInstanciaGroup
                                  .obterStatusValidandoUsuarioCall
                                  .mensagemErro(
                                (_model.apiResultjn299?.jsonBody ?? ''),
                              ) ==
                              'TypeError: Cannot read properties of undefined (reading \'toString\')') {
                            _model.c6 = await ContatosTable().insert({
                              'nome': _model.textFieldcriar1TextController.text,
                              'numero':
                                  '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                              'email': _model
                                  .textFieldplataformacriarTextController.text,
                              'foto': _model.uploadedFileUrl2,
                              'ref_empresa': FFAppState().colabUser.refEmpresa,
                              'status_conversa': 'Visualizar',
                              'numero_relatorios':
                                  _model.textFieldiTelenfoneTextController.text,
                              'isconexao': _model.isConexao,
                            });
                            if (_model.isConexao) {
                              if (widget!.tela == 'adminContato') {
                                await widget.callbackClose?.call();
                              }
                            } else {
                              await widget.callback?.call(
                                _model.c6,
                              );
                            }
                          }

                          FFAppState().numeroValido = false;
                          FFAppState().fotoValida = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.textFieldiTelenfoneTextController?.clear();
                            _model.textFieldcriar1TextController?.clear();
                            _model.textFieldplataformacriarTextController
                                ?.clear();
                          });
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00FFFFFF),
                            barrierColor: Color(0x00FFFFFF),
                            enableDrag: false,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: AlertChatfireWidget(
                                    titulo: 'Contato salvo',
                                    texto: 'contato salvo com sucesso',
                                    cor: FlutterFlowTheme.of(context).success,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.vermelho = true;
                          safeSetState(() {});
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PopupErrorContatoWidget(
                                  titulo: 'Precione \"Buscar\"',
                                  info:
                                      'Clique em buscar para validar o número no Whatsapp',
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }

                        safeSetState(() {});
                      },
                      text: 'Salvar',
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 35.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  if (FFAppState().fotoValida)
                    FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().numeroValido) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (functions.listContainsString(
                              functions.ajustarNonoDigito9(_model
                                  .textFieldiTelenfoneTextController.text),
                              FFAppState().conexoesEmpresa.toList())!) {
                            _model.isConexao = true;
                            safeSetState(() {});
                          } else {
                            _model.isConexao = false;
                            safeSetState(() {});
                          }

                          if (!(_model.uploadedLocalFile1 != null &&
                              (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                  false))) {
                            if (ChatFireInstanciaGroup
                                    .obterStatusValidandoUsuarioCall
                                    .dataSetAt(
                                  (_model.apiResultjn299?.jsonBody ?? ''),
                                ) ==
                                '1970-01-01T00:00:00.000Z') {
                              if (_model.isConexao) {
                                _model.c12 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero': functions.ajustarNonoDigito9(_model
                                      .textFieldiTelenfoneTextController.text),
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'numero_relatorios': _model
                                      .textFieldiTelenfoneTextController.text,
                                  'status_conversa': 'Visualizar',
                                  'isconexao': true,
                                });
                                if (widget!.tela == 'adminContato') {
                                  await widget.callbackClose?.call();
                                }
                              } else {
                                _model.c1 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero': functions.ajustarNonoDigito9(_model
                                      .textFieldiTelenfoneTextController.text),
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'numero_relatorios': _model
                                      .textFieldiTelenfoneTextController.text,
                                  'status_conversa': 'Visualizar',
                                  'isconexao': false,
                                });
                                await widget.callback?.call(
                                  _model.c1,
                                );
                              }
                            } else if (ChatFireInstanciaGroup
                                    .obterStatusValidandoUsuarioCall
                                    .dataSetAt(
                                  (_model.apiResultjn299?.jsonBody ?? ''),
                                ) !=
                                '1970-01-01T00:00:00.000Z') {
                              if (_model.isConexao) {
                                _model.c22 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'status_conversa': 'Visualizar',
                                  'numero_relatorios': _model
                                      .textFieldiTelenfoneTextController.text,
                                  'isconexao': true,
                                });
                                if (widget!.tela == 'adminContato') {
                                  await widget.callbackClose?.call();
                                }
                              } else {
                                _model.c2 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'status_conversa': 'Visualizar',
                                  'numero_relatorios': _model
                                      .textFieldiTelenfoneTextController.text,
                                  'isconexao': false,
                                });
                                await widget.callback?.call(
                                  _model.c2,
                                );
                              }
                            } else if (ChatFireInstanciaGroup
                                    .obterStatusValidandoUsuarioCall
                                    .mensagemErro(
                                  (_model.apiResultjn299?.jsonBody ?? ''),
                                ) ==
                                'TypeError: Cannot read properties of undefined (reading \'toString\')') {
                              if (_model.isConexao) {
                                _model.c33 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'status_conversa': 'Visualizar',
                                  'numero_relatorios':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'isconexao': true,
                                });
                                if (widget!.tela == 'adminContato') {
                                  await widget.callbackClose?.call();
                                }
                              } else {
                                _model.c3 = await ContatosTable().insert({
                                  'nome':
                                      _model.textFieldcriar1TextController.text,
                                  'numero':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'email': _model
                                      .textFieldplataformacriarTextController
                                      .text,
                                  'foto': FFAppState().fotoPerfilContato,
                                  'ref_empresa':
                                      FFAppState().colabUser.refEmpresa,
                                  'status_conversa': 'Visualizar',
                                  'numero_relatorios':
                                      '55${functions.formatarNumero(_model.textFieldiTelenfoneTextController.text)}',
                                  'isconexao': false,
                                });
                                await widget.callback?.call(
                                  _model.c3,
                                );
                              }
                            }

                            FFAppState().fotoValida = false;
                            FFAppState().numeroValido = false;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textFieldiTelenfoneTextController?.clear();
                              _model.textFieldcriar1TextController?.clear();
                              _model.textFieldplataformacriarTextController
                                  ?.clear();
                            });
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x00FFFFFF),
                              barrierColor: Color(0x00FFFFFF),
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: AlertChatfireWidget(
                                      titulo: 'Contato salvo',
                                      texto: 'contato salvo com sucesso',
                                      cor: FlutterFlowTheme.of(context).success,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        } else {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.vermelho = true;
                          safeSetState(() {});
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PopupErrorContatoWidget(
                                  titulo: 'Precione \"Buscar\"',
                                  info:
                                      'Clique em buscar para validar o número no Whatsapp',
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }

                        safeSetState(() {});
                      },
                      text: 'Salvar',
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 35.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                ].divide(SizedBox(width: 20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
