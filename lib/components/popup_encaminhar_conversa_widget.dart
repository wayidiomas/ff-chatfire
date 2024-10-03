import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_encaminhar_conversa_model.dart';
export 'popup_encaminhar_conversa_model.dart';

class PopupEncaminharConversaWidget extends StatefulWidget {
  const PopupEncaminharConversaWidget({
    super.key,
    required this.conversa,
  });

  final ConversasRow? conversa;

  @override
  State<PopupEncaminharConversaWidget> createState() =>
      _PopupEncaminharConversaWidgetState();
}

class _PopupEncaminharConversaWidgetState
    extends State<PopupEncaminharConversaWidget> {
  late PopupEncaminharConversaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupEncaminharConversaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultzie = await GetDataGroup.getSetorPorConexaoCall.call(
        key: widget!.conversa?.keyInstancia,
      );

      if ((_model.apiResultzie?.succeeded ?? true)) {
        _model.setoresConexao = ((_model.apiResultzie?.jsonBody ?? '')
                .toList()
                .map<SetoresConexaoStruct?>(SetoresConexaoStruct.maybeFromMap)
                .toList() as Iterable<SetoresConexaoStruct?>)
            .withoutNulls
            .toList()
            .cast<SetoresConexaoStruct>();
        safeSetState(() {});
      }
    });

    _model.textFieldRespostaTextController ??= TextEditingController();
    _model.textFieldRespostaFocusNode ??= FocusNode();

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
        width: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 30.0),
          child: SingleChildScrollView(
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Encaminhar Conversa',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Container(
                          width: 210.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
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
                        FFAppState().mudaChat = false;
                        safeSetState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Escolha o setor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 34.0,
                                  icon: Icon(
                                    Icons.clear_rounded,
                                    color: Color(0xFFBDBDBD),
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    safeSetState(() {
                                      _model.dropDownSetorValueController
                                          ?.reset();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: FlutterFlowDropDown<int>(
                                controller:
                                    _model.dropDownSetorValueController ??=
                                        FormFieldController<int>(null),
                                options: List<int>.from(_model.setoresConexao
                                    .map((e) => e.idSetor)
                                    .toList()),
                                optionLabels: _model.setoresConexao
                                    .map((e) => e.nomeSetor)
                                    .toList(),
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownSetorValue = val);
                                  _model.apiResultm7n =
                                      await GetDataGroup.getUserSetorCall.call(
                                    idEmpresa:
                                        FFAppState().colabUser.refEmpresa,
                                    setorid: _model.dropDownSetorValue,
                                  );

                                  if ((_model.apiResultm7n?.succeeded ??
                                      true)) {
                                    _model.setorUsers = ((_model
                                                    .apiResultm7n?.jsonBody ??
                                                '')
                                            .toList()
                                            .map<SetoresStruct?>(
                                                SetoresStruct.maybeFromMap)
                                            .toList() as Iterable<SetoresStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<SetoresStruct>();
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: 'Selecione',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Color(0x8DC4C4C4),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Escolha uma conexão',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 34.0,
                                    icon: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFFBDBDBD),
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      safeSetState(() {
                                        _model.dropDownconexaoValueController
                                            ?.reset();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownconexaoValueController ??=
                                          FormFieldController<String>(
                                    _model.dropDownconexaoValue ??= '',
                                  ),
                                  options: List<String>.from(_model
                                      .setoresConexao
                                      .where((e) =>
                                          e.idSetor ==
                                          _model.dropDownSetorValue)
                                      .toList()
                                      .map((e) => e.keyConexao)
                                      .toList()),
                                  optionLabels: _model.setoresConexao
                                      .where((e) =>
                                          e.idSetor ==
                                          _model.dropDownSetorValue)
                                      .toList()
                                      .map((e) => e.nomeConexao)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.dropDownconexaoValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  hintText: 'Selecione',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0x8DC4C4C4),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_model.dropDownSetorValue != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Atribua a um usuáro',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 34.0,
                                    icon: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFFBDBDBD),
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      safeSetState(() {
                                        _model.dropDownColabValueController
                                            ?.reset();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (_model.dropDownSetorValue != null)
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownColabValueController ??=
                                          FormFieldController<String>(
                                    _model.dropDownColabValue ??= '',
                                  ),
                                  options: List<String>.from(_model.setorUsers
                                      .map((e) => e.colabId)
                                      .toList()),
                                  optionLabels: _model.setorUsers
                                      .map((e) => e.nomeColabUser)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.dropDownColabValue = val),
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  hintText: 'Selecione',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0x8DC4C4C4),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldRespostaTextController,
                    focusNode: _model.textFieldRespostaFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: 'Observação',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelMediumFamily),
                          ),
                      alignLabelWithHint: true,
                      hintText: 'Digite aqui...',
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelMediumFamily),
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC4C4C4),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                          lineHeight: 1.0,
                        ),
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    cursorColor: FlutterFlowTheme.of(context).secondaryText,
                    validator: _model.textFieldRespostaTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().mudaChat = false;
                          safeSetState(() {});
                          Navigator.pop(context);
                        },
                        text: 'Cancelar',
                        options: FFButtonOptions(
                          width: 110.0,
                          height: 35.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      FutureBuilder<List<SetoresRow>>(
                        future: SetoresTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            _model.dropDownSetorValue,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitChasingDots(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          List<SetoresRow> buttonSetoresRowList =
                              snapshot.data!;

                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final buttonSetoresRow =
                              buttonSetoresRowList.isNotEmpty
                                  ? buttonSetoresRowList.first
                                  : null;

                          return FFButtonWidget(
                            onPressed: (_model.dropDownSetorValue == null)
                                ? null
                                : () async {
                                    if (_model.dropDownColabValue != null &&
                                        _model.dropDownColabValue != '') {
                                      _model.colabResult = await SelectDataGroup
                                          .selectColabUserCall
                                          .call(
                                        authId: _model.dropDownColabValue,
                                      );

                                      if ((_model.colabResult?.succeeded ??
                                          true)) {
                                        await ConversasTable().update(
                                          data: {
                                            'observacao_transferencia': _model
                                                .textFieldRespostaTextController
                                                .text,
                                            'Status': 'Finalizado',
                                            'hora_finalizada':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'transferida_setor':
                                                _model.dropDownSetorValue,
                                            'transferida_user':
                                                _model.dropDownColabValue,
                                            'transferida_nome_setor':
                                                buttonSetoresRow?.nome,
                                            'transferida_nome_user':
                                                SelectDataGroup
                                                    .selectColabUserCall
                                                    .nome(
                                              (_model.colabResult?.jsonBody ??
                                                  ''),
                                            ),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget!.conversa?.id,
                                          ),
                                        );
                                        await action_blocks.enviarTextoAPIapp(
                                          context,
                                          mensagem:
                                              '*Atendimento Transferido*${functions.newLine()}${functions.newLine()}Setor: ${buttonSetoresRow?.nome}${functions.newLine()}Colaborador: ${SelectDataGroup.selectColabUserCall.nome(
                                            (_model.colabResult?.jsonBody ??
                                                ''),
                                          )}',
                                          numerocontato:
                                              widget!.conversa?.numeroContato,
                                          conversa: widget!.conversa,
                                        );
                                        _model.resultadoconversa =
                                            await ConversasTable().insert({
                                          'ref_contatos':
                                              widget!.conversa?.refContatos,
                                          'authid': _model.dropDownColabValue,
                                          'nome_contato':
                                              widget!.conversa?.nomeContato,
                                          'foto_contato':
                                              widget!.conversa?.fotoContato,
                                          'Protocolo':
                                              widget!.conversa?.id?.toString(),
                                          'Status': _model.dropDownColabValue !=
                                                      null &&
                                                  _model.dropDownColabValue !=
                                                      ''
                                              ? 'Em Atendimento'
                                              : 'Espera',
                                          'numero_contato':
                                              widget!.conversa?.numeroContato,
                                          'colabuser_nome': SelectDataGroup
                                              .selectColabUserCall
                                              .nome(
                                            (_model.colabResult?.jsonBody ??
                                                ''),
                                          ),
                                          'ref_empresa':
                                              buttonSetoresRow?.idEmpresas,
                                          'id_setor': _model.dropDownSetorValue,
                                          'key_instancia':
                                              widget!.conversa?.keyInstancia,
                                          'id_api': random_data.randomString(
                                            30,
                                            30,
                                            true,
                                            true,
                                            true,
                                          ),
                                          'istransferida': true,
                                          'foto_colabUser': SelectDataGroup
                                              .selectColabUserCall
                                              .foto(
                                            (_model.colabResult?.jsonBody ??
                                                ''),
                                          ),
                                          'atualizado': false,
                                        });
                                        await ContatosTable().update(
                                          data: {
                                            'ref_conversa':
                                                _model.resultadoconversa?.id,
                                            'status_conversa': 'Espera',
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget!.conversa?.refContatos,
                                          ),
                                        );
                                        Navigator.pop(context);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Color(0x00FFFFFF),
                                          barrierColor: Color(0x00FFFFFF),
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: AlertChatfireWidget(
                                                  titulo:
                                                      'Atendimento transferido',
                                                  texto:
                                                      'atendimento com ${widget!.conversa?.nomeContato} transferido com sucesso!',
                                                  cor: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    } else {
                                      await ConversasTable().update(
                                        data: {
                                          'observacao_transferencia': _model
                                              .textFieldRespostaTextController
                                              .text,
                                          'Status': 'Finalizado',
                                          'hora_finalizada':
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                          'transferida_setor':
                                              _model.dropDownSetorValue,
                                          'transferida_nome_setor':
                                              buttonSetoresRow?.nome,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget!.conversa?.id,
                                        ),
                                      );
                                      await action_blocks.enviarTextoAPIapp(
                                        context,
                                        mensagem:
                                            '*Atendimento Transferido*${functions.newLine()}${functions.newLine()}Setor: ${buttonSetoresRow?.nome}',
                                        numerocontato:
                                            widget!.conversa?.numeroContato,
                                        conversa: widget!.conversa,
                                      );
                                      _model.resultadoconversaFALSE =
                                          await ConversasTable().insert({
                                        'ref_contatos':
                                            widget!.conversa?.refContatos,
                                        'nome_contato':
                                            widget!.conversa?.nomeContato,
                                        'foto_contato':
                                            widget!.conversa?.fotoContato,
                                        'Protocolo':
                                            widget!.conversa?.id?.toString(),
                                        'Status': 'Espera',
                                        'numero_contato':
                                            widget!.conversa?.numeroContato,
                                        'ref_empresa':
                                            buttonSetoresRow?.idEmpresas,
                                        'id_setor': _model.dropDownSetorValue,
                                        'key_instancia':
                                            widget!.conversa?.keyInstancia,
                                        'id_api': random_data.randomString(
                                          30,
                                          30,
                                          true,
                                          true,
                                          true,
                                        ),
                                        'istransferida': true,
                                        'atualizado': false,
                                      });
                                      await ContatosTable().update(
                                        data: {
                                          'ref_conversa':
                                              _model.resultadoconversaFALSE?.id,
                                          'status_conversa': 'Espera',
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget!.conversa?.refContatos,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Color(0x00FFFFFF),
                                        barrierColor: Color(0x00FFFFFF),
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: AlertChatfireWidget(
                                                titulo:
                                                    'Atendimento transferido',
                                                texto:
                                                    'atendimento com ${widget!.conversa?.nomeContato} transferido com sucesso!',
                                                cor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }

                                    FFAppState().mudaChat = true;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                            text: 'Salvar',
                            options: FFButtonOptions(
                              width: 110.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                              disabledColor: Color(0x9E9E9E9E),
                            ),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 20.0)),
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
