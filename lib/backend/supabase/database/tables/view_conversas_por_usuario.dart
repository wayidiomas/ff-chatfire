import '../database.dart';

class ViewConversasPorUsuarioTable
    extends SupabaseTable<ViewConversasPorUsuarioRow> {
  @override
  String get tableName => 'view_conversas_por_usuario';

  @override
  ViewConversasPorUsuarioRow createRow(Map<String, dynamic> data) =>
      ViewConversasPorUsuarioRow(data);
}

class ViewConversasPorUsuarioRow extends SupabaseDataRow {
  ViewConversasPorUsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewConversasPorUsuarioTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get ultimaMensagem => getField<String>('ultima_mensagem');
  set ultimaMensagem(String? value) =>
      setField<String>('ultima_mensagem', value);

  bool? get fixa => getField<bool>('fixa');
  set fixa(bool? value) => setField<bool>('fixa', value);

  DateTime? get horarioUltimaMensagem =>
      getField<DateTime>('horario_ultima_mensagem');
  set horarioUltimaMensagem(DateTime? value) =>
      setField<DateTime>('horario_ultima_mensagem', value);

  bool? get atualizado => getField<bool>('atualizado');
  set atualizado(bool? value) => setField<bool>('atualizado', value);

  String? get nomeContato => getField<String>('nome_contato');
  set nomeContato(String? value) => setField<String>('nome_contato', value);

  String? get idApi => getField<String>('id_api');
  set idApi(String? value) => setField<String>('id_api', value);

  String? get fotoContato => getField<String>('foto_contato');
  set fotoContato(String? value) => setField<String>('foto_contato', value);

  String? get authid => getField<String>('authid');
  set authid(String? value) => setField<String>('authid', value);

  String? get fotoColabUser => getField<String>('foto_colabUser');
  set fotoColabUser(String? value) => setField<String>('foto_colabUser', value);

  String? get keyInstancia => getField<String>('key_instancia');
  set keyInstancia(String? value) => setField<String>('key_instancia', value);
}
