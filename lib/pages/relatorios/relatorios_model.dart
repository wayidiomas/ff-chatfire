import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/info_atendimentos_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_encaminhar_conversa_widget.dart';
import '/components/popup_encerrar_conversa_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_historico_widget.dart';
import '/components/popup_recusar_conversa_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/components/splash_chat_fire_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'relatorios_widget.dart' show RelatoriosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RelatoriosModel extends FlutterFlowModel<RelatoriosWidget> {
  ///  Local state fields for this page.

  bool searchON = false;

  bool verFiltros = false;

  DateTime? date1Inicio;

  DateTime? date2Fim;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in Relatorios widget.
  String? resultUser;
  Completer<List<ConversasRelatorioRow>>? requestCompleter;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for MouseRegiontextfield888 widget.
  bool mouseRegiontextfield888Hovered1 = false;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for MouseRegiontextfield widget.
  bool mouseRegiontextfieldHovered1 = false;
  // State field(s) for TextFieldnomeContato widget.
  FocusNode? textFieldnomeContatoFocusNode;
  TextEditingController? textFieldnomeContatoTextController;
  String? Function(BuildContext, String?)?
      textFieldnomeContatoTextControllerValidator;
  // State field(s) for MouseRegiontextfield widget.
  bool mouseRegiontextfieldHovered2 = false;
  // State field(s) for TextFieldnumeroContato widget.
  FocusNode? textFieldnumeroContatoFocusNode;
  TextEditingController? textFieldnumeroContatoTextController;
  final textFieldnumeroContatoMask =
      MaskTextInputFormatter(mask: '(##) ####-####');
  String? Function(BuildContext, String?)?
      textFieldnumeroContatoTextControllerValidator;
  // State field(s) for MouseRegiontextfield widget.
  bool mouseRegiontextfieldHovered3 = false;
  // State field(s) for TextFieldProtocoo widget.
  FocusNode? textFieldProtocooFocusNode;
  TextEditingController? textFieldProtocooTextController;
  String? Function(BuildContext, String?)?
      textFieldProtocooTextControllerValidator;
  // State field(s) for MouseRegiontextfield888 widget.
  bool mouseRegiontextfield888Hovered2 = false;
  // State field(s) for DropDownConexoa widget.
  String? dropDownConexoaValue;
  FormFieldController<String>? dropDownConexoaValueController;
  // State field(s) for MouseRegiontextfield888 widget.
  bool mouseRegiontextfield888Hovered3 = false;
  // State field(s) for DropDownSetor widget.
  String? dropDownSetorValue;
  FormFieldController<String>? dropDownSetorValueController;
  // State field(s) for MouseRegiontextfield888 widget.
  bool mouseRegiontextfield888Hovered4 = false;
  // State field(s) for DropDownOperador widget.
  String? dropDownOperadorValue;
  FormFieldController<String>? dropDownOperadorValueController;
  // State field(s) for MouseRegiontextfielddtInicio widget.
  bool mouseRegiontextfielddtInicioHovered = false;
  DateTime? datePicked1;
  // State field(s) for MouseRegiontextfieldfinal widget.
  bool mouseRegiontextfieldfinalHovered = false;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (GetRelatorios)] action in Button widget.
  ApiCallResponse? apiResultvbt;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c1;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c2;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c3;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c4;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c5;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c11;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c22;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c33;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c44;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in IconButton widget.
  ConversasRow? c55;
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
    textFieldnomeContatoFocusNode?.dispose();
    textFieldnomeContatoTextController?.dispose();

    textFieldnumeroContatoFocusNode?.dispose();
    textFieldnumeroContatoTextController?.dispose();

    textFieldProtocooFocusNode?.dispose();
    textFieldProtocooTextController?.dispose();

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
