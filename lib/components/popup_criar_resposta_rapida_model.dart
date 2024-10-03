import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'popup_criar_resposta_rapida_widget.dart'
    show PopupCriarRespostaRapidaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCriarRespostaRapidaModel
    extends FlutterFlowModel<PopupCriarRespostaRapidaWidget> {
  ///  Local state fields for this component.

  bool? tagErrada = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldResposta widget.
  FocusNode? textFieldRespostaFocusNode;
  TextEditingController? textFieldRespostaTextController;
  String? Function(BuildContext, String?)?
      textFieldRespostaTextControllerValidator;
  String? _textFieldRespostaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldTagcriar widget.
  FocusNode? textFieldTagcriarFocusNode;
  TextEditingController? textFieldTagcriarTextController;
  String? Function(BuildContext, String?)?
      textFieldTagcriarTextControllerValidator;
  String? _textFieldTagcriarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for DropDowncriarresposta widget.
  List<int>? dropDowncriarrespostaValue;
  FormFieldController<List<int>>? dropDowncriarrespostaValueController;

  @override
  void initState(BuildContext context) {
    textFieldRespostaTextControllerValidator =
        _textFieldRespostaTextControllerValidator;
    textFieldTagcriarTextControllerValidator =
        _textFieldTagcriarTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldRespostaFocusNode?.dispose();
    textFieldRespostaTextController?.dispose();

    textFieldTagcriarFocusNode?.dispose();
    textFieldTagcriarTextController?.dispose();
  }
}
