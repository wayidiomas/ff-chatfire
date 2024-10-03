import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_senha_alterada_widget.dart';
import '/components/popup_senha_criada_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'password_reset_widget.dart' show PasswordResetWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordResetModel extends FlutterFlowModel<PasswordResetWidget> {
  ///  Local state fields for this page.

  bool emailDivergente = false;

  bool senhaDivergente = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (SearchColabByEmail)] action in Email widget.
  ApiCallResponse? apiResult6gf;
  // State field(s) for SenhaResetar widget.
  FocusNode? senhaResetarFocusNode;
  TextEditingController? senhaResetarTextController;
  late bool senhaResetarVisibility;
  String? Function(BuildContext, String?)? senhaResetarTextControllerValidator;
  String? _senhaResetarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    if (val.length < 8) {
      return 'A senha deve conter o mínimo de 8 caracteres';
    }

    return null;
  }

  // State field(s) for ConfirmarSenhaResetar widget.
  FocusNode? confirmarSenhaResetarFocusNode;
  TextEditingController? confirmarSenhaResetarTextController;
  late bool confirmarSenhaResetarVisibility;
  String? Function(BuildContext, String?)?
      confirmarSenhaResetarTextControllerValidator;
  String? _confirmarSenhaResetarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    if (val.length < 8) {
      return 'A senha deve conter o mínimo de 8 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    senhaResetarVisibility = false;
    senhaResetarTextControllerValidator = _senhaResetarTextControllerValidator;
    confirmarSenhaResetarVisibility = false;
    confirmarSenhaResetarTextControllerValidator =
        _confirmarSenhaResetarTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    senhaResetarFocusNode?.dispose();
    senhaResetarTextController?.dispose();

    confirmarSenhaResetarFocusNode?.dispose();
    confirmarSenhaResetarTextController?.dispose();
  }
}
