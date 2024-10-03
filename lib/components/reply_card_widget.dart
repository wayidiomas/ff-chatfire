import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reply_card_model.dart';
export 'reply_card_model.dart';

class ReplyCardWidget extends StatefulWidget {
  const ReplyCardWidget({
    super.key,
    required this.textoWebhook,
    required this.corFundo,
  });

  final int? textoWebhook;
  final Color? corFundo;

  @override
  State<ReplyCardWidget> createState() => _ReplyCardWidgetState();
}

class _ReplyCardWidgetState extends State<ReplyCardWidget> {
  late ReplyCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.webhookRow = await actions.getRowByIdWebhook(
        widget!.textoWebhook?.toString(),
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
    return Container(
      width: double.infinity,
      height: 64.0,
      constraints: BoxConstraints(
        minHeight: 60.0,
      ),
      decoration: BoxDecoration(
        color: widget!.corFundo,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          () {
                            if (_model.webhookRow?.mensagem != null &&
                                _model.webhookRow?.mensagem != '') {
                              return _model.webhookRow?.mensagem;
                            } else if (_model.webhookRow?.audio != null &&
                                _model.webhookRow?.audio != '') {
                              return '🎙 Audio';
                            } else if (_model.webhookRow?.imagem != null &&
                                _model.webhookRow?.imagem != '') {
                              return '📸 Imagem';
                            } else if (_model.webhookRow?.file != null &&
                                _model.webhookRow?.file != '') {
                              return '📁Arquivo';
                            } else if (_model.webhookRow?.video != null &&
                                _model.webhookRow?.video != '') {
                              return '🎥Vídeo';
                            } else if (_model.webhookRow?.idContatoWebhook !=
                                null) {
                              return '🧒 Contato';
                            } else {
                              return 'N/A';
                            }
                          }(),
                          'N/A',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
