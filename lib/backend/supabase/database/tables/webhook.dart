import '../database.dart';

class WebhookTable extends SupabaseTable<WebhookRow> {
  @override
  String get tableName => 'webhook';

  @override
  WebhookRow createRow(Map<String, dynamic> data) => WebhookRow(data);
}

class WebhookRow extends SupabaseDataRow {
  WebhookRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WebhookTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  dynamic? get dataField => getField<dynamic>('data');
  set dataField(dynamic? value) => setField<dynamic>('data', value);

  String? get contatos => getField<String>('contatos');
  set contatos(String? value) => setField<String>('contatos', value);

  bool? get fromMe => getField<bool>('fromMe');
  set fromMe(bool? value) => setField<bool>('fromMe', value);

  String? get mensagem => getField<String>('mensagem');
  set mensagem(String? value) => setField<String>('mensagem', value);

  String? get audio => getField<String>('áudio');
  set audio(String? value) => setField<String>('áudio', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  String? get legendaImagem => getField<String>('legenda imagem');
  set legendaImagem(String? value) => setField<String>('legenda imagem', value);

  String? get file => getField<String>('file');
  set file(String? value) => setField<String>('file', value);

  String? get legendaFile => getField<String>('legenda file');
  set legendaFile(String? value) => setField<String>('legenda file', value);

  int? get idGrupo => getField<int>('id_grupo');
  set idGrupo(int? value) => setField<int>('id_grupo', value);

  bool? get deletada => getField<bool>('deletada');
  set deletada(bool? value) => setField<bool>('deletada', value);

  bool? get chatfire => getField<bool>('chatfire');
  set chatfire(bool? value) => setField<bool>('chatfire', value);

  bool? get lida => getField<bool>('Lida');
  set lida(bool? value) => setField<bool>('Lida', value);

  String? get idApiConversa => getField<String>('id_api_conversa');
  set idApiConversa(String? value) =>
      setField<String>('id_api_conversa', value);

  bool get isEdgeFunctionInsert => getField<bool>('is_edge_function_insert')!;
  set isEdgeFunctionInsert(bool value) =>
      setField<bool>('is_edge_function_insert', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  int? get idContatoWebhook => getField<int>('id_contato_webhook');
  set idContatoWebhook(int? value) =>
      setField<int>('id_contato_webhook', value);

  int? get replyWebhook => getField<int>('replyWebhook');
  set replyWebhook(int? value) => setField<int>('replyWebhook', value);

  String? get idMensagem => getField<String>('idMensagem');
  set idMensagem(String? value) => setField<String>('idMensagem', value);

  String? get instanceKey => getField<String>('instance_key');
  set instanceKey(String? value) => setField<String>('instance_key', value);
}
