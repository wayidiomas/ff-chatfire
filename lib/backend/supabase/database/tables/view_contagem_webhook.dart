import '../database.dart';

class ViewContagemWebhookTable extends SupabaseTable<ViewContagemWebhookRow> {
  @override
  String get tableName => 'view_contagem_webhook';

  @override
  ViewContagemWebhookRow createRow(Map<String, dynamic> data) =>
      ViewContagemWebhookRow(data);
}

class ViewContagemWebhookRow extends SupabaseDataRow {
  ViewContagemWebhookRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewContagemWebhookTable();

  String? get idContatoConversas => getField<String>('id_contato_conversas');
  set idContatoConversas(String? value) =>
      setField<String>('id_contato_conversas', value);

  int? get contagemNaoLidos => getField<int>('contagem_nao_lidos');
  set contagemNaoLidos(int? value) =>
      setField<int>('contagem_nao_lidos', value);
}
