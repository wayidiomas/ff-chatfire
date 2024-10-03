import '../database.dart';

class ViewChatconversasEsperaTable
    extends SupabaseTable<ViewChatconversasEsperaRow> {
  @override
  String get tableName => 'view_chatconversas_espera';

  @override
  ViewChatconversasEsperaRow createRow(Map<String, dynamic> data) =>
      ViewChatconversasEsperaRow(data);
}

class ViewChatconversasEsperaRow extends SupabaseDataRow {
  ViewChatconversasEsperaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewChatconversasEsperaTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get idSetor => getField<int>('id_setor');
  set idSetor(int? value) => setField<int>('id_setor', value);

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  String? get fotoContato => getField<String>('foto_contato');
  set fotoContato(String? value) => setField<String>('foto_contato', value);

  String? get nomeContato => getField<String>('nome_contato');
  set nomeContato(String? value) => setField<String>('nome_contato', value);

  String? get ultimaMensagem => getField<String>('ultima_mensagem');
  set ultimaMensagem(String? value) =>
      setField<String>('ultima_mensagem', value);

  DateTime? get horarioUltimaMensagem =>
      getField<DateTime>('horario_ultima_mensagem');
  set horarioUltimaMensagem(DateTime? value) =>
      setField<DateTime>('horario_ultima_mensagem', value);

  bool? get atualizado => getField<bool>('atualizado');
  set atualizado(bool? value) => setField<bool>('atualizado', value);

  String? get fotoColabUser => getField<String>('foto_colabUser');
  set fotoColabUser(String? value) => setField<String>('foto_colabUser', value);

  String? get keyInstancia => getField<String>('key_instancia');
  set keyInstancia(String? value) => setField<String>('key_instancia', value);

  String? get idApi => getField<String>('id_api');
  set idApi(String? value) => setField<String>('id_api', value);

  bool? get isespera => getField<bool>('isespera');
  set isespera(bool? value) => setField<bool>('isespera', value);

  bool? get istransferida => getField<bool>('istransferida');
  set istransferida(bool? value) => setField<bool>('istransferida', value);

  bool? get isforahorario => getField<bool>('isforahorario');
  set isforahorario(bool? value) => setField<bool>('isforahorario', value);
}
