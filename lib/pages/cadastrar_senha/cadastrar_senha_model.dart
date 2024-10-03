import '/auth/supabase_auth/auth_util.dart';
import '/components/popup_senha_alterada_widget.dart';
import '/components/popup_senhas_divergentes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'cadastrar_senha_widget.dart' show CadastrarSenhaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastrarSenhaModel extends FlutterFlowModel<CadastrarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SenhaResetar widget.
  FocusNode? senhaResetarFocusNode1;
  TextEditingController? senhaResetarTextController1;
  String? Function(BuildContext, String?)? senhaResetarTextController1Validator;
  // State field(s) for SenhaResetar widget.
  FocusNode? senhaResetarFocusNode2;
  TextEditingController? senhaResetarTextController2;
  late bool senhaResetarVisibility;
  String? Function(BuildContext, String?)? senhaResetarTextController2Validator;
  // State field(s) for ConfirmarSenhaResetar widget.
  FocusNode? confirmarSenhaResetarFocusNode;
  TextEditingController? confirmarSenhaResetarTextController;
  late bool confirmarSenhaResetarVisibility;
  String? Function(BuildContext, String?)?
      confirmarSenhaResetarTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaResetarVisibility = false;
    confirmarSenhaResetarVisibility = false;
  }

  @override
  void dispose() {
    senhaResetarFocusNode1?.dispose();
    senhaResetarTextController1?.dispose();

    senhaResetarFocusNode2?.dispose();
    senhaResetarTextController2?.dispose();

    confirmarSenhaResetarFocusNode?.dispose();
    confirmarSenhaResetarTextController?.dispose();
  }
}
