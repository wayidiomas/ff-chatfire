import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criar_resposta_rapida_widget.dart';
import '/components/popup_delete_resposta_widget.dart';
import '/components/popup_editar_resposta_rapida_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'respostas_rapidas_widget.dart' show RespostasRapidasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RespostasRapidasModel extends FlutterFlowModel<RespostasRapidasWidget> {
  ///  Local state fields for this page.

  bool pesquisa = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in RespostasRapidas widget.
  String? resultUser;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered = false;
  // State field(s) for MouseRegionrespostas widget.
  bool mouseRegionrespostasHovered = false;
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
