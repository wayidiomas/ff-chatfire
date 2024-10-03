import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'popup_criar_tag_widget.dart' show PopupCriarTagWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCriarTagModel extends FlutterFlowModel<PopupCriarTagWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldTitulo widget.
  FocusNode? textFieldTituloFocusNode;
  TextEditingController? textFieldTituloTextController;
  String? Function(BuildContext, String?)?
      textFieldTituloTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTituloFocusNode?.dispose();
    textFieldTituloTextController?.dispose();
  }
}
