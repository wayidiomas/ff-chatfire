import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'info_q_r_code_widget.dart' show InfoQRCodeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InfoQRCodeModel extends FlutterFlowModel<InfoQRCodeWidget> {
  ///  Local state fields for this component.

  int? loops = 0;

  String? qrcode;

  String? statusConexao;

  bool alert = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SearchConexaobyID)] action in InfoQRCode widget.
  ApiCallResponse? apiResultConexao;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
