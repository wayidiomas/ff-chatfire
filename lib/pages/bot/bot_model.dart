import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/acesso_operador_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criar_setor_widget.dart';
import '/components/popup_editar_setor_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'bot_widget.dart' show BotWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BotModel extends FlutterFlowModel<BotWidget> {
  ///  Local state fields for this page.

  String paginas = 'imagem';

  bool setoresMudancas = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (SelectColabUser)] action in Bot widget.
  ApiCallResponse? apiResultdj273;
  // Stores action output result for [Backend Call - API (ConexaoSetoresUser)] action in Bot widget.
  ApiCallResponse? apiResult0v69;
  // Stores action output result for [Backend Call - API (SelectJsonSetor)] action in Bot widget.
  ApiCallResponse? apiResultdhw;
  // Stores action output result for [Custom Action - returnHorario] action in Bot widget.
  BotFuncionamentoStruct? horarios;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Model for Menu_lateraMenor component.
  late MenuLateraMenorModel menuLateraMenorModel;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered1 = false;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered2 = false;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered3 = false;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered4 = false;
  // State field(s) for MouseRegionencerramento widget.
  bool mouseRegionencerramentoHovered5 = false;
  // State field(s) for MouseRegionImagem widget.
  bool mouseRegionImagemHovered = false;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextFieldassumir widget.
  FocusNode? textFieldassumirFocusNode;
  TextEditingController? textFieldassumirTextController;
  String? Function(BuildContext, String?)?
      textFieldassumirTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Custom Action - reorderSetoresState] action in ListView widget.
  List<BotSetoresStruct>? act;
  // Stores action output result for [Custom Action - getRowByIdSetores] action in Button widget.
  SetoresRow? setorResult;
  // Stores action output result for [Backend Call - API (SelectJsonSetor)] action in Button widget.
  ApiCallResponse? apiResultdhw7;
  // State field(s) for SwitchPrincipal widget.
  bool? switchPrincipalValue;
  // State field(s) for CheckboxSeg widget.
  bool? checkboxSegValue;
  // State field(s) for DropDowntempoSeg widget.
  String? dropDowntempoSegValue;
  FormFieldController<String>? dropDowntempoSegValueController;
  // State field(s) for DropDowntempoSegunda2 widget.
  String? dropDowntempoSegunda2Value;
  FormFieldController<String>? dropDowntempoSegunda2ValueController;
  // State field(s) for CheckboxTer widget.
  bool? checkboxTerValue;
  // State field(s) for DropDowntempoTerca1 widget.
  String? dropDowntempoTerca1Value;
  FormFieldController<String>? dropDowntempoTerca1ValueController;
  // State field(s) for DropDowntempoterca2 widget.
  String? dropDowntempoterca2Value;
  FormFieldController<String>? dropDowntempoterca2ValueController;
  // State field(s) for CheckboxQua widget.
  bool? checkboxQuaValue;
  // State field(s) for DropDowntempoQuarta1 widget.
  String? dropDowntempoQuarta1Value;
  FormFieldController<String>? dropDowntempoQuarta1ValueController;
  // State field(s) for DropDowntempoqua2 widget.
  String? dropDowntempoqua2Value;
  FormFieldController<String>? dropDowntempoqua2ValueController;
  // State field(s) for CheckboxQui widget.
  bool? checkboxQuiValue;
  // State field(s) for DropDowntempoQuinta1 widget.
  String? dropDowntempoQuinta1Value;
  FormFieldController<String>? dropDowntempoQuinta1ValueController;
  // State field(s) for DropDowntempoquui widget.
  String? dropDowntempoquuiValue;
  FormFieldController<String>? dropDowntempoquuiValueController;
  // State field(s) for CheckboxSex widget.
  bool? checkboxSexValue;
  // State field(s) for DropDowntempoSexta1 widget.
  String? dropDowntempoSexta1Value;
  FormFieldController<String>? dropDowntempoSexta1ValueController;
  // State field(s) for DropDowntempoSex2 widget.
  String? dropDowntempoSex2Value;
  FormFieldController<String>? dropDowntempoSex2ValueController;
  // State field(s) for CheckboxSab widget.
  bool? checkboxSabValue;
  // State field(s) for DropDowntempoSab1 widget.
  String? dropDowntempoSab1Value;
  FormFieldController<String>? dropDowntempoSab1ValueController;
  // State field(s) for DropDowntempoSab2 widget.
  String? dropDowntempoSab2Value;
  FormFieldController<String>? dropDowntempoSab2ValueController;
  // State field(s) for CheckboxDom widget.
  bool? checkboxDomValue;
  // State field(s) for DropDowntempoDom1 widget.
  String? dropDowntempoDom1Value;
  FormFieldController<String>? dropDowntempoDom1ValueController;
  // State field(s) for DropDowntempodom2 widget.
  String? dropDowntempodom2Value;
  FormFieldController<String>? dropDowntempodom2ValueController;
  // State field(s) for TextField9 widget.
  FocusNode? textField9FocusNode;
  TextEditingController? textField9TextController;
  String? Function(BuildContext, String?)? textField9TextControllerValidator;
  String? _textField9TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDownhorarios widget.
  int? dropDownhorariosValue;
  FormFieldController<int>? dropDownhorariosValueController;
  // State field(s) for Switchprimordial widget.
  bool? switchprimordialValue;
  // State field(s) for DropDowntempoTrans widget.
  int? dropDowntempoTransValue;
  FormFieldController<int>? dropDowntempoTransValueController;
  // State field(s) for DropDownInat widget.
  int? dropDownInatValue;
  FormFieldController<int>? dropDownInatValueController;
  // State field(s) for DropDowntempoRetor widget.
  int? dropDowntempoRetorValue;
  FormFieldController<int>? dropDowntempoRetorValueController;
  // State field(s) for DropDownAUT widget.
  int? dropDownAUTValue;
  FormFieldController<int>? dropDownAUTValueController;
  // Model for Menu_lateralMaior component.
  late MenuLateralMaiorModel menuLateralMaiorModel;

  @override
  void initState(BuildContext context) {
    menuLateraMenorModel = createModel(context, () => MenuLateraMenorModel());
    appBarModel = createModel(context, () => AppBarModel());
    textField9TextControllerValidator = _textField9TextControllerValidator;
    menuLateralMaiorModel = createModel(context, () => MenuLateralMaiorModel());
  }

  @override
  void dispose() {
    menuLateraMenorModel.dispose();
    appBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldassumirFocusNode?.dispose();
    textFieldassumirTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textField9FocusNode?.dispose();
    textField9TextController?.dispose();

    menuLateralMaiorModel.dispose();
  }
}
