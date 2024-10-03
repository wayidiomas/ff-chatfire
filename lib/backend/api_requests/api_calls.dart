import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ChatFireInstancia Group Code

class ChatFireInstanciaGroup {
  static String getBaseUrl() => 'https://api.fireapi.com.br';
  static Map<String, String> headers = {};
  static StatusCall statusCall = StatusCall();
  static IniciarCall iniciarCall = IniciarCall();
  static ScanQrcodeCall scanQrcodeCall = ScanQrcodeCall();
  static ObterQrBaseMeiaQuatroCall obterQrBaseMeiaQuatroCall =
      ObterQrBaseMeiaQuatroCall();
  static ObterInformacoesCall obterInformacoesCall = ObterInformacoesCall();
  static RestaurarInstanciaCall restaurarInstanciaCall =
      RestaurarInstanciaCall();
  static DeletarInstanciaCall deletarInstanciaCall = DeletarInstanciaCall();
  static TerminarSessaoCall terminarSessaoCall = TerminarSessaoCall();
  static ListarInstanciasCall listarInstanciasCall = ListarInstanciasCall();
  static ObterDadosCall obterDadosCall = ObterDadosCall();
  static ConferirNumeroTelefoneCall conferirNumeroTelefoneCall =
      ConferirNumeroTelefoneCall();
  static ReceberFotoPerfilCall receberFotoPerfilCall = ReceberFotoPerfilCall();
  static ObterStatusValidandoUsuarioCall obterStatusValidandoUsuarioCall =
      ObterStatusValidandoUsuarioCall();
}

class StatusCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Status',
      apiUrl: '${baseUrl}/status',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IniciarCall {
  Future<ApiCallResponse> call({
    int? idConexao,
    int? idEmpresa,
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Iniciar',
      apiUrl: '${baseUrl}/instance/init?id=${idConexao}&empresaId=${idEmpresa}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? qrcode(dynamic response) => getJsonField(
        response,
        r'''$.qrcode''',
      );
  dynamic? webhook(dynamic response) => getJsonField(
        response,
        r'''$.webhook''',
      );
  String? key(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
}

class ScanQrcodeCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ScanQrcode',
      apiUrl: '${baseUrl}/instance/qr?key=${instanceKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObterQrBaseMeiaQuatroCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObterQrBaseMeiaQuatro',
      apiUrl: '${baseUrl}/instance/qrbase64?key=${instanceKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic qrcodeURL(dynamic response) => getJsonField(
        response,
        r'''$.qrcode''',
      );
}

class ObterInformacoesCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObterInformacoes',
      apiUrl: '${baseUrl}/instance/info?key=${instanceKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.instance_data.user.name''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.instance_data.user.id''',
      ));
  bool? phoneconnected(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.instance_data.phone_connected''',
      ));
  bool? errorPhone(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class RestaurarInstanciaCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'RestaurarInstancia',
      apiUrl: '${baseUrl}/instance/restore',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletarInstanciaCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Deletar instancia',
      apiUrl: '${baseUrl}/instance/delete?key=${instanceKey}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TerminarSessaoCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TerminarSessao',
      apiUrl: '${baseUrl}/instance/logout?key=${instanceKey}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ListarInstanciasCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListarInstancias',
      apiUrl: '${baseUrl}/instance/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObterDadosCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObterDados',
      apiUrl: '${baseUrl}/instance/getstats?key=${instanceKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConferirNumeroTelefoneCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? id = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Conferir Numero Telefone',
      apiUrl: '${baseUrl}/misc/onwhatsapp?key=${key}&id=${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? erro(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.error''',
      ));
  int? codigoErro(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? mensagemErro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ReceberFotoPerfilCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? id = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ReceberFotoPerfil',
      apiUrl: '${baseUrl}/misc/downProfile?key=${key}&id=${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? erro(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.error''',
      ));
  String? urlFotoPerfil(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ObterStatusValidandoUsuarioCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? numeroContato = '',
  }) async {
    final baseUrl = ChatFireInstanciaGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObterStatusValidandoUsuario',
      apiUrl: '${baseUrl}/misc/getStatus?key=${key}&id=${numeroContato}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isErro(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.error''',
      ));
  dynamic? responseStatus(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? statuswpp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.status''',
      ));
  String? dataSetAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.setAt''',
      ));
  String? mensagemErro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End ChatFireInstancia Group Code

/// Start ChatFireMensagem Group Code

class ChatFireMensagemGroup {
  static String getBaseUrl() => 'https://api.fireapi.com.br';
  static Map<String, String> headers = {};
  static EnviarMensagemCall enviarMensagemCall = EnviarMensagemCall();
  static EnviarImagemCall enviarImagemCall = EnviarImagemCall();
  static EnviarVideoCall enviarVideoCall = EnviarVideoCall();
  static EnviarAudioCall enviarAudioCall = EnviarAudioCall();
  static EnviarDocumentoCall enviarDocumentoCall = EnviarDocumentoCall();
  static EnviarURLArquivoCall enviarURLArquivoCall = EnviarURLArquivoCall();
  static EnviarAudioURLCall enviarAudioURLCall = EnviarAudioURLCall();
  static EnviarVideoURLCall enviarVideoURLCall = EnviarVideoURLCall();
  static EnviarContatoCall enviarContatoCall = EnviarContatoCall();
  static EnviarReplyCall enviarReplyCall = EnviarReplyCall();
  static DeletarMensagemCall deletarMensagemCall = DeletarMensagemCall();
}

class EnviarMensagemCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? id = '',
    String? message = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EnviarMensagem',
      apiUrl: '${baseUrl}/message/text?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'id': id,
        'message': message,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? mensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message.extendedTextMessage.text''',
      ));
  String? contatoParaRegexp(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.key.remoteJid''',
      ));
  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
  String? instaciaKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.instance_key''',
      ));
}

class EnviarImagemCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    FFUploadedFile? image,
    String? numero = '',
    String? caption = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EnviarImagem',
      apiUrl: '${baseUrl}/message/image?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'id': numero,
        'file': image,
        'caption': caption,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarVideoCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    FFUploadedFile? file,
    String? numeroContato = '',
    String? caption = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EnviarVideo',
      apiUrl: '${baseUrl}/message/video?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
        'id': numeroContato,
        'caption': caption,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarAudioCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? file = '',
    String? id = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}",
  "url": "${file}",
  "type": "audio"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarAudio',
      apiUrl: '${baseUrl}/message/audio?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarDocumentoCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    FFUploadedFile? file,
    String? numero = '',
    String? filename = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EnviarDocumento',
      apiUrl: '${baseUrl}/message/doc?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
        'id': numero,
        'filename': filename,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarURLArquivoCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? numeroContato = '',
    String? url = '',
    String? mimetype = '',
    String? legenda = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${numeroContato}",
  "url": "${url}",
  "type": "document",
  "mimetype": "${mimetype}",
  "caption": "${legenda}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarURLArquivo',
      apiUrl: '${baseUrl}/message/mediaurl?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
}

class EnviarAudioURLCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? id = '',
    String? url = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}",
  "url": "${url}",
  "type": "audio"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarAudioURL',
      apiUrl: '${baseUrl}/message/mediaurl?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
}

class EnviarVideoURLCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? id = '',
    String? url = '',
    String? caption = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}",
  "url": "${url}",
  "type": "video",
  "caption": "${caption}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarVideoURL',
      apiUrl: '${baseUrl}/message/mediaurl?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
}

class EnviarContatoCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? numeroReceptor = '',
    String? fullName = '',
    String? phoneNumber = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${numeroReceptor}",
  "fullName": "${fullName}",
  "phoneNumber": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarContato',
      apiUrl: '${baseUrl}/message/contact?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
}

class EnviarReplyCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? numero = '',
    dynamic? webhookReplyJson,
    String? content = '',
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final webhookReply = _serializeJson(webhookReplyJson);
    final ffApiRequestBody = '''
{
  "id": "${numero}",
  "message": ${webhookReply},
  "content": "${content}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarReply',
      apiUrl: '${baseUrl}/message/reply?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idMensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key.id''',
      ));
}

class DeletarMensagemCall {
  Future<ApiCallResponse> call({
    String? instanceKey = '',
    String? numero = '',
    dynamic? dataJson,
  }) async {
    final baseUrl = ChatFireMensagemGroup.getBaseUrl();

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "id": "${numero}",
  "data": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeletarMensagem',
      apiUrl: '${baseUrl}/message/delete?key=${instanceKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ChatFireMensagem Group Code

/// Start SearchChatFire Group Code

class SearchChatFireGroup {
  static String getBaseUrl() =>
      'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {};
  static SearchRespostasCall searchRespostasCall = SearchRespostasCall();
  static SearchConversasCall searchConversasCall = SearchConversasCall();
  static SearchContatosCall searchContatosCall = SearchContatosCall();
  static SearchColabUserCall searchColabUserCall = SearchColabUserCall();
  static SearchConexaoCall searchConexaoCall = SearchConexaoCall();
  static SearchContatosInativosCall searchContatosInativosCall =
      SearchContatosInativosCall();
  static SearchHistoricoAtendimentoCall searchHistoricoAtendimentoCall =
      SearchHistoricoAtendimentoCall();
  static SearchConversasEsperaCall searchConversasEsperaCall =
      SearchConversasEsperaCall();
  static SearchVerificarConversaCall searchVerificarConversaCall =
      SearchVerificarConversaCall();
}

class SearchRespostasCall {
  Future<ApiCallResponse> call({
    String? textSearch = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "ref_empresa": "${refEmpresa}",
  "termo_pesquisa": "${textSearch}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchRespostas',
      apiUrl: '${baseUrl}/buscar_atalhos_resposta_rapida',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchConversasCall {
  Future<ApiCallResponse> call({
    String? searchText = '',
    int? refEmpresa,
    String? authid = '',
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "qref_empresa": "${refEmpresa}",
  "search_text": "${searchText}",
  "auth_id": "${authid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchConversas',
      apiUrl: '${baseUrl}/searchnomeconversascerta',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class SearchContatosCall {
  Future<ApiCallResponse> call({
    String? searchText = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "qref_empresa": "${refEmpresa}",
  "termo_pesquisa": "${searchText}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchContatos',
      apiUrl: '${baseUrl}/buscar_nome_contato',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
}

class SearchColabUserCall {
  Future<ApiCallResponse> call({
    String? searchText = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "qref_empresa": "${refEmpresa}",
  "termo_pesquisa": "${searchText}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchColabUser',
      apiUrl: '${baseUrl}/buscar_username',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
}

class SearchConexaoCall {
  Future<ApiCallResponse> call({
    String? searchText = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "qref_empresa": "${refEmpresa}",
  "termo_pesquisa": "${searchText}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchConexao',
      apiUrl: '${baseUrl}/buscar_nome_conexao',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? statusConexao(dynamic response) => (getJsonField(
        response,
        r'''$[:].Status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class SearchContatosInativosCall {
  Future<ApiCallResponse> call({
    String? textSearch = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "qref_empresa": "${refEmpresa}",
  "termo_pesquisa": "${textSearch}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchContatosInativos',
      apiUrl: '${baseUrl}/buscar_nome_contato_inativo',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class SearchHistoricoAtendimentoCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? nomeCliente = '',
    String? numeroTelefone = '',
    String? protocolo = '',
    String? conexao = '',
    String? setor = '',
    String? operador = '',
    String? periodoInicial = '',
    String? periodoFinal = '',
    int? refEmpresa,
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "_colabuser_nome": "${operador}",
  "_conexao": "${conexao}",
  "_nome_contato": "${nomeCliente}",
  "_numero_contato": "${numeroTelefone}",
  "_periodo_final": "${periodoFinal}",
  "_periodo_inicial": "${periodoInicial}",
  "_protocolo": "${protocolo}",
  "_setor": "${setor}",
  "_status": "${status}",
  "qref_empresa": "${refEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchHistoricoAtendimento',
      apiUrl: '${baseUrl}/filtrar_conversas',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class SearchConversasEsperaCall {
  Future<ApiCallResponse> call({
    bool? isEspera,
    bool? isForaHorario,
    bool? isTransferida,
    String? pNomeContato = '',
    String? listaSetoresId = '',
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_isespera": "${isEspera}",
  "p_isforahorario": "${isForaHorario}",
  "p_istransferida": "${isTransferida}",
  "p_lista_setores": "${listaSetoresId}",
  "p_nome_contato": "${pNomeContato}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchConversasEspera',
      apiUrl: '${baseUrl}/busca_conversas_espera',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchVerificarConversaCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
    String? keyinstacia = '',
    String? numeroContato = '',
  }) async {
    final baseUrl = SearchChatFireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_id_empresa": "${idEmpresa}",
  "p_key_instancia": "${keyinstacia}",
  "p_numero_contato": "${numeroContato}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchVerificarConversa',
      apiUrl: '${baseUrl}/verificar_conversa_ativa',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SearchChatFire Group Code

/// Start Paginacao Tabelas Group Code

class PaginacaoTabelasGroup {
  static String getBaseUrl() =>
      'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {};
  static BuscarConversasCall buscarConversasCall = BuscarConversasCall();
  static PaginacaoContatosCall paginacaoContatosCall = PaginacaoContatosCall();
  static BucarWebhookCall bucarWebhookCall = BucarWebhookCall();
}

class BuscarConversasCall {
  Future<ApiCallResponse> call({
    int? limite = 16,
    int? empresa,
    String? authid = '',
  }) async {
    final baseUrl = PaginacaoTabelasGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "limite": "${limite}",
  "qref_empresa": "${empresa}",
  "auth_id": "${authid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'buscarConversas',
      apiUrl: '${baseUrl}/buscar_conversas',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class PaginacaoContatosCall {
  Future<ApiCallResponse> call({
    int? limit = 10,
    int? empresa,
  }) async {
    final baseUrl = PaginacaoTabelasGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "limite": "${limit}",
  "qref_empresa": "${empresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PaginacaoContatos',
      apiUrl: '${baseUrl}/paginacao_contatos',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
}

class BucarWebhookCall {
  Future<ApiCallResponse> call({
    int? limite = 10,
    String? idApi = '',
  }) async {
    final baseUrl = PaginacaoTabelasGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "limite": "${limite}",
  "qid_api_conversa": "${idApi}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bucarWebhook',
      apiUrl: '${baseUrl}/buscar_webhooks',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? fromMe(dynamic response) => getJsonField(
        response,
        r'''$[:].fromMe''',
        true,
      ) as List?;
  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
}

/// End Paginacao Tabelas Group Code

/// Start SelectData Group Code

class SelectDataGroup {
  static String getBaseUrl() =>
      'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {};
  static SelectColabUserCall selectColabUserCall = SelectColabUserCall();
  static SelectBotCall selectBotCall = SelectBotCall();
  static SelectJsonSetorCall selectJsonSetorCall = SelectJsonSetorCall();
  static TotalSetoresCall totalSetoresCall = TotalSetoresCall();
  static TotalConexoesCall totalConexoesCall = TotalConexoesCall();
  static ChatConversaCall chatConversaCall = ChatConversaCall();
  static VerificarContatoCall verificarContatoCall = VerificarContatoCall();
  static SelectEmpresaCall selectEmpresaCall = SelectEmpresaCall();
  static SetoresUserCall setoresUserCall = SetoresUserCall();
  static ConexaoSetoresUserCall conexaoSetoresUserCall =
      ConexaoSetoresUserCall();
}

class SelectColabUserCall {
  Future<ApiCallResponse> call({
    String? authId = '',
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_auth_id": "${authId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SelectColabUser',
      apiUrl: '${baseUrl}/get_colab_user_by_auth_id',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? idEmpresa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id_empresa''',
      ));
  String? empreNome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].empresa_nome''',
      ));
  String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].username''',
      ));
  int? setorid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].setor_id''',
      ));
  String? tipo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Tipo''',
      ));
  String? keyColabUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].key_colabuser''',
      ));
  String? genero(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].genero''',
      ));
  String? dataNascimento(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].data_nascimento''',
      ));
  String? contato(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].contato''',
      ));
  String? foto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].profile_picture''',
      ));
  bool? ativo(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].ativo''',
      ));
}

class SelectBotCall {
  Future<ApiCallResponse> call({
    int? refEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refempresa": "${refEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SelectBot',
      apiUrl: '${baseUrl}/buscarbotporempresa',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msgAssumir(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].msg_assumir''',
      ));
  String? msgFinalizar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].msg_finalizar''',
      ));
  bool? ativo(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].ativo''',
      ));
}

class SelectJsonSetorCall {
  Future<ApiCallResponse> call({
    int? refEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id_empresa_ref": "${refEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SelectJsonSetor',
      apiUrl: '${baseUrl}/get_setores_as_json',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalSetoresCall {
  Future<ApiCallResponse> call({
    int? refEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refempresa": "${refEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TotalSetores',
      apiUrl: '${baseUrl}/contar_setores_por_empresa',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalConexoesCall {
  Future<ApiCallResponse> call({
    int? refEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refempresa": "${refEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TotalConexoes',
      apiUrl: '${baseUrl}/contar_conexoes_por_empresa',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatConversaCall {
  Future<ApiCallResponse> call({
    int? pagina,
    int? refcontatosid,
    int? refempresaid,
    String? keyconexao = '',
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "instanciaparam": "${keyconexao}",
  "pagina": "${pagina}",
  "refcontatosid": "${refcontatosid}",
  "refempresaid": "${refempresaid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatConversa',
      apiUrl: '${baseUrl}/buscar_conversas_com_webhooks',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? conversas(dynamic response) => getJsonField(
        response,
        r'''$.results[*]''',
        true,
      ) as List?;
}

class VerificarContatoCall {
  Future<ApiCallResponse> call({
    String? numero = '',
    int? idEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "empresa_id": "${idEmpresa}",
  "numero_a_verificar": "${numero}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerificarContato',
      apiUrl: '${baseUrl}/verificar_numero_existente_em_contatos',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SelectEmpresaCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id_empresa": "${idEmpresa}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SelectEmpresa',
      apiUrl: '${baseUrl}/get_empresa_by_id',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? nomeEmpresa(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Nome''',
      ));
  bool? assuntoObrigatorio(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].assunto_obrigatorio''',
      ));
  String? userMaster(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_master''',
      ));
}

class SetoresUserCall {
  Future<ApiCallResponse> call({
    String? authid = '',
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "apiauth_id": "${authid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SetoresUser',
      apiUrl: '${baseUrl}/get_user_setores',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConexaoSetoresUserCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final baseUrl = SelectDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "current_auth_id": "${authID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConexaoSetoresUser',
      apiUrl: '${baseUrl}/get_acessible_setor_conexao',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SelectData Group Code

/// Start GetData Group Code

class GetDataGroup {
  static String getBaseUrl() =>
      'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
  };
  static GetSetorEmpresaCall getSetorEmpresaCall = GetSetorEmpresaCall();
  static GetSetoresConexoesCall getSetoresConexoesCall =
      GetSetoresConexoesCall();
  static GetChartDataCall getChartDataCall = GetChartDataCall();
  static GetConexoesCall getConexoesCall = GetConexoesCall();
  static GetUserSetorCall getUserSetorCall = GetUserSetorCall();
  static GetSetorPorConexaoCall getSetorPorConexaoCall =
      GetSetorPorConexaoCall();
  static GetConexaoAtivaCall getConexaoAtivaCall = GetConexaoAtivaCall();
  static GetBotHorariosCall getBotHorariosCall = GetBotHorariosCall();
  static GetRelatoriosCall getRelatoriosCall = GetRelatoriosCall();
}

class GetSetorEmpresaCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
    String? coluna = '',
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetSetorEmpresa',
      apiUrl:
          '${baseUrl}//Setores?id_empresas=eq.${idEmpresa}&select=${coluna}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? listaid(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetSetoresConexoesCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetSetoresConexoes',
      apiUrl: '${baseUrl}/setor_conexao?id_empresa=eq.${idEmpresa}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChartDataCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetChartData',
      apiUrl:
          '${baseUrl}/webhook_per_day_current_week?id_empresa=eq.${idEmpresa}&select=*\'',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetConexoesCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetConexoes',
      apiUrl:
          '${baseUrl}/conexoes?id_empresa=eq.${idEmpresa}&Status=eq.true&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? numeros(dynamic response) => (getJsonField(
        response,
        r'''$[:].Número''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUserSetorCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
    int? setorid,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetUserSetor',
      apiUrl:
          '${baseUrl}/setores_users?id_empresa=eq.${idEmpresa}&setor_id=eq.${setorid}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSetorPorConexaoCall {
  Future<ApiCallResponse> call({
    String? key = '',
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetSetorPorConexao',
      apiUrl: '${baseUrl}/setor_conexao?keyConexao=eq.${key}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetConexaoAtivaCall {
  Future<ApiCallResponse> call({
    String? key = '',
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetConexaoAtiva',
      apiUrl: '${baseUrl}/conexoes?instance_key=eq.${key}&select=\"Status\"',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].Status''',
      ));
}

class GetBotHorariosCall {
  Future<ApiCallResponse> call({
    int? idEmpresa,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetBotHorarios',
      apiUrl: '${baseUrl}/Bot?id_empresa=eq.${idEmpresa}&select=funcionamento',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? domingo(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['1'].ativo''',
      ));
  bool? segunda(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['2'].ativo''',
      ));
  bool? terca(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['3'].ativo''',
      ));
  bool? quarta(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['4'].ativo''',
      ));
  bool? quinta(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['5'].ativo''',
      ));
  bool? sexta(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['6'].ativo''',
      ));
  bool? sabado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].funcionamento.dias['7'].ativo''',
      ));
}

class GetRelatoriosCall {
  Future<ApiCallResponse> call({
    String? filtros = '',
    int? idEmpresa,
  }) async {
    final baseUrl = GetDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetRelatorios',
      apiUrl:
          '${baseUrl}/conversas_relatorio?${filtros}&ref_empresa=eq.${idEmpresa}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MTExMzQ3OSwiZXhwIjoyMDA2Njg5NDc5fQ.-GyuYGIJFORK6qO7URMRfERfDHT3tBbfaONwdMEUSms',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End GetData Group Code

class GetNomeFromConversaCall {
  static Future<ApiCallResponse> call({
    int? conversaId,
  }) async {
    final ffApiRequestBody = '''
{
  "conversa_id": "${conversaId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetNomeFromConversa',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc/get_nome_from_conversa',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetConversasWithContactNameCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetConversasWithContactName',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc/get_conversas_with_contact_names',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? nomeContato(dynamic response) => getJsonField(
        response,
        r'''$[:].nome_contato''',
        true,
      ) as List?;
  static List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? refMessage(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_message''',
        true,
      ) as List?;
  static List? refColabuser(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_colabuser''',
        true,
      ) as List?;
  static List? refContato(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_contatos''',
        true,
      ) as List?;
  static List? createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?;
  static List? authID(dynamic response) => getJsonField(
        response,
        r'''$[:].authid''',
        true,
      ) as List?;
  static List? atualizado(dynamic response) => getJsonField(
        response,
        r'''$[:].atualizado''',
        true,
      ) as List?;
}

class GetDataWithConversaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetDataWithConversa',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc/sossego_please',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  static List? refMessage(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_message''',
        true,
      ) as List?;
  static List? nomeContato(dynamic response) => getJsonField(
        response,
        r'''$[:].nome_contato''',
        true,
      ) as List?;
  static List? messageText(dynamic response) => getJsonField(
        response,
        r'''$[:].messages_text''',
        true,
      ) as List?;
  static List? refColabuser(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_colabuser''',
        true,
      ) as List?;
  static List? refContatos(dynamic response) => getJsonField(
        response,
        r'''$[:].ref_contatos''',
        true,
      ) as List?;
  static List? authid(dynamic response) => getJsonField(
        response,
        r'''$[:].authid''',
        true,
      ) as List?;
  static List? createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?;
  static List? atualizado(dynamic response) => getJsonField(
        response,
        r'''$[:].atualizado''',
        true,
      ) as List?;
}

class UploadFileAndInsertURLCall {
  static Future<ApiCallResponse> call({
    String? file = '',
    String? filename = '',
  }) async {
    final ffApiRequestBody = '''
{
  "file": "${file}",
  "filename": "${filename}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UploadFileAndInsertURL',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/rpc/upload_file_and_insert_url',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AutorizarLoginCall {
  static Future<ApiCallResponse> call({
    String? email = 'teste@teste.com',
    String? senha = '123456',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AutorizarLogin',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/auth/v1/token?grant_type=password\'',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailForPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailForPassword',
      apiUrl: 'https://fntyzzstyetnbvrpqfre.supabase.co/auth/v1/recover',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InserirUsuarioCall {
  static Future<ApiCallResponse> call({
    String? email = 'teste878@gmail.com',
    String? senha = '123456',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Inserir usuario',
      apiUrl: 'https://fntyzzstyetnbvrpqfre.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  static int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? erroCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class BotCallCall {
  static Future<ApiCallResponse> call({
    String? idApi = '66',
    int? refEmpresa = 1,
    int? idConversa = 435,
    String? msg = '345',
  }) async {
    final ffApiRequestBody = '''
{
  "idApi": "${idApi}",
  "refEmpresa": "${refEmpresa}",
  "idConversa": "${idConversa}",
  "msg": "${msg}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'botCall',
      apiUrl: 'https://fntyzzstyetnbvrpqfre.supabase.co/functions/v1/bot',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchColabByEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchColabByEmail',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/colab_user?email=eq.${email}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Range': '0-9',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? contaValidada(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].contaValidada''',
      ));
}

class SearchConexaobyIDCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchConexaobyID',
      apiUrl:
          'https://fntyzzstyetnbvrpqfre.supabase.co/rest/v1/conexoes?id=eq.${id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
        'Range': '0-9',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? qrcode64(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].qrcode''',
      ));
  static bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].Status''',
      ));
  static String? statusConexao(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].status_conexao''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
