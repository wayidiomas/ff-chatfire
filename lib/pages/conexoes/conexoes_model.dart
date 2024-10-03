import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/info_conexao_widget.dart';
import '/components/info_q_r_code_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_editar_conexao_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'conexoes_widget.dart' show ConexoesWidget;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConexoesModel extends FlutterFlowModel<ConexoesWidget> {
  ///  Local state fields for this page.

  bool searchON = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in Conexoes widget.
  String? resultUser;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConexoesRow? insertconexao;
  // Stores action output result for [Backend Call - API (Iniciar)] action in Button widget.
  ApiCallResponse? apiResultv1c;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ConexoesRow>? queryconexao;
  // Stores action output result for [Backend Call - API (SearchConexaobyID)] action in Button widget.
  ApiCallResponse? apiresultConexaoId;
  Completer<List<ConexoesRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (GetConexoes)] action in Button widget.
  ApiCallResponse? apiResultu5b;
  // State field(s) for TextFieldbuscarConexoes widget.
  FocusNode? textFieldbuscarConexoesFocusNode;
  TextEditingController? textFieldbuscarConexoesTextController;
  String? Function(BuildContext, String?)?
      textFieldbuscarConexoesTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchConexao)] action in TextFieldbuscarConexoes widget.
  ApiCallResponse? apiResultw8v;
  // Model for Menu_lateralMaior component.
  late MenuLateralMaiorModel menuLateralMaiorModel;

  @override
  void initState(BuildContext context) {
    menuLateraMenorModel = createModel(context, () => MenuLateraMenorModel());
    appBarModel = createModel(context, () => AppBarModel());
    menuLateralMaiorModel = createModel(context, () => MenuLateralMaiorModel());
  }

  @override
  void dispose() {
    menuLateraMenorModel.dispose();
    appBarModel.dispose();
    textFieldbuscarConexoesFocusNode?.dispose();
    textFieldbuscarConexoesTextController?.dispose();

    menuLateralMaiorModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
