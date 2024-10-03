import '/backend/supabase/supabase.dart';
import '/components/popup_criarcontatos_widget.dart';
import '/components/shimmer_effectsolo_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'popup_editar_conexao_widget.dart' show PopupEditarConexaoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEditarConexaoModel
    extends FlutterFlowModel<PopupEditarConexaoWidget> {
  ///  Local state fields for this component.

  List<int> setores = [];
  void addToSetores(int item) => setores.add(item);
  void removeFromSetores(int item) => setores.remove(item);
  void removeAtIndexFromSetores(int index) => setores.removeAt(index);
  void insertAtIndexInSetores(int index, int item) =>
      setores.insert(index, item);
  void updateSetoresAtIndex(int index, Function(int) updateFn) =>
      setores[index] = updateFn(setores[index]);

  String? etapas;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldnome widget.
  FocusNode? textFieldnomeFocusNode;
  TextEditingController? textFieldnomeTextController;
  String? Function(BuildContext, String?)? textFieldnomeTextControllerValidator;
  // State field(s) for DropDownsetorEdit widget.
  List<int>? dropDownsetorEditValue;
  FormFieldController<List<int>>? dropDownsetorEditValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for TextFieldMensagem widget.
  FocusNode? textFieldMensagemFocusNode;
  TextEditingController? textFieldMensagemTextController;
  String? Function(BuildContext, String?)?
      textFieldMensagemTextControllerValidator;
  String? _textFieldMensagemTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for DropDownContato widget.
  int? dropDownContatoValue;
  FormFieldController<int>? dropDownContatoValueController;

  @override
  void initState(BuildContext context) {
    textFieldMensagemTextControllerValidator =
        _textFieldMensagemTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldnomeFocusNode?.dispose();
    textFieldnomeTextController?.dispose();

    textFieldMensagemFocusNode?.dispose();
    textFieldMensagemTextController?.dispose();
  }
}
