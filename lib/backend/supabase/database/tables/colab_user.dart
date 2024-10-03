import '../database.dart';

class ColabUserTable extends SupabaseTable<ColabUserRow> {
  @override
  String get tableName => 'colab_user';

  @override
  ColabUserRow createRow(Map<String, dynamic> data) => ColabUserRow(data);
}

class ColabUserRow extends SupabaseDataRow {
  ColabUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColabUserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profilePicture => getField<String>('profile_picture');
  set profilePicture(String? value) =>
      setField<String>('profile_picture', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get authId => getField<String>('auth_id');
  set authId(String? value) => setField<String>('auth_id', value);

  String? get dataNascimento => getField<String>('data_nascimento');
  set dataNascimento(String? value) =>
      setField<String>('data_nascimento', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get genero => getField<String>('genero');
  set genero(String? value) => setField<String>('genero', value);

  int? get setorId => getField<int>('setor_id');
  set setorId(int? value) => setField<int>('setor_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get cargo => getField<String>('Cargo');
  set cargo(String? value) => setField<String>('Cargo', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);

  bool? get online => getField<bool>('online');
  set online(bool? value) => setField<bool>('online', value);

  double? get numeroConversas => getField<double>('numero_conversas');
  set numeroConversas(double? value) =>
      setField<double>('numero_conversas', value);

  double? get numeroTranferencias => getField<double>('numero_tranferencias');
  set numeroTranferencias(double? value) =>
      setField<double>('numero_tranferencias', value);

  double? get numeroEspera => getField<double>('numero_espera');
  set numeroEspera(double? value) => setField<double>('numero_espera', value);

  int get idEmpresa => getField<int>('id_empresa')!;
  set idEmpresa(int value) => setField<int>('id_empresa', value);

  String? get keyColabuser => getField<String>('key_colabuser');
  set keyColabuser(String? value) => setField<String>('key_colabuser', value);

  String? get empresaNome => getField<String>('empresa_nome');
  set empresaNome(String? value) => setField<String>('empresa_nome', value);

  bool? get setorConexaoPropria => getField<bool>('setor_conexao_propria');
  set setorConexaoPropria(bool? value) =>
      setField<bool>('setor_conexao_propria', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  bool? get isdeletedColabuser => getField<bool>('isdeleted_colabuser');
  set isdeletedColabuser(bool? value) =>
      setField<bool>('isdeleted_colabuser', value);

  List<String> get setores => getListField<String>('setores');
  set setores(List<String>? value) => setListField<String>('setores', value);

  bool? get contaValidada => getField<bool>('contaValidada');
  set contaValidada(bool? value) => setField<bool>('contaValidada', value);

  List<String> get setoresNomes => getListField<String>('setores_nomes');
  set setoresNomes(List<String>? value) =>
      setListField<String>('setores_nomes', value);
}
