import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'card_contato_widget.dart' show CardContatoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardContatoModel extends FlutterFlowModel<CardContatoWidget> {
  ///  Local state fields for this component.

  ConversasRow? conversa;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getRowByIdContatos] action in CardContato widget.
  ContatosRow? contatoRow;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? criarConversaCard;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
