import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'popup_delete_mensagem_c_h_a_t_widget.dart'
    show PopupDeleteMensagemCHATWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupDeleteMensagemCHATModel
    extends FlutterFlowModel<PopupDeleteMensagemCHATWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getRowByIdWebhook] action in Button widget.
  WebhookRow? webhookResult;
  // Stores action output result for [Backend Call - API (DeletarMensagem)] action in Button widget.
  ApiCallResponse? apiResultk1m;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
