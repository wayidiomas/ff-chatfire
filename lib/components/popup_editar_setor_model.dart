import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'popup_editar_setor_widget.dart' show PopupEditarSetorWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEditarSetorModel extends FlutterFlowModel<PopupEditarSetorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldediatrNomesetor widget.
  FocusNode? textFieldediatrNomesetorFocusNode;
  TextEditingController? textFieldediatrNomesetorTextController;
  String? Function(BuildContext, String?)?
      textFieldediatrNomesetorTextControllerValidator;
  // State field(s) for DropDowneditarsetor widget.
  int? dropDowneditarsetorValue;
  FormFieldController<int>? dropDowneditarsetorValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldediatrNomesetorFocusNode?.dispose();
    textFieldediatrNomesetorTextController?.dispose();
  }
}
