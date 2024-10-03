import '/backend/supabase/supabase.dart';
import '/components/contatos_criar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'popup_criarcontatos_widget.dart' show PopupCriarcontatosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCriarcontatosModel
    extends FlutterFlowModel<PopupCriarcontatosWidget> {
  ///  Local state fields for this component.

  bool numeroinvalidoINFO = false;

  String? fotoPrevencao;

  ///  State fields for stateful widgets in this component.

  // Model for contatosCriar component.
  late ContatosCriarModel contatosCriarModel;

  @override
  void initState(BuildContext context) {
    contatosCriarModel = createModel(context, () => ContatosCriarModel());
  }

  @override
  void dispose() {
    contatosCriarModel.dispose();
  }
}
