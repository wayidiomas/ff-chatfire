import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'conversa_pin_model.dart';
export 'conversa_pin_model.dart';

class ConversaPinWidget extends StatefulWidget {
  const ConversaPinWidget({
    super.key,
    this.fixa,
    this.conversaId,
    this.hora,
    this.atualizado,
  });

  final bool? fixa;
  final int? conversaId;
  final DateTime? hora;
  final bool? atualizado;

  @override
  State<ConversaPinWidget> createState() => _ConversaPinWidgetState();
}

class _ConversaPinWidgetState extends State<ConversaPinWidget> {
  late ConversaPinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversaPinModel());

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget!.fixa!) {
                  await ConversasTable().update(
                    data: {
                      'fixa': false,
                    },
                    matchingRows: (rows) => rows.eq(
                      'id',
                      widget!.conversaId,
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
                      widget!.conversaId,
                    ),
                  );

                  FFAppState().update(() {});
                }
              },
              child: Icon(
                Icons.push_pin_outlined,
                color: widget!.fixa!
                    ? FlutterFlowTheme.of(context).tertiary
                    : Color(0xFFC4C4C4),
                size: 22.0,
              ),
            ),
            Container(
              width: 30.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      dateTimeFormat(
                        "Hm",
                        widget!.hora,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: Color(0xFFC4C4C4),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    if (valueOrDefault<bool>(
                      widget!.atualizado == false,
                      true,
                    ))
                      Icon(
                        Icons.done_all_sharp,
                        color: Color(0xFFC4C4C4),
                        size: 16.0,
                      ),
                    if (valueOrDefault<bool>(
                      widget!.atualizado == true,
                      false,
                    ))
                      Icon(
                        Icons.done_all_sharp,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 16.0,
                      ),
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}
