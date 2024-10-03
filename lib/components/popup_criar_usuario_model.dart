import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
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
import 'popup_criar_usuario_widget.dart' show PopupCriarUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCriarUsuarioModel extends FlutterFlowModel<PopupCriarUsuarioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldnome widget.
  FocusNode? textFieldnomeFocusNode;
  TextEditingController? textFieldnomeTextController;
  String? Function(BuildContext, String?)? textFieldnomeTextControllerValidator;
  String? _textFieldnomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for DropDownGenero widget.
  String? dropDownGeneroValue;
  FormFieldController<String>? dropDownGeneroValueController;
  // State field(s) for DropDownSetores widget.
  List<int>? dropDownSetoresValue;
  FormFieldController<List<int>>? dropDownSetoresValueController;
  // State field(s) for TextFieldcargo widget.
  FocusNode? textFieldcargoFocusNode;
  TextEditingController? textFieldcargoTextController;
  String? Function(BuildContext, String?)?
      textFieldcargoTextControllerValidator;
  // State field(s) for DropDowntipo widget.
  String? dropDowntipoValue;
  FormFieldController<String>? dropDowntipoValueController;
  // State field(s) for TextFieldemail1 widget.
  FocusNode? textFieldemail1FocusNode;
  TextEditingController? textFieldemail1TextController;
  String? Function(BuildContext, String?)?
      textFieldemail1TextControllerValidator;
  String? _textFieldemail1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail incorreto';
    }
    return null;
  }

  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaTextController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextControllerValidator;
  String? _textFieldSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    if (val.length < 8) {
      return 'menos de 8 caracteres';
    }

    return null;
  }

  // State field(s) for TextFieldConfirmaoSenha widget.
  FocusNode? textFieldConfirmaoSenhaFocusNode;
  TextEditingController? textFieldConfirmaoSenhaTextController;
  late bool textFieldConfirmaoSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldConfirmaoSenhaTextControllerValidator;
  String? _textFieldConfirmaoSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    if (val.length < 8) {
      return 'menos de 8 caracteres';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Inserir usuario)] action in Button widget.
  ApiCallResponse? outUsers;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    textFieldnomeTextControllerValidator =
        _textFieldnomeTextControllerValidator;
    textFieldemail1TextControllerValidator =
        _textFieldemail1TextControllerValidator;
    textFieldSenhaVisibility = false;
    textFieldSenhaTextControllerValidator =
        _textFieldSenhaTextControllerValidator;
    textFieldConfirmaoSenhaVisibility = false;
    textFieldConfirmaoSenhaTextControllerValidator =
        _textFieldConfirmaoSenhaTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldnomeFocusNode?.dispose();
    textFieldnomeTextController?.dispose();

    textFieldcargoFocusNode?.dispose();
    textFieldcargoTextController?.dispose();

    textFieldemail1FocusNode?.dispose();
    textFieldemail1TextController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaTextController?.dispose();

    textFieldConfirmaoSenhaFocusNode?.dispose();
    textFieldConfirmaoSenhaTextController?.dispose();
  }
}
