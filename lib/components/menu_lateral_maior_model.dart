import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/popup_sem_keycolab_widget.dart';
import '/components/popup_sem_setor_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'menu_lateral_maior_widget.dart' show MenuLateralMaiorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuLateralMaiorModel extends FlutterFlowModel<MenuLateralMaiorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for MouseRegiondashboard widget.
  bool mouseRegiondashboardHovered = false;
  // State field(s) for MouseRegionrelatorio widget.
  bool mouseRegionrelatorioHovered = false;
  // State field(s) for MouseRegionBot widget.
  bool mouseRegionBotHovered = false;
  // State field(s) for MouseRegioncorporacao widget.
  bool mouseRegioncorporacaoHovered = false;
  // State field(s) for MouseRegionusarios widget.
  bool mouseRegionusariosHovered = false;
  // State field(s) for MouseRegionContatos widget.
  bool mouseRegionContatosHovered = false;
  // State field(s) for MouseRegionChat widget.
  bool mouseRegionChatHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
