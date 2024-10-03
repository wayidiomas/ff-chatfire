import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visualizar_imagem_model.dart';
export 'visualizar_imagem_model.dart';

class VisualizarImagemWidget extends StatefulWidget {
  const VisualizarImagemWidget({
    super.key,
    String? urlimagem,
    this.urlvideo,
  }) : this.urlimagem = urlimagem ?? '';

  final String urlimagem;
  final String? urlvideo;

  @override
  State<VisualizarImagemWidget> createState() => _VisualizarImagemWidgetState();
}

class _VisualizarImagemWidgetState extends State<VisualizarImagemWidget> {
  late VisualizarImagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualizarImagemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xCBFFFFFF),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 6.0, 10.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 35.0,
                      hoverColor: Color(0xD23F7DE8),
                      hoverIconColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.download_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 14.0,
                      ),
                      onPressed: () async {
                        if (widget!.urlimagem != null &&
                            widget!.urlimagem != '') {
                          await actions.downloadFile(
                            functions.imagepathtoString(widget!.urlimagem)!,
                            'Foto Chatfire',
                          );
                        } else if (widget!.urlvideo != null &&
                            widget!.urlvideo != '') {
                          await actions.downloadFile(
                            functions.videopathToString(widget!.urlvideo)!,
                            'Vídeo Chatfire',
                          );
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 10.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 35.0,
                      hoverColor: Color(0xD23F7DE8),
                      hoverIconColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 14.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (widget!.urlimagem != null && widget!.urlimagem != '')
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      if (_model.zoom)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.InteractiveViewerWidget(
                              width: double.infinity,
                              height: double.infinity,
                              urlimage5: widget!.urlimagem,
                            ),
                          ),
                        ),
                      if (!_model.zoom)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.zoom = true;
                              safeSetState(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                widget!.urlimagem,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            if (widget!.urlvideo != null && widget!.urlvideo != '')
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowVideoPlayer(
                      path: widget!.urlvideo!,
                      videoType: VideoType.network,
                      autoPlay: false,
                      looping: false,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
