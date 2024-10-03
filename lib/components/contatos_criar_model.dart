import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'contatos_criar_widget.dart' show ContatosCriarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ContatosCriarModel extends FlutterFlowModel<ContatosCriarWidget> {
  ///  Local state fields for this component.

  bool vermelho = false;

  bool isConexao = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldiTelenfone widget.
  FocusNode? textFieldiTelenfoneFocusNode;
  TextEditingController? textFieldiTelenfoneTextController;
  final textFieldiTelenfoneMask =
      MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)?
      textFieldiTelenfoneTextControllerValidator;
  String? _textFieldiTelenfoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (ObterStatusValidandoUsuario)] action in Button widget.
  ApiCallResponse? apiResultjn299;
  // Stores action output result for [Action Block - VerificarContato] action in Button widget.
  bool? verificarresult1;
  // Stores action output result for [Action Block - VerificarContato] action in Button widget.
  bool? verificarresult12;
  // Stores action output result for [Action Block - VerificarContato] action in Button widget.
  bool? verificarresult2;
  // State field(s) for TextFieldcriar1 widget.
  FocusNode? textFieldcriar1FocusNode;
  TextEditingController? textFieldcriar1TextController;
  String? Function(BuildContext, String?)?
      textFieldcriar1TextControllerValidator;
  String? _textFieldcriar1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldplataformacriar widget.
  FocusNode? textFieldplataformacriarFocusNode;
  TextEditingController? textFieldplataformacriarTextController;
  String? Function(BuildContext, String?)?
      textFieldplataformacriarTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c4;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c5;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c6;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c12;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c1;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c22;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c33;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ContatosRow? c3;

  @override
  void initState(BuildContext context) {
    textFieldiTelenfoneTextControllerValidator =
        _textFieldiTelenfoneTextControllerValidator;
    textFieldcriar1TextControllerValidator =
        _textFieldcriar1TextControllerValidator;
  }

  @override
  void dispose() {
    textFieldiTelenfoneFocusNode?.dispose();
    textFieldiTelenfoneTextController?.dispose();

    textFieldcriar1FocusNode?.dispose();
    textFieldcriar1TextController?.dispose();

    textFieldplataformacriarFocusNode?.dispose();
    textFieldplataformacriarTextController?.dispose();
  }
}
