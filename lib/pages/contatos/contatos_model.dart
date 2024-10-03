import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criarcontatos_widget.dart';
import '/components/popup_delete_contatos_widget.dart';
import '/components/popup_editcontatos_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_upload_c_s_v_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'contatos_widget.dart' show ContatosWidget;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContatosModel extends FlutterFlowModel<ContatosWidget> {
  ///  Local state fields for this page.

  bool pesquisa = false;

  List<dynamic> listaID = [];
  void addToListaID(dynamic item) => listaID.add(item);
  void removeFromListaID(dynamic item) => listaID.remove(item);
  void removeAtIndexFromListaID(int index) => listaID.removeAt(index);
  void insertAtIndexInListaID(int index, dynamic item) =>
      listaID.insert(index, item);
  void updateListaIDAtIndex(int index, Function(dynamic) updateFn) =>
      listaID[index] = updateFn(listaID[index]);

  int? numeroPesquisa = 10;

  bool paginacao = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in Contatos widget.
  String? resultUser;
  // Model for Menu_lateralMaior component.
  late MenuLateralMaiorModel menuLateralMaiorModel;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextFieldbuscar widget.
  FocusNode? textFieldbuscarFocusNode;
  TextEditingController? textFieldbuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldbuscarTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchContatos)] action in TextFieldbuscar widget.
  ApiCallResponse? apiResult2du;
  Completer<List<ContatosRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (PaginacaoContatos)] action in IconButton widget.
  ApiCallResponse? apiResultjku;

  @override
  void initState(BuildContext context) {
    menuLateralMaiorModel = createModel(context, () => MenuLateralMaiorModel());
    menuLateraMenorModel = createModel(context, () => MenuLateraMenorModel());
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    menuLateralMaiorModel.dispose();
    menuLateraMenorModel.dispose();
    appBarModel.dispose();
    textFieldbuscarFocusNode?.dispose();
    textFieldbuscarTextController?.dispose();
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
