import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'info_conexao_widget.dart' show InfoConexaoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class InfoConexaoModel extends FlutterFlowModel<InfoConexaoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (TerminarSessao)] action in Button widget.
  ApiCallResponse? apiResultp2d;
  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  final textField1Mask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
  // Stores action output result for [Backend Call - API (ObterStatusValidandoUsuario)] action in Button widget.
  ApiCallResponse? apiResultfmc;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in Button widget.
  ApiCallResponse? apiResultlo90;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in Button widget.
  ApiCallResponse? apiResultlo9;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in Button widget.
  ApiCallResponse? apiResultlo908;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();
  }
}
