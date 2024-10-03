import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import 'popup_criar_setor_widget.dart' show PopupCriarSetorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCriarSetorModel extends FlutterFlowModel<PopupCriarSetorWidget> {
  ///  Local state fields for this component.

  List<ConexoesStruct> conexoes = [];
  void addToConexoes(ConexoesStruct item) => conexoes.add(item);
  void removeFromConexoes(ConexoesStruct item) => conexoes.remove(item);
  void removeAtIndexFromConexoes(int index) => conexoes.removeAt(index);
  void insertAtIndexInConexoes(int index, ConexoesStruct item) =>
      conexoes.insert(index, item);
  void updateConexoesAtIndex(int index, Function(ConexoesStruct) updateFn) =>
      conexoes[index] = updateFn(conexoes[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetConexoes)] action in popup_criarSetor widget.
  ApiCallResponse? apiResultu99;
  // State field(s) for TextFieldNomesetor widget.
  FocusNode? textFieldNomesetorFocusNode;
  TextEditingController? textFieldNomesetorTextController;
  String? Function(BuildContext, String?)?
      textFieldNomesetorTextControllerValidator;
  String? _textFieldNomesetorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for DropDowneditarsetor widget.
  int? dropDowneditarsetorValue;
  FormFieldController<int>? dropDowneditarsetorValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SetoresRow? setoresResult;

  @override
  void initState(BuildContext context) {
    textFieldNomesetorTextControllerValidator =
        _textFieldNomesetorTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNomesetorFocusNode?.dispose();
    textFieldNomesetorTextController?.dispose();
  }
}
