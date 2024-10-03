import '/backend/supabase/supabase.dart';
import '/components/dropdown_c_h_a_t_d_e_l_e_t_eopcoes_widget.dart';
import '/components/listasemdados_widget.dart';
import '/components/visualizar_imagem_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_historico_model.dart';
export 'popup_historico_model.dart';

class PopupHistoricoWidget extends StatefulWidget {
  const PopupHistoricoWidget({
    super.key,
    required this.conversa,
  });

  final ConversasRow? conversa;

  @override
  State<PopupHistoricoWidget> createState() => _PopupHistoricoWidgetState();
}

class _PopupHistoricoWidgetState extends State<PopupHistoricoWidget> {
  late PopupHistoricoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupHistoricoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 560.0,
        constraints: BoxConstraints(
          minWidth: 640.0,
          maxWidth: 840.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Histórico',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                      Container(
                        width: 80.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 38.0,
                    hoverColor: FlutterFlowTheme.of(context).tertiary,
                    hoverIconColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F8F9),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<WebhookRow>>(
                                    future: WebhookTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'id_api_conversa',
                                            widget!.conversa?.idApi,
                                          )
                                          .order('created_at', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<WebhookRow>
                                          listViewMensagensWebhookRowList =
                                          snapshot.data!;

                                      if (listViewMensagensWebhookRowList
                                          .isEmpty) {
                                        return Center(
                                          child: ListasemdadosWidget(),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewMensagensWebhookRowList
                                                .length,
                                        itemBuilder:
                                            (context, listViewMensagensIndex) {
                                          final listViewMensagensWebhookRow =
                                              listViewMensagensWebhookRowList[
                                                  listViewMensagensIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (listViewMensagensWebhookRow
                                                      .fromMe ==
                                                  false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (widget!.conversa
                                                                          ?.fotoContato !=
                                                                      null &&
                                                                  widget!.conversa
                                                                          ?.fotoContato !=
                                                                      '')
                                                                Container(
                                                                  width: 36.0,
                                                                  height: 36.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget!
                                                                          .conversa
                                                                          ?.fotoContato,
                                                                      'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHx1c2VyfGVufDB8fHx8MTY5NjYxNTA5NHww&ixlib=rb-4.0.3&q=80&w=400',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (widget!.conversa
                                                                          ?.fotoContato ==
                                                                      null ||
                                                                  widget!.conversa
                                                                          ?.fotoContato ==
                                                                      '')
                                                                Container(
                                                                  width: 36.0,
                                                                  height: 36.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/unavailable.jpg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    "dd/MM HH:mm",
                                                                    listViewMensagensWebhookRow
                                                                        .createdAt,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0x67184F90),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                listViewMensagensWebhookRow
                                                                            .mensagem !=
                                                                        null &&
                                                                    listViewMensagensWebhookRow
                                                                            .mensagem !=
                                                                        '',
                                                                false,
                                                              ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            20.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      listViewMensagensWebhookRow
                                                                          .mensagem!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: listViewMensagensWebhookRow.deletada == true
                                                                                ? Color(0xFFBDBDBD)
                                                                                : Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.imagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.imagem !=
                                                                            '',
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.legendaImagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.legendaImagem !=
                                                                            '',
                                                                    false,
                                                                  ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            listViewMensagensWebhookRow.imagem!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              width: 200.0,
                                                                              height: 150.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            20.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          listViewMensagensWebhookRow
                                                                              .legendaImagem!,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: listViewMensagensWebhookRow.deletada == true ? Color(0xFFBDBDBD) : Colors.black,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                listViewMensagensWebhookRow
                                                                            .file !=
                                                                        null &&
                                                                    listViewMensagensWebhookRow
                                                                            .file !=
                                                                        '',
                                                                false,
                                                              ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        150.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        320.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            10.0,
                                                                            15.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .file_copy_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewMensagensWebhookRow.file!.maybeHandleOverflow(
                                                                                      maxChars: 24,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: listViewMensagensWebhookRow.deletada == true ? Color(0xFFBDBDBD) : Colors.black,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    'PDF',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Color(0xFF708A96),
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(listViewMensagensWebhookRow.file!);
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.file_download_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 20.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                listViewMensagensWebhookRow
                                                                            .audio !=
                                                                        null &&
                                                                    listViewMensagensWebhookRow
                                                                            .audio !=
                                                                        '',
                                                                false,
                                                              ))
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowAudioPlayer(
                                                                    audio: Audio
                                                                        .network(
                                                                      listViewMensagensWebhookRow
                                                                          .audio!,
                                                                      metas:
                                                                          Metas(
                                                                        title:
                                                                            '  ',
                                                                      ),
                                                                    ),
                                                                    titleTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                        ),
                                                                    playbackDurationTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    fillColor:
                                                                        valueOrDefault<
                                                                            Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    playbackButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    elevation:
                                                                        0.0,
                                                                    playInBackground:
                                                                        PlayInBackground
                                                                            .enabled,
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.legendaImagem ==
                                                                            null ||
                                                                        listViewMensagensWebhookRow.legendaImagem ==
                                                                            '',
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.imagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.imagem !=
                                                                            '',
                                                                    false,
                                                                  ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                    child: VisualizarImagemWidget(
                                                                                      urlimagem: listViewMensagensWebhookRow.imagem,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              listViewMensagensWebhookRow.imagem!,
                                                                              width: 200.0,
                                                                              height: 150.0,
                                                                              fit: BoxFit.cover,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.jpg',
                                                                                width: 200.0,
                                                                                height: 150.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (listViewMensagensWebhookRow
                                                                .deletada ==
                                                            false)
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                showAlignedDialog(
                                                                  barrierColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      false,
                                                                  avoidOverflow:
                                                                      false,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          15.0,
                                                                          -6.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          DropdownCHATDELETEopcoesWidget(
                                                                        mensagem:
                                                                            listViewMensagensWebhookRow,
                                                                        idDelete:
                                                                            listViewMensagensWebhookRow.id,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .ellipsisH,
                                                                color: Color(
                                                                    0x501A2437),
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          width: 18.0)),
                                                    ),
                                                  ),
                                                ),
                                              if (listViewMensagensWebhookRow
                                                      .fromMe ==
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.mensagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.mensagem !=
                                                                            '',
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.imagem ==
                                                                            null ||
                                                                        listViewMensagensWebhookRow.imagem ==
                                                                            '',
                                                                    false,
                                                                  ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : Color(
                                                                              0xFFC8E6C9),
                                                                      Color(
                                                                          0xFFC8E6C9),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            20.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      listViewMensagensWebhookRow
                                                                          .mensagem!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: listViewMensagensWebhookRow.deletada == true
                                                                                ? Color(0xFFBDBDBD)
                                                                                : Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.imagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.imagem !=
                                                                            '',
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.legendaImagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.legendaImagem !=
                                                                            '',
                                                                    false,
                                                                  ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : Color(
                                                                              0xFFC8E6C9),
                                                                      Color(
                                                                          0xFFC8E6C9),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            listViewMensagensWebhookRow.imagem!,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              width: 200.0,
                                                                              height: 150.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            20.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          listViewMensagensWebhookRow
                                                                              .legendaImagem!,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: listViewMensagensWebhookRow.deletada == true ? Color(0xFFBDBDBD) : Colors.black,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                listViewMensagensWebhookRow
                                                                            .file !=
                                                                        null &&
                                                                    listViewMensagensWebhookRow
                                                                            .file !=
                                                                        '',
                                                                false,
                                                              ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        150.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        320.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : Color(
                                                                              0xFFC8E6C9),
                                                                      Color(
                                                                          0xFFC8E6C9),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            10.0,
                                                                            15.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .file_copy_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      listViewMensagensWebhookRow.file,
                                                                                      ' N/A',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 24,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: listViewMensagensWebhookRow.deletada == true ? Color(0xFFBDBDBD) : Colors.black,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Text(
                                                                                    'PDF',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Color(0xFF708A96),
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(listViewMensagensWebhookRow.file!);
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.file_download_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 20.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                listViewMensagensWebhookRow
                                                                            .audio !=
                                                                        null &&
                                                                    listViewMensagensWebhookRow
                                                                            .audio !=
                                                                        '',
                                                                false,
                                                              ))
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 100.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowAudioPlayer(
                                                                    audio: Audio
                                                                        .network(
                                                                      listViewMensagensWebhookRow
                                                                          .audio!,
                                                                      metas:
                                                                          Metas(
                                                                        title:
                                                                            '  ',
                                                                      ),
                                                                    ),
                                                                    titleTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                        ),
                                                                    playbackDurationTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    fillColor:
                                                                        valueOrDefault<
                                                                            Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : Color(
                                                                              0xFFC8E6C9),
                                                                      Color(
                                                                          0xFFC8E6C9),
                                                                    ),
                                                                    playbackButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    elevation:
                                                                        0.0,
                                                                    playInBackground:
                                                                        PlayInBackground
                                                                            .enabled,
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.legendaImagem ==
                                                                            null ||
                                                                        listViewMensagensWebhookRow.legendaImagem ==
                                                                            '',
                                                                    false,
                                                                  ) &&
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    listViewMensagensWebhookRow.imagem !=
                                                                            null &&
                                                                        listViewMensagensWebhookRow.imagem !=
                                                                            '',
                                                                    false,
                                                                  ))
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        100.0,
                                                                    minHeight:
                                                                        20.0,
                                                                    maxWidth:
                                                                        370.0,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      listViewMensagensWebhookRow
                                                                              .deletada!
                                                                          ? Color(
                                                                              0x9CFF5963)
                                                                          : Color(
                                                                              0xFFC8E6C9),
                                                                      Color(
                                                                          0xFFC8E6C9),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                    child: VisualizarImagemWidget(
                                                                                      urlimagem: listViewMensagensWebhookRow.imagem,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              listViewMensagensWebhookRow.imagem!,
                                                                              width: 200.0,
                                                                              height: 150.0,
                                                                              fit: BoxFit.cover,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.jpg',
                                                                                width: 200.0,
                                                                                height: 150.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (widget!.conversa
                                                                        ?.fotoColabUser !=
                                                                    null &&
                                                                widget!.conversa
                                                                        ?.fotoColabUser !=
                                                                    '')
                                                              Container(
                                                                width: 36.0,
                                                                height: 36.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    widget!
                                                                        .conversa
                                                                        ?.fotoColabUser,
                                                                    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHx1c2VyfGVufDB8fHx8MTY5NjYxNTA5NHww&ixlib=rb-4.0.3&q=80&w=400',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            if (widget!.conversa
                                                                        ?.fotoColabUser ==
                                                                    null ||
                                                                widget!.conversa
                                                                        ?.fotoColabUser ==
                                                                    '')
                                                              Container(
                                                                width: 36.0,
                                                                height: 36.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/unavailable.jpg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "dd/MM HH:mm",
                                                                  listViewMensagensWebhookRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Color(
                                                                          0x67184F90),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 18.0)),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
