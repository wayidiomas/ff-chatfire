import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'reply_card_widget.dart' show ReplyCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReplyCardModel extends FlutterFlowModel<ReplyCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getRowByIdWebhook] action in replyCard widget.
  WebhookRow? webhookRow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
