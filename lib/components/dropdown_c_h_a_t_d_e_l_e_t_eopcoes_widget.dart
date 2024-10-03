import '/backend/supabase/supabase.dart';
import '/components/popup_delete_mensagem_c_h_a_t_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_c_h_a_t_d_e_l_e_t_eopcoes_model.dart';
export 'dropdown_c_h_a_t_d_e_l_e_t_eopcoes_model.dart';

class DropdownCHATDELETEopcoesWidget extends StatefulWidget {
  const DropdownCHATDELETEopcoesWidget({
    super.key,
    this.mensagem,
    required this.idDelete,
  });

  final WebhookRow? mensagem;
  final int? idDelete;

  @override
  State<DropdownCHATDELETEopcoesWidget> createState() =>
      _DropdownCHATDELETEopcoesWidgetState();
}

class _DropdownCHATDELETEopcoesWidgetState
    extends State<DropdownCHATDELETEopcoesWidget> {
  late DropdownCHATDELETEopcoesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCHATDELETEopcoesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 160.0,
        constraints: BoxConstraints(
          minHeight: 40.0,
          maxHeight: 90.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryText,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget!.mensagem != null)
              Flexible(
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Visibility(
                    visible: widget!.mensagem != null,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().replyWebhook = widget!.mensagem!.id;
                        FFAppState().dataWebhook = widget!.mensagem!.dataField!;
                        safeSetState(() {});
                        Navigator.pop(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 50.0,
                        ),
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            _model.mouseRegionResponderHovered!
                                ? Color(0x4DFFFFFF)
                                : FlutterFlowTheme.of(context).secondaryText,
                            Color(0x4DFFFFFF),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Responder',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.reply_all,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(
                        () => _model.mouseRegionResponderHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(
                        () => _model.mouseRegionResponderHovered = false);
                  }),
                ),
              ),
            Flexible(
              child: MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer ?? MouseCursor.defer,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: PopupDeleteMensagemCHATWidget(
                            mensagem: widget!.idDelete!,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 50.0,
                    ),
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.mouseRegionDeletarHovered!
                            ? Color(0x4DFFFFFF)
                            : FlutterFlowTheme.of(context).secondaryText,
                        Color(0x4DFFFFFF),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Deletar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.trashAlt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionDeletarHovered = true);
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionDeletarHovered = false);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
