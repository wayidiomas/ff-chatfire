import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_conversas_model.dart';
export 'card_conversas_model.dart';

class CardConversasWidget extends StatefulWidget {
  const CardConversasWidget({
    super.key,
    this.fotoUsuario,
    this.nomeContato,
    this.ultimaConversa,
    this.idApi,
    this.fixada,
    this.idConversa,
    this.horaUltimaMensagen,
    this.atualizada,
    this.fotoColabUser,
    this.status,
    this.keyInstance,
  });

  final String? fotoUsuario;
  final String? nomeContato;
  final String? ultimaConversa;
  final String? idApi;
  final bool? fixada;
  final int? idConversa;
  final DateTime? horaUltimaMensagen;
  final bool? atualizada;
  final String? fotoColabUser;
  final String? status;
  final String? keyInstance;

  @override
  State<CardConversasWidget> createState() => _CardConversasWidgetState();
}

class _CardConversasWidgetState extends State<CardConversasWidget> {
  late CardConversasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardConversasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 240),
        curve: Curves.easeInOut,
        constraints: BoxConstraints(
          maxHeight: 60.0,
        ),
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            _model.mouseRegionHovered! ? Color(0xFFF5F5F5) : Colors.white,
            Colors.white,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 350.0,
              constraints: BoxConstraints(
                minHeight: 55.0,
                maxWidth: 350.0,
                maxHeight: 60.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        if (widget!.fotoUsuario == null ||
                            widget!.fotoUsuario == '')
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
                        if (widget!.fotoUsuario != null &&
                            widget!.fotoUsuario != '')
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 46.0,
                              height: 46.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                widget!.fotoUsuario!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                44.0, 0.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: 130.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        constraints: BoxConstraints(
                          maxHeight: 55.0,
                        ),
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  widget!.nomeContato!.maybeHandleOverflow(
                                    maxChars: 14,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  widget!.ultimaConversa!.maybeHandleOverflow(
                                    maxChars: 25,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFF708A96),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List<ViewContagemWebhookRow>>(
                      future: ViewContagemWebhookTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id_contato_conversas',
                          widget!.idApi,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 40.0,
                              ),
                            ),
                          );
                        }
                        List<ViewContagemWebhookRow>
                            containerViewContagemWebhookRowList =
                            snapshot.data!;

                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerViewContagemWebhookRow =
                            containerViewContagemWebhookRowList.isNotEmpty
                                ? containerViewContagemWebhookRowList.first
                                : null;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: containerViewContagemWebhookRow!
                                    .contagemNaoLidos! >
                                0,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 23.0,
                                height: 23.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerViewContagemWebhookRow
                                          ?.contagemNaoLidos
                                          ?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget!.status == 'Em Atendimento')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget!.fixada!) {
                                    await ConversasTable().update(
                                      data: {
                                        'fixa': false,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget!.idConversa,
                                      ),
                                    );

                                    FFAppState().update(() {});
                                  } else {
                                    await ConversasTable().update(
                                      data: {
                                        'fixa': true,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget!.idConversa,
                                      ),
                                    );

                                    FFAppState().update(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.push_pin_outlined,
                                  color: widget!.fixada!
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : Color(0xFFC4C4C4),
                                  size: 22.0,
                                ),
                              ),
                            Container(
                              width: 32.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      dateTimeFormat(
                                        "Hm",
                                        widget!.horaUltimaMensagen,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ).maybeHandleOverflow(maxChars: 6),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFFC4C4C4),
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      widget!.atualizada == false,
                                      true,
                                    ))
                                      Icon(
                                        Icons.done_all_sharp,
                                        color: Color(0xFFC4C4C4),
                                        size: 16.0,
                                      ),
                                    if (valueOrDefault<bool>(
                                      widget!.atualizada == true,
                                      false,
                                    ))
                                      Icon(
                                        Icons.done_all_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 16.0,
                                      ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
              ),
            ),
          ],
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
