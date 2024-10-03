import '../database.dart';

class SetorConexaoTable extends SupabaseTable<SetorConexaoRow> {
  @override
  String get tableName => 'setor_conexao';

  @override
  SetorConexaoRow createRow(Map<String, dynamic> data) => SetorConexaoRow(data);
}

class SetorConexaoRow extends SupabaseDataRow {
  SetorConexaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetorConexaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idSetor => getField<int>('id_setor');
  set idSetor(int? value) => setField<int>('id_setor', value);

  int? get idConexao => getField<int>('id_conexao');
  set idConexao(int? value) => setField<int>('id_conexao', value);

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  String? get keyConexao => getField<String>('keyConexao');
  set keyConexao(String? value) => setField<String>('keyConexao', value);

  String? get nomeConexao => getField<String>('nome_conexao');
  set nomeConexao(String? value) => setField<String>('nome_conexao', value);

  String? get nomeSetor => getField<String>('nome_setor');
  set nomeSetor(String? value) => setField<String>('nome_setor', value);
}
