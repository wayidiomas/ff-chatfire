import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_chatfire_widget.dart';
import '/components/popup_error_a_p_i_widget.dart';
import '/components/popup_error_contato_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future fluxpAPIFotoContato(
  BuildContext context, {
  required String? numero,
}) async {
  ApiCallResponse? apiFotoPerfil999;

  FFAppState().numeroValido = true;
  FFAppState().update(() {});
  apiFotoPerfil999 = await ChatFireInstanciaGroup.receberFotoPerfilCall.call(
    id: numero,
    key: FFAppState().colabUser.keyColabUser,
  );

  if (!ChatFireInstanciaGroup.receberFotoPerfilCall.erro(
    (apiFotoPerfil999?.jsonBody ?? ''),
  )!) {
    FFAppState().fotoValida = true;
    FFAppState().fotoPerfilContato =
        ChatFireInstanciaGroup.receberFotoPerfilCall.urlFotoPerfil(
      (apiFotoPerfil999?.jsonBody ?? ''),
    )!;
    FFAppState().update(() {});
  } else {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: PopupErrorContatoWidget(
            titulo: 'Este usuário ativou a privacidade de seu perfil.',
            info: ' insira manualmente a foto de perfil e nome do contato',
          ),
        );
      },
    );

    FFAppState().fotoValida = false;
    FFAppState().update(() {});
  }
}

Future<bool?> verificarContato(
  BuildContext context, {
  String? numero,
}) async {
  ApiCallResponse? verificar;

  verificar = await SelectDataGroup.verificarContatoCall.call(
    numero: numero,
    idEmpresa: FFAppState().colabUser.refEmpresa,
  );

  if ((verificar?.jsonBody ?? '')) {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: PopupErrorContatoWidget(
            titulo: 'Número duplicado.',
            info:
                'Este número ja existe no banco de dados da ${valueOrDefault<String>(
              FFAppState().colabUser.nomeEmpresa,
              'sua empresa',
            )}',
          ),
        );
      },
    );

    return true;
  }

  return null;
}

Future stopRecursiveActins(BuildContext context) async {}

Future selectEmpresa(BuildContext context) async {
  ApiCallResponse? apiResultdam1;

  apiResultdam1 = await SelectDataGroup.selectEmpresaCall.call(
    idEmpresa: FFAppState().colabUser.refEmpresa,
  );

  if ((apiResultdam1?.succeeded ?? true)) {
    FFAppState().updateColabUserStruct(
      (e) => e
        ..nomeEmpresa = SelectDataGroup.selectEmpresaCall.nomeEmpresa(
          (apiResultdam1?.jsonBody ?? ''),
        )
        ..empresaAssunto = SelectDataGroup.selectEmpresaCall.assuntoObrigatorio(
          (apiResultdam1?.jsonBody ?? ''),
        ),
    );
    FFAppState().update(() {});
  }
}

Future<String?> triagemUser(
  BuildContext context, {
  String? pagina,
}) async {
  ApiCallResponse? apiResultdj29;
  ApiCallResponse? apiResultdam1;
  ApiCallResponse? apiResult8v6;
  ApiCallResponse? apiResult0v62;

  if (loggedIn) {
    await ColabUserTable().update(
      data: {
        'online': true,
      },
      matchingRows: (rows) => rows.eq(
        'auth_id',
        currentUserUid,
      ),
    );
    if (true) {
      apiResultdj29 = await SelectDataGroup.selectColabUserCall.call(
        authId: currentUserUid,
      );

      if ((apiResultdj29?.succeeded ?? true)) {
        FFAppState().colabUser = ColabUserStruct(
          refEmpresa: SelectDataGroup.selectColabUserCall.idEmpresa(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          nome: SelectDataGroup.selectColabUserCall.nome(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          email: currentUserEmail,
          tipo: SelectDataGroup.selectColabUserCall.tipo(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          id: SelectDataGroup.selectColabUserCall.id(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          genero: SelectDataGroup.selectColabUserCall.genero(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          dataNascimento: SelectDataGroup.selectColabUserCall.dataNascimento(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          contato: SelectDataGroup.selectColabUserCall.contato(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          foto: SelectDataGroup.selectColabUserCall.foto(
            (apiResultdj29?.jsonBody ?? ''),
          ),
          ativo: SelectDataGroup.selectColabUserCall.ativo(
            (apiResultdj29?.jsonBody ?? ''),
          ),
        );
        FFAppState().update(() {});
        if ((FFAppState().colabUser.tipo == 'Operador') && (pagina != 'chat')) {
          context.goNamed(
            'Chat',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return null;
        }
        if (FFAppState().colabUser.ativo == false) {
          return 'deslogar';
        }
        apiResultdam1 = await SelectDataGroup.selectEmpresaCall.call(
          idEmpresa: FFAppState().colabUser.refEmpresa,
        );

        if ((apiResultdam1?.succeeded ?? true)) {
          FFAppState().updateColabUserStruct(
            (e) => e
              ..nomeEmpresa = SelectDataGroup.selectEmpresaCall.nomeEmpresa(
                (apiResultdam1?.jsonBody ?? ''),
              )
              ..empresaAssunto =
                  SelectDataGroup.selectEmpresaCall.assuntoObrigatorio(
                (apiResultdam1?.jsonBody ?? ''),
              )
              ..userMasterEmpresa =
                  SelectDataGroup.selectEmpresaCall.userMaster(
                (apiResultdam1?.jsonBody ?? ''),
              ),
          );
          FFAppState().update(() {});
        }
        apiResult8v6 = await SelectDataGroup.setoresUserCall.call(
          authid: currentUserUid,
        );

        if ((apiResult8v6?.succeeded ?? true)) {
          FFAppState().updateColabUserStruct(
            (e) => e
              ..setoresUsers = ((apiResult8v6?.jsonBody ?? '')
                      .toList()
                      .map<SetoresStruct?>(SetoresStruct.maybeFromMap)
                      .toList() as Iterable<SetoresStruct?>)
                  .withoutNulls
                  .toList(),
          );
          FFAppState().update(() {});
        }
        apiResult0v62 = await SelectDataGroup.conexaoSetoresUserCall.call(
          authID: currentUserUid,
        );

        if ((apiResult0v62?.succeeded ?? true)) {
          FFAppState().setorConexao = ((apiResult0v62?.jsonBody ?? '')
                  .toList()
                  .map<SetoresConexaoStruct?>(SetoresConexaoStruct.maybeFromMap)
                  .toList() as Iterable<SetoresConexaoStruct?>)
              .withoutNulls
              .toList()
              .cast<SetoresConexaoStruct>();
          FFAppState().updateColabUserStruct(
            (e) => e
              ..setorConexao = ((apiResult0v62?.jsonBody ?? '')
                      .toList()
                      .map<SetoresConexaoStruct?>(
                          SetoresConexaoStruct.maybeFromMap)
                      .toList() as Iterable<SetoresConexaoStruct?>)
                  .withoutNulls
                  .toList(),
          );
          FFAppState().update(() {});
          if ((apiResult0v62?.bodyText ?? '') == '[]') {
            FFAppState().updateColabUserStruct(
              (e) => e..keyColabUser = null,
            );
            FFAppState().textoTest = 'zerou';
            FFAppState().update(() {});
          }
          if ((FFAppState().colabUser.tipo == 'Operador') &&
              ((apiResult0v62?.bodyText ?? '') == '[]')) {
            FFAppState().textoTest = 'conexao Operador';
            FFAppState().update(() {});
            return 'deslogar conexao';
          } else if ((FFAppState().colabUser.tipo == 'Administrador') &&
              ((apiResult0v62?.bodyText ?? '') == '[]')) {
            FFAppState().textoTest = 'conexao ADM';
            FFAppState().update(() {});
            return 'conexao';
          } else {
            FFAppState().textoTest = 'tudo certop';
            FFAppState().update(() {});
          }

          if (!(FFAppState().colabUser.keyColabUser != null &&
              FFAppState().colabUser.keyColabUser != '')) {
            FFAppState().updateColabUserStruct(
              (e) =>
                  e..keyColabUser = FFAppState().setorConexao.first.keyConexao,
            );
            FFAppState().update(() {});
          }
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Usuário não cadastrado'),
              content: Text(
                  'parece que você não esta cadastrado na nossa plataforma, caso isso seja um erro, entre em contato com o SUPORTE.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed(
          'HomePage',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    }
  } else {
    context.pushNamed(
      'HomePage',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }

  return null;
}

Future alertChatfire(
  BuildContext context, {
  required String? titulo,
  String? cor,
}) async {
  await showDialog(
    barrierColor: Color(0x00FFFFFF),
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
        child: AlertChatfireWidget(
          titulo: titulo!,
          cor: () {
            if (cor == 'verde') {
              return FlutterFlowTheme.of(context).success;
            } else if (cor == 'vermelho') {
              return FlutterFlowTheme.of(context).error;
            } else if (cor == 'amarelo') {
              return FlutterFlowTheme.of(context).warning;
            } else {
              return FlutterFlowTheme.of(context).primary;
            }
          }(),
        ),
      );
    },
  );

  await Future.delayed(const Duration(milliseconds: 2000));
}

Future atualizarKeyConexao(
  BuildContext context, {
  String? keyConexao,
}) async {
  FFAppState().updateColabUserStruct(
    (e) => e..keyColabUser = keyConexao,
  );
  FFAppState().update(() {});
}

Future<ConversasRow?> assumirAtendimento(
  BuildContext context, {
  ConversasRow? conversa,
  int? setor,
  String? keyColabuser,
}) async {
  ConversasRow? getRow4;
  ApiCallResponse? apiResultadwAceitar;
  ApiCallResponse? apiResult28Atender1;

  FFAppState().mudaChat = true;
  await action_blocks.atualizarKeyConexao(
    context,
    keyConexao: keyColabuser,
  );
  await ConversasTable().update(
    data: {
      'atualizado': true,
      'authid': currentUserUid,
      'ref_empresa': FFAppState().colabUser.refEmpresa,
      'foto_colabUser': FFAppState().colabUser.foto,
      'Status': 'Em Atendimento',
      'Protocolo': conversa?.id?.toString(),
      'isdeleted_conversas': false,
      'id_setor': setor,
      'key_instancia': keyColabuser,
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
  getRow4 = await actions.getRowByIdConversas(
    conversa?.id?.toString(),
  );
  if (!(FFAppState().textfieldPreenchido != null &&
      FFAppState().textfieldPreenchido != '')) {
    apiResultadwAceitar = await SelectDataGroup.selectBotCall.call(
      refEmpresa: FFAppState().colabUser.refEmpresa,
    );

    if ((apiResultadwAceitar?.succeeded ?? true)) {
      apiResult28Atender1 = await ChatFireMensagemGroup.enviarMensagemCall.call(
        instanceKey: keyColabuser,
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
              (apiResultadwAceitar?.jsonBody ?? ''),
            )!),
      );

      if ((apiResult28Atender1?.succeeded ?? true)) {
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
                (apiResultadwAceitar?.jsonBody ?? ''),
              )!),
          'Lida': true,
          'id_api_conversa': conversa?.idApi,
          'data': getJsonField(
            (apiResult28Atender1?.jsonBody ?? ''),
            r'''$.data''',
          ),
          'idMensagem': ChatFireMensagemGroup.enviarMensagemCall.idMensagem(
            (apiResult28Atender1?.jsonBody ?? ''),
          ),
        });
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: PopupErrorAPIWidget(),
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
          return Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: PopupErrorAPIWidget(),
          );
        },
      );
    }
  }
  return getRow4;
}

Future enviarTextoAPIapp(
  BuildContext context, {
  String? mensagem,
  String? numerocontato,
  ConversasRow? conversa,
}) async {
  ApiCallResponse? apiResultelp;

  apiResultelp = await ChatFireMensagemGroup.enviarMensagemCall.call(
    instanceKey: FFAppState().colabUser.keyColabUser,
    id: numerocontato,
    message: mensagem,
  );

  if ((apiResultelp?.succeeded ?? true)) {
    await WebhookTable().insert({
      'fromMe': true,
      'contatos': numerocontato,
      'chatfire': true,
      'mensagem': mensagem,
      'Lida': true,
      'id_api_conversa': conversa?.idApi,
      'idMensagem': ChatFireMensagemGroup.enviarMensagemCall.idMensagem(
        (apiResultelp?.jsonBody ?? ''),
      ),
      'data': getJsonField(
        (apiResultelp?.jsonBody ?? ''),
        r'''$.data''',
      ),
    });
    await ConversasTable().update(
      data: {
        'ultima_mensagem': mensagem,
        'horario_ultima_mensagem': supaSerialize<DateTime>(getCurrentTimestamp),
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
  }
}
