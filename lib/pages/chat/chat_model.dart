import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/aceitar_conversa_widget.dart';
import '/components/alert_chatfire_widget.dart';
import '/components/botao_document_widget.dart';
import '/components/botao_video_widget.dart';
import '/components/card_contato_widget.dart';
import '/components/card_conversas_widget.dart';
import '/components/dropdown_c_h_a_t_d_e_l_e_t_eopcoes_widget.dart';
import '/components/editar_perfil_widget.dart';
import '/components/listasemdados_pequena_widget.dart';
import '/components/listasemmensagem_widget.dart';
import '/components/popup_chat_contatos_widget.dart';
import '/components/popup_editcontatos_widget.dart';
import '/components/popup_encaminhar_conversa_widget.dart';
import '/components/popup_encerrar_conversa_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/components/popup_historico_widget.dart';
import '/components/popup_rec_audio_widget.dart';
import '/components/popup_recusar_conversa_widget.dart';
import '/components/popup_sem_keycolab_widget.dart';
import '/components/reply_card_widget.dart';
import '/components/row_listview_historico_widget.dart';
import '/components/shimmer_effect_widget.dart';
import '/components/visualizar_imagem_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'chat_widget.dart' show ChatWidget;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  ConversasRow? conversa;

  bool verlistaresposta = false;

  bool infoaberta = true;

  bool searchRespostaON = false;

  bool searchConversaON = false;

  int? limiteConversas = 60;

  List<dynamic> listaIDConversas = [];
  void addToListaIDConversas(dynamic item) => listaIDConversas.add(item);
  void removeFromListaIDConversas(dynamic item) =>
      listaIDConversas.remove(item);
  void removeAtIndexFromListaIDConversas(int index) =>
      listaIDConversas.removeAt(index);
  void insertAtIndexInListaIDConversas(int index, dynamic item) =>
      listaIDConversas.insert(index, item);
  void updateListaIDConversasAtIndex(int index, Function(dynamic) updateFn) =>
      listaIDConversas[index] = updateFn(listaIDConversas[index]);

  int? limiteWebhooks = 1;

  bool paginacaoConversas = false;

  bool verAnexos = false;

  List<dynamic> jsonChatConversas = [];
  void addToJsonChatConversas(dynamic item) => jsonChatConversas.add(item);
  void removeFromJsonChatConversas(dynamic item) =>
      jsonChatConversas.remove(item);
  void removeAtIndexFromJsonChatConversas(int index) =>
      jsonChatConversas.removeAt(index);
  void insertAtIndexInJsonChatConversas(int index, dynamic item) =>
      jsonChatConversas.insert(index, item);
  void updateJsonChatConversasAtIndex(int index, Function(dynamic) updateFn) =>
      jsonChatConversas[index] = updateFn(jsonChatConversas[index]);

  bool stopScrollList = false;

  int limiteWebhooksPaginacao = 2;

  int instanciaFiltroSQL = 0;

  List<dynamic> listaIDConversaEspera = [];
  void addToListaIDConversaEspera(dynamic item) =>
      listaIDConversaEspera.add(item);
  void removeFromListaIDConversaEspera(dynamic item) =>
      listaIDConversaEspera.remove(item);
  void removeAtIndexFromListaIDConversaEspera(int index) =>
      listaIDConversaEspera.removeAt(index);
  void insertAtIndexInListaIDConversaEspera(int index, dynamic item) =>
      listaIDConversaEspera.insert(index, item);
  void updateListaIDConversaEsperaAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaIDConversaEspera[index] = updateFn(listaIDConversaEspera[index]);

  bool naoLidas = false;

  bool texfieldFocus = true;

  bool conexaoAtiva = false;

  int? idConversaPage;

  bool stopRecursive = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - TriagemUser] action in Chat widget.
  String? resultUser;
  Completer<List<ConversasRow>>? requestCompleter;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (ChatConversa)] action in Chat widget.
  ApiCallResponse? apiResultzne;
  // Stores action output result for [Custom Action - base64ToFFUploadedFile] action in FileDropScreen widget.
  FFUploadedFile? result56;
  // State field(s) for MouseRegionMenuLateral widget.
  bool mouseRegionMenuLateralHovered = false;
  // Stores action output result for [Bottom Sheet - popup_ChatContatos] action in IconButton widget.
  ConversasRow? conversaContatos;
  // State field(s) for TextFieldbuscar widget.
  FocusNode? textFieldbuscarFocusNode;
  TextEditingController? textFieldbuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldbuscarTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchConversas)] action in TextFieldbuscar widget.
  ApiCallResponse? apiResultntdConversas;
  // State field(s) for TabBarconversas widget.
  TabController? tabBarconversasController;
  int get tabBarconversasCurrentIndex =>
      tabBarconversasController != null ? tabBarconversasController!.index : 0;

  // State field(s) for ListViewOffInicioTodas widget.
  ScrollController? listViewOffInicioTodas;
  // State field(s) for ListViewOffIniciofiltro widget.
  ScrollController? listViewOffIniciofiltro;
  // State field(s) for ListViewOn widget.
  ScrollController? listViewOn1;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListViewOffEspera widget.
  ScrollController? listViewOffEspera;
  // State field(s) for ListViewSearchOnEspera widget.
  ScrollController? listViewSearchOnEspera;
  // State field(s) for ListViewFiltroEspera widget.
  ScrollController? listViewFiltroEspera;
  // State field(s) for MouseRegionEspera widget.
  bool mouseRegionEsperaHovered1 = false;
  // State field(s) for MouseRegionEspera widget.
  bool mouseRegionEsperaHovered2 = false;
  // State field(s) for MouseRegionEspera widget.
  bool mouseRegionEsperaHovered3 = false;
  // State field(s) for MouseRegionEspera widget.
  bool mouseRegionEsperaHovered4 = false;
  // State field(s) for MouseRegioniconfechar widget.
  bool mouseRegioniconfecharHovered1 = false;
  // State field(s) for MouseRegion1 widget.
  bool mouseRegion1Hovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for ListViewConversas widget.
  ScrollController? listViewConversas1;
  // Stores action output result for [Custom Action - getRowByIdWebhook] action in IconButton widget.
  WebhookRow? webhooksOutro;
  // Stores action output result for [Custom Action - getRowByIdWebhook] action in IconButton widget.
  WebhookRow? webhooksOutro2;
  // Model for PopupRecAudio component.
  late PopupRecAudioModel popupRecAudioModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for Column widget.
  ScrollController? columnController2;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for botaoDocument component.
  late BotaoDocumentModel botaoDocumentModel;
  // Model for botaoVideo component.
  late BotaoVideoModel botaoVideoModel;
  // Stores action output result for [Bottom Sheet - popup_ChatContatos] action in Button widget.
  ConversasRow? contatos2;
  // Stores action output result for [Backend Call - API (EnviarContato)] action in Button widget.
  ApiCallResponse? apiResultjdw;
  // State field(s) for ListViewOff widget.
  ScrollController? listViewOff;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in IconButton widget.
  ApiCallResponse? apiResultlo52;
  // State field(s) for ListViewOn widget.
  ScrollController? listViewOn2;
  // Stores action output result for [Backend Call - API (EnviarMensagem)] action in IconButton widget.
  ApiCallResponse? apiResultlo57758;
  // Model for replyCard component.
  late ReplyCardModel replyCardModel7;
  // Stores action output result for [Custom Action - selectEmoji] action in IconButton widget.
  String? emoji;
  // State field(s) for TextFieldMensagem widget.
  FocusNode? textFieldMensagemFocusNode;
  TextEditingController? textFieldMensagemTextController;
  String? Function(BuildContext, String?)?
      textFieldMensagemTextControllerValidator;
  // Stores action output result for [Backend Call - API (EnviarReply)] action in TextFieldMensagem widget.
  ApiCallResponse? apiResult6q5982;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in TextFieldMensagem widget.
  ConversasRow? getrow3;
  // Stores action output result for [Backend Call - API (EnviarAudioURL)] action in btnMsg1 widget.
  ApiCallResponse? apiResulta7g;
  // Stores action output result for [Backend Call - API (EnviarImagem)] action in btnMsg1 widget.
  ApiCallResponse? apiResultkm5;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - API (EnviarURLArquivo)] action in btnMsg1 widget.
  ApiCallResponse? apiResulto2s;
  // Stores action output result for [Backend Call - API (EnviarVideoURL)] action in btnMsg1 widget.
  ApiCallResponse? apiResult6q5;
  // Stores action output result for [Backend Call - API (EnviarReply)] action in btnMsg1 widget.
  ApiCallResponse? apiResult6q598;
  // Stores action output result for [Backend Call - API (EnviarImagem)] action in btnMsg3 widget.
  ApiCallResponse? apiResultkm599;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Stores action output result for [Backend Call - API (EnviarDocumento)] action in btnMsg2 widget.
  ApiCallResponse? apiResultlgm;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // State field(s) for MouseRegioniconfechar widget.
  bool mouseRegioniconfecharHovered2 = false;
  // State field(s) for MouseRegion1 widget.
  bool mouseRegion1Hovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for ListViewConversas widget.
  ScrollController? listViewConversas2;
  // State field(s) for DropDownconexaoNOVA widget.
  String? dropDownconexaoNOVAValue;
  FormFieldController<String>? dropDownconexaoNOVAValueController;
  // Stores action output result for [Custom Action - getRowByIdConversas] action in Button widget.
  ConversasRow? getIdConversa;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversasRow? conversaConexaoNOVA;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // Stores action output result for [Custom Action - getRowByIdContatos] action in IconButton widget.
  ContatosRow? getRowContatos;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    listViewOffInicioTodas = ScrollController();
    listViewOffIniciofiltro = ScrollController();
    listViewOn1 = ScrollController();
    columnController1 = ScrollController();
    listViewOffEspera = ScrollController();
    listViewSearchOnEspera = ScrollController();
    listViewFiltroEspera = ScrollController();
    listViewConversas1 = ScrollController();
    popupRecAudioModel = createModel(context, () => PopupRecAudioModel());
    columnController2 = ScrollController();
    botaoDocumentModel = createModel(context, () => BotaoDocumentModel());
    botaoVideoModel = createModel(context, () => BotaoVideoModel());
    listViewOff = ScrollController();
    listViewOn2 = ScrollController();
    replyCardModel7 = createModel(context, () => ReplyCardModel());
    listViewConversas2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldbuscarFocusNode?.dispose();
    textFieldbuscarTextController?.dispose();

    tabBarconversasController?.dispose();
    listViewOffInicioTodas?.dispose();
    listViewOffIniciofiltro?.dispose();
    listViewOn1?.dispose();
    columnController1?.dispose();
    listViewOffEspera?.dispose();
    listViewSearchOnEspera?.dispose();
    listViewFiltroEspera?.dispose();
    listViewConversas1?.dispose();
    popupRecAudioModel.dispose();
    timerController.dispose();
    columnController2?.dispose();
    botaoDocumentModel.dispose();
    botaoVideoModel.dispose();
    listViewOff?.dispose();
    listViewOn2?.dispose();
    replyCardModel7.dispose();
    textFieldMensagemFocusNode?.dispose();
    textFieldMensagemTextController?.dispose();

    listViewConversas2?.dispose();
    columnController3?.dispose();
    tabBarController?.dispose();
    columnController4?.dispose();
    listViewController?.dispose();
  }

  /// Action blocks.
  Future enviarTextoAPI(BuildContext context) async {
    ApiCallResponse? apiResultlo5775;

    if (functions.regexEspaco(textFieldMensagemTextController.text)) {
      return;
    }
    apiResultlo5775 = await ChatFireMensagemGroup.enviarMensagemCall.call(
      id: conversa?.numeroContato,
      message:
          '${FFAppState().colabUser.genero == 'Feminino' ? '👩‍💼' : '👨‍💼'} *${FFAppState().colabUser.nome}*${functions.newLine()}${functions.newLine()}${textFieldMensagemTextController.text}',
      instanceKey: FFAppState().colabUser.keyColabUser,
    );

    if ((apiResultlo5775?.succeeded ?? true)) {
      await WebhookTable().insert({
        'fromMe': true,
        'contatos': conversa?.numeroContato,
        'chatfire': true,
        'mensagem':
            '${FFAppState().colabUser.genero == 'Feminino' ? '👩‍💼' : '👨‍💼'} *${FFAppState().colabUser.nome}*${functions.newLine()}${functions.newLine()}${textFieldMensagemTextController.text}',
        'Lida': true,
        'id_api_conversa': conversa?.idApi,
        'idMensagem': ChatFireMensagemGroup.enviarMensagemCall.idMensagem(
          (apiResultlo5775?.jsonBody ?? ''),
        ),
        'data': getJsonField(
          (apiResultlo5775?.jsonBody ?? ''),
          r'''$.data''',
        ),
      });
      await ConversasTable().update(
        data: {
          'ultima_mensagem': valueOrDefault<String>(
            textFieldMensagemTextController.text,
            'vazio',
          ),
          'horario_ultima_mensagem':
              supaSerialize<DateTime>(getCurrentTimestamp),
          'atualizado': false,
        },
        matchingRows: (rows) => rows.eq(
          'id',
          conversa?.id,
        ),
      );
      FFAppState().URLimage = '';
      FFAppState().URLfile = '';
      FFAppState().DropImage = '';
      FFAppState().URLaudio = '';
      FFAppState().URLDoc = '';
      FFAppState().URLVideo = '';
      FFAppState().replyWebhook = 0;
      verlistaresposta = false;
    } else {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: PopupErrorAPIWidget(),
            ),
          );
        },
      );
    }
  }

  Future iniciarAtendimentoComSetor(
    BuildContext context, {
    int? idsetor,
  }) async {
    ConversasRow? getRow45;
    ApiCallResponse? apiResultadwAceitar34Copy;
    ApiCallResponse? apiResult28Atender2Copy;

    await ConversasTable().update(
      data: {
        'atualizado': true,
        'authid': currentUserUid,
        'ref_empresa': FFAppState().colabUser.refEmpresa,
        'foto_colabUser': FFAppState().colabUser.foto,
        'Status': 'Em Atendimento',
        'Protocolo': conversa?.id?.toString(),
        'isdeleted_conversas': false,
        'id_setor': idsetor,
        'colabuser_nome': FFAppState().colabUser.nome,
        'empresa_nome': FFAppState().colabUser.nomeEmpresa,
      },
      matchingRows: (rows) => rows.eq(
        'id',
        conversa?.id,
      ),
    );
    await ContatosTable().update(
      data: {
        'ref_conversa': conversa?.id,
        'status_conversa': 'Em Atendimento',
        'ref_empresa': FFAppState().colabUser.refEmpresa,
      },
      matchingRows: (rows) => rows.eq(
        'id',
        conversa?.refContatos,
      ),
    );
    getRow45 = await actions.getRowByIdConversas(
      conversa?.id?.toString(),
    );
    conversa = getRow45;
    FFAppState().updateColabUserStruct(
      (e) => e..keyColabUser = getRow45?.keyInstancia,
    );
    FFAppState().update(() {});
    if (!(textFieldMensagemTextController.text != null &&
        textFieldMensagemTextController.text != '')) {
      apiResultadwAceitar34Copy = await SelectDataGroup.selectBotCall.call(
        refEmpresa: FFAppState().colabUser.refEmpresa,
      );

      if ((apiResultadwAceitar34Copy?.succeeded ?? true)) {
        apiResult28Atender2Copy =
            await ChatFireMensagemGroup.enviarMensagemCall.call(
          instanceKey: FFAppState().colabUser.keyColabUser,
          id: conversa?.numeroContato,
          message: functions.msgAssumir(() {
            if (FFAppState().colabUser.genero == 'Masculino') {
              return '👨‍💼';
            } else if (FFAppState().colabUser.genero == 'Feminino') {
              return '👩‍💼';
            } else {
              return '👨‍💼';
            }
          }(),
              FFAppState().colabUser.nome,
              conversa!.nomeContato!,
              'Olá',
              SelectDataGroup.selectBotCall.msgAssumir(
                (apiResultadwAceitar34Copy?.jsonBody ?? ''),
              )!),
        );

        if ((apiResult28Atender2Copy?.succeeded ?? true)) {
          await WebhookTable().insert({
            'fromMe': true,
            'contatos': conversa?.numeroContato,
            'chatfire': true,
            'mensagem': functions.msgAssumir(() {
              if (FFAppState().colabUser.genero == 'Masculino') {
                return '👨‍💼';
              } else if (FFAppState().colabUser.genero == 'Feminino') {
                return '👩‍💼';
              } else {
                return '👨‍💼';
              }
            }(),
                FFAppState().colabUser.nome,
                conversa!.nomeContato!,
                'Olá',
                SelectDataGroup.selectBotCall.msgAssumir(
                  (apiResultadwAceitar34Copy?.jsonBody ?? ''),
                )!),
            'Lida': true,
            'id_api_conversa': conversa?.idApi,
            'idMensagem': ChatFireMensagemGroup.enviarMensagemCall.idMensagem(
              (apiResult28Atender2Copy?.jsonBody ?? ''),
            ),
            'data': getJsonField(
              (apiResult28Atender2Copy?.jsonBody ?? ''),
              r'''$.data''',
            ),
          });
        } else {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: PopupErrorAPIWidget(),
                ),
              );
            },
          );
        }
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: PopupErrorAPIWidget(),
              ),
            );
          },
        );
      }
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Color(0x00FFFFFF),
      barrierColor: Color(0x00FFFFFF),
      enableDrag: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: AlertChatfireWidget(
                titulo: 'Atendimento Iniciado',
                texto: 'atendimento iniciado com ${conversa?.nomeContato}',
                cor: FlutterFlowTheme.of(context).success,
              ),
            ),
          ),
        );
      },
    );
  }

  Future filtroEspera(
    BuildContext context, {
    int? instanciafiltrosSQL,
  }) async {
    ApiCallResponse? apiResulthmq;

    if (instanciafiltrosSQL == 0) {
      return;
    }
    apiResulthmq = await SearchChatFireGroup.searchConversasEsperaCall.call(
      isEspera: functions.numerocontemdigito(4, instanciaFiltroSQL),
      isForaHorario: functions.numerocontemdigito(2, instanciaFiltroSQL),
      isTransferida: functions.numerocontemdigito(3, instanciaFiltroSQL),
      pNomeContato: textFieldbuscarTextController.text,
      listaSetoresId: functions.listaintergerToString(FFAppState()
          .colabUser
          .setoresUsers
          .map((e) => e.setorId)
          .toList()
          .toList()),
    );

    if ((apiResulthmq?.succeeded ?? true)) {
      listaIDConversaEspera =
          (apiResulthmq?.jsonBody ?? '').toList().cast<dynamic>();
    } else {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: PopupErrorAPIWidget(),
            ),
          );
        },
      );
    }
  }

  Future verConversa(
    BuildContext context, {
    int? idConversa,
    String? key,
    ConversasRow? conversaRow,
  }) async {
    ApiCallResponse? apiGetconexao;
    ConversasRow? result23;

    texfieldFocus = false;
    apiGetconexao = await GetDataGroup.getConexaoAtivaCall.call(
      key: key,
    );

    if ((apiGetconexao?.bodyText ?? '') == '[]') {
      conversa = null;
      texfieldFocus = false;
      conexaoAtiva = false;
      idConversaPage = idConversa;
      jsonChatConversas = [];
      return;
    } else if (!GetDataGroup.getConexaoAtivaCall.status(
      (apiGetconexao?.jsonBody ?? ''),
    )!) {
      conversa = null;
      texfieldFocus = false;
      idConversaPage = idConversa;
      conexaoAtiva = false;
      jsonChatConversas = [];
      return;
    } else {
      conversa = null;
      idConversaPage = null;
      conexaoAtiva = true;
      jsonChatConversas = [];
    }

    if (conversaRow != null) {
      conversa = conversaRow;
      infoaberta = true;
    } else {
      result23 = await actions.getRowByIdConversas(
        idConversa?.toString(),
      );
      conversa = result23;
      infoaberta = true;
    }

    texfieldFocus = true;
  }

  Future iniciarAtendimentoSemSetor(BuildContext context) async {
    ConversasRow? conversaAceita2;

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: AceitarConversaWidget(
              conversa: conversa!,
            ),
          ),
        );
      },
    ).then((value) => conversaAceita2 = value);

    if (conversaAceita2 != null) {
      conversa = conversaAceita2;
    }
  }

  Future triagemIniciarAtendimento(BuildContext context) async {
    if (conversa?.status == 'Visualizar') {
      if (FFAppState().colabUser.setoresUsers.length > 1) {
        await iniciarAtendimentoSemSetor(context);
      } else {
        await iniciarAtendimentoComSetor(
          context,
          idsetor: FFAppState().colabUser.setoresUsers.first.setorId,
        );
      }
    } else if (conversa?.status == 'Espera') {
      await iniciarAtendimentoComSetor(
        context,
        idsetor: conversa?.idSetor,
      );
    } else if (conversa?.status == 'Em Atendimento') {}
  }

  Future enviarImagemAPI(
    BuildContext context, {
    FFUploadedFile? uploadedFile,
  }) async {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
