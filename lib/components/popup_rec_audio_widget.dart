import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_rec_audio_model.dart';
export 'popup_rec_audio_model.dart';

class PopupRecAudioWidget extends StatefulWidget {
  const PopupRecAudioWidget({super.key});

  @override
  State<PopupRecAudioWidget> createState() => _PopupRecAudioWidgetState();
}

class _PopupRecAudioWidgetState extends State<PopupRecAudioWidget> {
  late PopupRecAudioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupRecAudioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 350.0,
      height: 80.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
        child: FlutterFlowAudioPlayer(
          audio: Audio.network(
            FFAppState().URLaudio,
            metas: Metas(),
          ),
          titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                fontSize: 1.0,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
              ),
          playbackDurationTextStyle:
              FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          playbackButtonColor: FlutterFlowTheme.of(context).primary,
          activeTrackColor: FlutterFlowTheme.of(context).alternate,
          elevation: 2.0,
          playInBackground: PlayInBackground.disabledRestoreOnForeground,
        ),
      ),
    );
  }
}
