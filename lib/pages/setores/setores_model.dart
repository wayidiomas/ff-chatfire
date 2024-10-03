import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/listasemmensagem_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criar_setor_widget.dart';
import '/components/popup_delete_setor_widget.dart';
import '/components/popup_editar_setor_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'setores_widget.dart' show SetoresWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetoresModel extends FlutterFlowModel<SetoresWidget> {
  ///  Local state fields for this page.

  bool pesquisa = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in Setores widget.
  String? resultUser;
  // Stores action output result for [Backend Call - API (TotalSetores)] action in Setores widget.
  ApiCallResponse? apiResult3nm;
  // Stores action output result for [Backend Call - API (TotalConexoes)] action in Setores widget.
  ApiCallResponse? apiResultxs3;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  Completer<List<SetoresRow>>? requestCompleter;
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
