import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/hoover_assuntos_widget.dart';
import '/components/hoover_tag_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criar_assunto_widget.dart';
import '/components/popup_criar_tag_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'encerramento_atendimento_widget.dart'
    show EncerramentoAtendimentoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EncerramentoAtendimentoModel
    extends FlutterFlowModel<EncerramentoAtendimentoWidget> {
  ///  Local state fields for this page.

  bool pesquisa = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in EncerramentoAtendimento widget.
  String? resultUser;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for MouseRegionrespostas widget.
  bool mouseRegionrespostasHovered = false;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered = false;
  // State field(s) for Switch widget.
  bool? switchValue;
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
}
