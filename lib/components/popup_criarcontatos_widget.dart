import '/backend/supabase/supabase.dart';
import '/components/contatos_criar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_criarcontatos_model.dart';
export 'popup_criarcontatos_model.dart';

class PopupCriarcontatosWidget extends StatefulWidget {
  const PopupCriarcontatosWidget({
    super.key,
    this.contato,
  });

  final ContatosRow? contato;

  @override
  State<PopupCriarcontatosWidget> createState() =>
      _PopupCriarcontatosWidgetState();
}

class _PopupCriarcontatosWidgetState extends State<PopupCriarcontatosWidget> {
  late PopupCriarcontatosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupCriarcontatosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
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
                            'Novo Contato',
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
                          width: 135.0,
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
                        Navigator.pop(context);
                        safeSetState(() {
                          _model
                              .contatosCriarModel.textFieldcriar1TextController
                              ?.clear();
                          _model.contatosCriarModel
                              .textFieldiTelenfoneTextController
                              ?.clear();
                          _model.contatosCriarModel
                              .textFieldplataformacriarTextController
                              ?.clear();
                        });
                        FFAppState().numeroValido = false;
                        FFAppState().fotoValida = false;
                        safeSetState(() {});
                        _model.numeroinvalidoINFO = false;
                        safeSetState(() {});
                      },
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.contatosCriarModel,
                updateCallback: () => safeSetState(() {}),
                child: ContatosCriarWidget(
                  tela: 'adminContato',
                  callback: (contato) async {
                    Navigator.pop(context);
                  },
                  callbackClose: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
