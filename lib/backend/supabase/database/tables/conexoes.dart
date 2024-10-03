import '../database.dart';

class ConexoesTable extends SupabaseTable<ConexoesRow> {
  @override
  String get tableName => 'conexoes';

  @override
  ConexoesRow createRow(Map<String, dynamic> data) => ConexoesRow(data);
}

class ConexoesRow extends SupabaseDataRow {
  ConexoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConexoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get numero => getField<String>('Número');
  set numero(String? value) => setField<String>('Número', value);

  String? get empresa => getField<String>('Empresa');
  set empresa(String? value) => setField<String>('Empresa', value);

  String? get plataforma => getField<String>('Plataforma');
  set plataforma(String? value) => setField<String>('Plataforma', value);

  bool? get status => getField<bool>('Status');
  set status(bool? value) => setField<bool>('Status', value);

  int? get setorPrincipal => getField<int>(' Setor_Principal');
  set setorPrincipal(int? value) => setField<int>(' Setor_Principal', value);

  bool? get conexaoPrincipal => getField<bool>('Conexão_Principal');
  set conexaoPrincipal(bool? value) =>
      setField<bool>('Conexão_Principal', value);

  String? get instanceKey => getField<String>('instance_key');
  set instanceKey(String? value) => setField<String>('instance_key', value);

  int get idEmpresa => getField<int>('id_empresa')!;
  set idEmpresa(int value) => setField<int>('id_empresa', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  String? get qrcode => getField<String>('qrcode');
  set qrcode(String? value) => setField<String>('qrcode', value);

  String? get statusConexao => getField<String>('status_conexao');
  set statusConexao(String? value) => setField<String>('status_conexao', value);

  bool? get isConexaoRetorno => getField<bool>('isConexaoRetorno');
  set isConexaoRetorno(bool? value) =>
      setField<bool>('isConexaoRetorno', value);

  int? get idContatoRetorno => getField<int>('id_contato_retorno');
  set idContatoRetorno(int? value) =>
      setField<int>('id_contato_retorno', value);

  String? get mensagemRetorno => getField<String>('mensagemRetorno');
  set mensagemRetorno(String? value) =>
      setField<String>('mensagemRetorno', value);
}
