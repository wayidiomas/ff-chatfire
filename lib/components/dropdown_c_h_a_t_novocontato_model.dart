import '/backend/supabase/supabase.dart';
import '/components/popup_chat_contatos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dropdown_c_h_a_t_novocontato_widget.dart'
    show DropdownCHATNovocontatoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DropdownCHATNovocontatoModel
    extends FlutterFlowModel<DropdownCHATNovocontatoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for MouseRegion2 widget.
  bool mouseRegion2Hovered = false;
  // Stores action output result for [Bottom Sheet - popup_ChatContatos] action in convertComponent widget.
  ConversasRow? conversaContato;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
