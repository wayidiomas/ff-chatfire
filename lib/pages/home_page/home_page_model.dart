import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String paginas = 'login';

  bool manterconectado = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailLogar widget.
  FocusNode? emailLogarFocusNode;
  TextEditingController? emailLogarTextController;
  String? Function(BuildContext, String?)? emailLogarTextControllerValidator;
  // State field(s) for SenhaLogar widget.
  FocusNode? senhaLogarFocusNode;
  TextEditingController? senhaLogarTextController;
  late bool senhaLogarVisibility;
  String? Function(BuildContext, String?)? senhaLogarTextControllerValidator;
  // State field(s) for EmailReset widget.
  FocusNode? emailResetFocusNode;
  TextEditingController? emailResetTextController;
  String? Function(BuildContext, String?)? emailResetTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaLogarVisibility = false;
  }

  @override
  void dispose() {
    emailLogarFocusNode?.dispose();
    emailLogarTextController?.dispose();

    senhaLogarFocusNode?.dispose();
    senhaLogarTextController?.dispose();

    emailResetFocusNode?.dispose();
    emailResetTextController?.dispose();
  }
}
