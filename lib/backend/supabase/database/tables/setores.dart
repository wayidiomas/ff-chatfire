import '../database.dart';

class SetoresTable extends SupabaseTable<SetoresRow> {
  @override
  String get tableName => 'Setores';

  @override
  SetoresRow createRow(Map<String, dynamic> data) => SetoresRow(data);
}

class SetoresRow extends SupabaseDataRow {
  SetoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get responsavelNome => getField<String>('responsavel_nome');
  set responsavelNome(String? value) =>
      setField<String>('responsavel_nome', value);

  double? get numeroConversas => getField<double>('numero_conversas');
  set numeroConversas(double? value) =>
      setField<double>('numero_conversas', value);

  double? get numeroTransferencias => getField<double>('numero_transferencias');
  set numeroTransferencias(double? value) =>
      setField<double>('numero_transferencias', value);

  double? get numeroEspera => getField<double>('numero_espera');
  set numeroEspera(double? value) => setField<double>('numero_espera', value);

  int get idEmpresas => getField<int>('id_empresas')!;
  set idEmpresas(int value) => setField<int>('id_empresas', value);

  int? get idResponsavel => getField<int>('id_responsavel');
  set idResponsavel(int? value) => setField<int>('id_responsavel', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);

  int? get idConexao => getField<int>('id_conexao');
  set idConexao(int? value) => setField<int>('id_conexao', value);

  String? get keyConexao => getField<String>('key_conexao');
  set keyConexao(String? value) => setField<String>('key_conexao', value);

  bool? get ativoBot => getField<bool>('ativo_bot');
  set ativoBot(bool? value) => setField<bool>('ativo_bot', value);

  bool? get isdeletedSetor => getField<bool>('isdeleted_setor');
  set isdeletedSetor(bool? value) => setField<bool>('isdeleted_setor', value);
}
