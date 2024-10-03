import '../database.dart';

class ConversasRelatorioTable extends SupabaseTable<ConversasRelatorioRow> {
  @override
  String get tableName => 'conversas_relatorio';

  @override
  ConversasRelatorioRow createRow(Map<String, dynamic> data) =>
      ConversasRelatorioRow(data);
}

class ConversasRelatorioRow extends SupabaseDataRow {
  ConversasRelatorioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversasRelatorioTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  String? get fotoContato => getField<String>('foto_contato');
  set fotoContato(String? value) => setField<String>('foto_contato', value);

  String? get nomeContato => getField<String>('nome_contato');
  set nomeContato(String? value) => setField<String>('nome_contato', value);

  String? get numeroContato => getField<String>('numero_contato');
  set numeroContato(String? value) => setField<String>('numero_contato', value);

  String? get setorNomenclatura => getField<String>('Setor_nomenclatura');
  set setorNomenclatura(String? value) =>
      setField<String>('Setor_nomenclatura', value);

  String? get conexaoNomenclatura => getField<String>('conexao_nomenclatura');
  set conexaoNomenclatura(String? value) =>
      setField<String>('conexao_nomenclatura', value);

  String? get colabuserNome => getField<String>('colabuser_nome');
  set colabuserNome(String? value) => setField<String>('colabuser_nome', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get horaFinalizada => getField<DateTime>('hora_finalizada');
  set horaFinalizada(DateTime? value) =>
      setField<DateTime>('hora_finalizada', value);

  String? get protocolo => getField<String>('Protocolo');
  set protocolo(String? value) => setField<String>('Protocolo', value);

  bool? get istransferida => getField<bool>('istransferida');
  set istransferida(bool? value) => setField<bool>('istransferida', value);
}
