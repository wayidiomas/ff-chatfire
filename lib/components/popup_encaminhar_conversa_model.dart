import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'popup_encaminhar_conversa_widget.dart'
    show PopupEncaminharConversaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEncaminharConversaModel
    extends FlutterFlowModel<PopupEncaminharConversaWidget> {
  ///  Local state fields for this component.

  List<SetoresConexaoStruct> setoresConexao = [];
  void addToSetoresConexao(SetoresConexaoStruct item) =>
      setoresConexao.add(item);
  void removeFromSetoresConexao(SetoresConexaoStruct item) =>
      setoresConexao.remove(item);
  void removeAtIndexFromSetoresConexao(int index) =>
      setoresConexao.removeAt(index);
  void insertAtIndexInSetoresConexao(int index, SetoresConexaoStruct item) =>
      setoresConexao.insert(index, item);
  void updateSetoresConexaoAtIndex(
          int index, Function(SetoresConexaoStruct) updateFn) =>
      setoresConexao[index] = updateFn(setoresConexao[index]);

  List<SetoresStruct> setorUsers = [];
  void addToSetorUsers(SetoresStruct item) => setorUsers.add(item);
  void removeFromSetorUsers(SetoresStruct item) => setorUsers.remove(item);
  void removeAtIndexFromSetorUsers(int index) => setorUsers.removeAt(index);
  void insertAtIndexInSetorUsers(int index, SetoresStruct item) =>
      setorUsers.insert(index, item);
  void updateSetorUsersAtIndex(int index, Function(SetoresStruct) updateFn) =>
      setorUsers[index] = updateFn(setorUsers[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetSetorPorConexao)] action in popup_EncaminharConversa widget.
  ApiCallResponse? apiResultzie;
  // State field(s) for DropDownSetor widget.
  int? dropDownSetorValue;
  FormFieldController<int>? dropDownSetorValueController;
  // Stores action output result for [Backend Call - API (GetUserSetor)] action in DropDownSetor widget.
  ApiCallResponse? apiResultm7n;
  // State field(s) for DropDownconexao widget.
  String? dropDownconexaoValue;
  FormFieldController<String>? dropDownconexaoValueController;
  // State field(s) for DropDownColab widget.
  String? dropDownColabValue;
  FormFieldController<String>? dropDownColabValueController;
  // State field(s) for TextFieldResposta widget.
  FocusNode? textFieldRespostaFocusNode;
  TextEditingController? textFieldRespostaTextController;
  String? Function(BuildContext, String?)?
      textFieldRespostaTextControllerValidator;
  // Stores action output result for [Backend Call - API (SelectColabUser)] action in Button widget.
  ApiCallResponse? colabResult;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? resultadoconversa;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? resultadoconversaFALSE;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldRespostaFocusNode?.dispose();
    textFieldRespostaTextController?.dispose();
  }
}
