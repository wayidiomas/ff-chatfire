import '/auth/supabase_auth/auth_util.dart';
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
import 'popup_editar_usuario_widget.dart' show PopupEditarUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PopupEditarUsuarioModel
    extends FlutterFlowModel<PopupEditarUsuarioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFielNome widget.
  FocusNode? textFielNomeFocusNode;
  TextEditingController? textFielNomeTextController;
  String? Function(BuildContext, String?)? textFielNomeTextControllerValidator;
  String? _textFielNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for TextFielddatanas widget.
  FocusNode? textFielddatanasFocusNode;
  TextEditingController? textFielddatanasTextController;
  final textFielddatanasMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      textFielddatanasTextControllerValidator;
  // State field(s) for DropDownGenero widget.
  String? dropDownGeneroValue;
  FormFieldController<String>? dropDownGeneroValueController;
  // State field(s) for TextFieldCargo widget.
  FocusNode? textFieldCargoFocusNode;
  TextEditingController? textFieldCargoTextController;
  String? Function(BuildContext, String?)?
      textFieldCargoTextControllerValidator;
  // State field(s) for DropDownTipo widget.
  String? dropDownTipoValue;
  FormFieldController<String>? dropDownTipoValueController;
  // State field(s) for DropDownSetore widget.
  List<int>? dropDownSetoreValue;
  FormFieldController<List<int>>? dropDownSetoreValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Action Block - TriagemUser] action in Button widget.
  String? resultUser;

  @override
  void initState(BuildContext context) {
    textFielNomeTextControllerValidator = _textFielNomeTextControllerValidator;
  }

  @override
  void dispose() {
    textFielNomeFocusNode?.dispose();
    textFielNomeTextController?.dispose();

    textFielddatanasFocusNode?.dispose();
    textFielddatanasTextController?.dispose();

    textFieldCargoFocusNode?.dispose();
    textFieldCargoTextController?.dispose();
  }
}
