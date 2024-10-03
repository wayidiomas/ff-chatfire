import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'popup_recusar_conversa_widget.dart' show PopupRecusarConversaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupRecusarConversaModel
    extends FlutterFlowModel<PopupRecusarConversaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldResposta widget.
  FocusNode? textFieldRespostaFocusNode;
  TextEditingController? textFieldRespostaTextController;
  String? Function(BuildContext, String?)?
      textFieldRespostaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldRespostaFocusNode?.dispose();
    textFieldRespostaTextController?.dispose();
  }
}
