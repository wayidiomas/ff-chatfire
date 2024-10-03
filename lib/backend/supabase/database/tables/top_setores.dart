import '../database.dart';

class TopSetoresTable extends SupabaseTable<TopSetoresRow> {
  @override
  String get tableName => 'top_setores';

  @override
  TopSetoresRow createRow(Map<String, dynamic> data) => TopSetoresRow(data);
}

class TopSetoresRow extends SupabaseDataRow {
  TopSetoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TopSetoresTable();

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  int? get idSetor => getField<int>('id_setor');
  set idSetor(int? value) => setField<int>('id_setor', value);

  String? get nomeSetor => getField<String>('nome_setor');
  set nomeSetor(String? value) => setField<String>('nome_setor', value);

  int? get numeroConversas => getField<int>('numero_conversas');
  set numeroConversas(int? value) => setField<int>('numero_conversas', value);

  int? get numeroWebhooks => getField<int>('numero_webhooks');
  set numeroWebhooks(int? value) => setField<int>('numero_webhooks', value);
}
