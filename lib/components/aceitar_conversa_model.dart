import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'aceitar_conversa_widget.dart' show AceitarConversaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AceitarConversaModel extends FlutterFlowModel<AceitarConversaWidget> {
  ///  Local state fields for this component.

  String tela = 'setor';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownSetor widget.
  int? dropDownSetorValue;
  FormFieldController<int>? dropDownSetorValueController;
  // State field(s) for DropDownConexao widget.
  String? dropDownConexaoValue;
  FormFieldController<String>? dropDownConexaoValueController;
  // Stores action output result for [Backend Call - API (SearchVerificarConversa)] action in Button widget.
  ApiCallResponse? apiResultygh79;
  // Stores action output result for [Action Block - assumirAtendimento] action in Button widget.
  ConversasRow? result2;
  // Stores action output result for [Backend Call - API (SearchVerificarConversa)] action in Button widget.
  ApiCallResponse? apiResultygh;
  // Stores action output result for [Action Block - assumirAtendimento] action in Button widget.
  ConversasRow? result1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
