import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'popup_editar_resposta_rapida_widget.dart'
    show PopupEditarRespostaRapidaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEditarRespostaRapidaModel
    extends FlutterFlowModel<PopupEditarRespostaRapidaWidget> {
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

  // State field(s) for TextFieldTag widget.
  FocusNode? textFieldTagFocusNode;
  TextEditingController? textFieldTagTextController;
  String? Function(BuildContext, String?)? textFieldTagTextControllerValidator;
  String? _textFieldTagTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for DropDownEditarresposta widget.
  int? dropDownEditarrespostaValue;
  FormFieldController<int>? dropDownEditarrespostaValueController;

  @override
  void initState(BuildContext context) {
    textFieldRespostaTextControllerValidator =
        _textFieldRespostaTextControllerValidator;
    textFieldTagTextControllerValidator = _textFieldTagTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldRespostaFocusNode?.dispose();
    textFieldRespostaTextController?.dispose();

    textFieldTagFocusNode?.dispose();
    textFieldTagTextController?.dispose();
  }
}
