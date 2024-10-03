import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/contatos_criar_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/components/shimmer_effectsolo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'popup_chat_contatos_widget.dart' show PopupChatContatosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupChatContatosModel extends FlutterFlowModel<PopupChatContatosWidget> {
  ///  Local state fields for this component.

  bool pesquisapop = false;

  String fotoPerfil =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBarChatContatos widget.
  TabController? tabBarChatContatosController;
  int get tabBarChatContatosCurrentIndex => tabBarChatContatosController != null
      ? tabBarChatContatosController!.index
      : 0;

  // Model for contatosCriar component.
  late ContatosCriarModel contatosCriarModel;
  // Stores action output result for [Backend Call - Insert Row] action in contatosCriar widget.
  ConversasRow? criarConversacallback;
  // State field(s) for TextFieldbuscarpop widget.
  FocusNode? textFieldbuscarpopFocusNode;
  TextEditingController? textFieldbuscarpopTextController;
  String? Function(BuildContext, String?)?
      textFieldbuscarpopTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchContatos)] action in TextFieldbuscarpop widget.
  ApiCallResponse? apiResult89rh;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonINICIAR widget.
  ConversasRow? criarConversa1;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in ButtonGETID widget.
  ConversasRow? lookUpConversas;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? criarConversaS;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonINICIAR widget.
  ConversasRow? criarConversa2;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in ButtonGETID widget.
  ConversasRow? lookUpConversas2;

  @override
  void initState(BuildContext context) {
    contatosCriarModel = createModel(context, () => ContatosCriarModel());
  }

  @override
  void dispose() {
    tabBarChatContatosController?.dispose();
    contatosCriarModel.dispose();
    textFieldbuscarpopFocusNode?.dispose();
    textFieldbuscarpopTextController?.dispose();
  }
}
