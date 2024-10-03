import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/shimmer_effectsolo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'popup_encerrar_conversa_widget.dart' show PopupEncerrarConversaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEncerrarConversaModel
    extends FlutterFlowModel<PopupEncerrarConversaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownassunto widget.
  String? dropDownassuntoValue;
  FormFieldController<String>? dropDownassuntoValueController;
  // State field(s) for DropDowntag widget.
  String? dropDowntagValue;
  FormFieldController<String>? dropDowntagValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextFieldResposta widget.
  FocusNode? textFieldRespostaFocusNode;
  TextEditingController? textFieldRespostaTextController;
  String? Function(BuildContext, String?)?
      textFieldRespostaTextControllerValidator;
  // Stores action output result for [Backend Call - API (SelectBot)] action in Button widget.
  ApiCallResponse? apiResultvc4;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in Button widget.
  ApiCallResponse? apiResultsgo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldRespostaFocusNode?.dispose();
    textFieldRespostaTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
