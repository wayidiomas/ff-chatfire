import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'botao_video_model.dart';
export 'botao_video_model.dart';

class BotaoVideoWidget extends StatefulWidget {
  const BotaoVideoWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<BotaoVideoWidget> createState() => _BotaoVideoWidgetState();
}

class _BotaoVideoWidgetState extends State<BotaoVideoWidget> {
  late BotaoVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotaoVideoModel());

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
        FFAppState().replyWebhook = 0;
        FFAppState().contatoEncaminhar = 0;
        safeSetState(() {});
        final selectedMedia = await selectMedia(
          storageFolderPath: 'arquivos',
          isVideo: true,
          mediaSource: MediaSource.videoGallery,
          multiImage: false,
        );
        if (selectedMedia != null &&
            selectedMedia
                .every((m) => validateFileFormat(m.storagePath, context))) {
          safeSetState(() => _model.isDataUploading = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          var downloadUrls = <String>[];
          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            selectedUploadedFiles = selectedMedia
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                      height: m.dimensions?.height,
                      width: m.dimensions?.width,
                      blurHash: m.blurHash,
                    ))
                .toList();

            downloadUrls = await uploadSupabaseStorageFiles(
              bucketName: 'chat',
              selectedFiles: selectedMedia,
            );
          } finally {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _model.isDataUploading = false;
          }
          if (selectedUploadedFiles.length == selectedMedia.length &&
              downloadUrls.length == selectedMedia.length) {
            safeSetState(() {
              _model.uploadedLocalFile = selectedUploadedFiles.first;
              _model.uploadedFileUrl = downloadUrls.first;
            });
            showUploadMessage(context, 'Success!');
          } else {
            safeSetState(() {});
            showUploadMessage(context, 'Failed to upload data');
            return;
          }
        }

        FFAppState().URLfile = '';
        FFAppState().URLimage = '';
        FFAppState().URLaudio = '';
        FFAppState().URLVideo = _model.uploadedFileUrl;
      },
      text: 'Vídeo',
      icon: Icon(
        Icons.ondemand_video,
        color: Color(0xFFFF5722),
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
