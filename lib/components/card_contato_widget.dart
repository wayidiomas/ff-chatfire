import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_contato_model.dart';
export 'card_contato_model.dart';

class CardContatoWidget extends StatefulWidget {
  const CardContatoWidget({
    super.key,
    Color? corFundo,
    required this.contato,
    required this.conversaAberta,
  }) : this.corFundo = corFundo ?? Colors.white;

  final Color corFundo;
  final int? contato;
  final Future Function(ConversasRow? conversaCard)? conversaAberta;

  @override
  State<CardContatoWidget> createState() => _CardContatoWidgetState();
}

class _CardContatoWidgetState extends State<CardContatoWidget> {
  late CardContatoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardContatoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.contatoRow = await actions.getRowByIdContatos(
        widget!.contato?.toString(),
      );
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

    return Container(
      height: 120.0,
      constraints: BoxConstraints(
        minWidth: 120.0,
        maxWidth: 260.0,
      ),
      decoration: BoxDecoration(
        color: widget!.corFundo,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.contatoRow?.foto != null &&
                            _model.contatoRow?.foto != '')
                          Container(
                            width: 38.0,
                            height: 38.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              _model.contatoRow!.foto!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (_model.contatoRow?.foto == null ||
                            _model.contatoRow?.foto == '')
                          Container(
                            width: 38.0,
                            height: 38.0,
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.contatoRow?.nome,
                                'N/A',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFFE0E0E0),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.criarConversaCard = await ConversasTable().insert({
                        'ref_contatos': _model.contatoRow?.id,
                        'nome_contato': _model.contatoRow?.nome,
                        'foto_contato': _model.contatoRow?.foto,
                        'Protocolo': 'Atendimento não iniciado',
                        'numero_contato': _model.contatoRow?.numero,
                        'Status': 'Visualizar',
                        'id_setor':
                            FFAppState().colabUser.setoresUsers.first.setorId,
                        'ref_empresa': FFAppState().colabUser.refEmpresa,
                        'colabuser_nome': FFAppState().colabUser.nome,
                        'isdeleted_conversas': true,
                        'key_instancia': FFAppState().colabUser.keyColabUser,
                        'id_api': random_data.randomString(
                          30,
                          30,
                          true,
                          true,
                          true,
                        ),
                      });
                      await widget.conversaAberta?.call(
                        _model.criarConversaCard,
                      );

                      safeSetState(() {});
                    },
                    text: 'Conversar',
                    icon: Icon(
                      Icons.send_sharp,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x00FFFFFF),
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
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
