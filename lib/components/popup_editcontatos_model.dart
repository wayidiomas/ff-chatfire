import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'popup_editcontatos_widget.dart' show PopupEditcontatosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PopupEditcontatosModel extends FlutterFlowModel<PopupEditcontatosWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldcriar1 widget.
  FocusNode? textFieldcriar1FocusNode;
  TextEditingController? textFieldcriar1TextController;
  String? Function(BuildContext, String?)?
      textFieldcriar1TextControllerValidator;
  // State field(s) for TextFieldplataformacriar widget.
  FocusNode? textFieldplataformacriarFocusNode;
  TextEditingController? textFieldplataformacriarTextController;
  String? Function(BuildContext, String?)?
      textFieldplataformacriarTextControllerValidator;
  // State field(s) for TextFieldidentificadorcriar widget.
  FocusNode? textFieldidentificadorcriarFocusNode;
  TextEditingController? textFieldidentificadorcriarTextController;
  final textFieldidentificadorcriarMask =
      MaskTextInputFormatter(mask: '## (##) #####-####');
  String? Function(BuildContext, String?)?
      textFieldidentificadorcriarTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldcriar1FocusNode?.dispose();
    textFieldcriar1TextController?.dispose();

    textFieldplataformacriarFocusNode?.dispose();
    textFieldplataformacriarTextController?.dispose();

    textFieldidentificadorcriarFocusNode?.dispose();
    textFieldidentificadorcriarTextController?.dispose();
  }
}
