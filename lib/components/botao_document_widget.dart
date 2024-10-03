import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'botao_document_model.dart';
export 'botao_document_model.dart';

class BotaoDocumentWidget extends StatefulWidget {
  const BotaoDocumentWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<BotaoDocumentWidget> createState() => _BotaoDocumentWidgetState();
}

class _BotaoDocumentWidgetState extends State<BotaoDocumentWidget> {
  late BotaoDocumentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotaoDocumentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        FFAppState().URLimage = '';
        FFAppState().URLfile = '';
        FFAppState().DropImage = '';
        FFAppState().URLaudio = '';
        FFAppState().URLDoc = '';
        FFAppState().URLVideo = '';
        FFAppState().contatoEncaminhar = 0;
        FFAppState().replyWebhook = 0;
        safeSetState(() {});
        final selectedFiles = await selectFiles(
          storageFolderPath: 'arquivos',
          multiFile: false,
        );
        if (selectedFiles != null) {
          safeSetState(() => _model.isDataUploading = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          var downloadUrls = <String>[];
          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            selectedUploadedFiles = selectedFiles
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                    ))
                .toList();

            downloadUrls = await uploadSupabaseStorageFiles(
              bucketName: 'chat',
              selectedFiles: selectedFiles,
            );
          } finally {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _model.isDataUploading = false;
          }
          if (selectedUploadedFiles.length == selectedFiles.length &&
              downloadUrls.length == selectedFiles.length) {
            safeSetState(() {
              _model.uploadedLocalFile = selectedUploadedFiles.first;
              _model.uploadedFileUrl = downloadUrls.first;
            });
            showUploadMessage(
              context,
              'Success!',
            );
          } else {
            safeSetState(() {});
            showUploadMessage(
              context,
              'Failed to upload file',
            );
            return;
          }
        }

        FFAppState().URLDoc = _model.uploadedFileUrl;
        safeSetState(() {});
      },
      text: 'Arquivo',
      icon: Icon(
        Icons.folder_copy_outlined,
        color: Color(0xFF7B1FA2),
        size: 15.0,
      ),
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: Color(0x7A1A2437),
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      showLoadingIndicator: false,
    );
  }
}
