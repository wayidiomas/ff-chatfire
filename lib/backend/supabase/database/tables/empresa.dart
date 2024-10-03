import '../database.dart';

class EmpresaTable extends SupabaseTable<EmpresaRow> {
  @override
  String get tableName => 'Empresa';

  @override
  EmpresaRow createRow(Map<String, dynamic> data) => EmpresaRow(data);
}

class EmpresaRow extends SupabaseDataRow {
  EmpresaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmpresaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get key => getField<String>('key');
  set key(String? value) => setField<String>('key', value);

  String? get cpf => getField<String>('CPF');
  set cpf(String? value) => setField<String>('CPF', value);

  String? get cnpj => getField<String>('CNPJ');
  set cnpj(String? value) => setField<String>('CNPJ', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get enderecoRua => getField<String>('endereco_rua');
  set enderecoRua(String? value) => setField<String>('endereco_rua', value);

  String? get enderecoNumero => getField<String>('endereco_numero');
  set enderecoNumero(String? value) =>
      setField<String>('endereco_numero', value);

  String? get enderecoBairro => getField<String>('endereco_bairro');
  set enderecoBairro(String? value) =>
      setField<String>('endereco_bairro', value);

  String? get enderecoCidade => getField<String>('endereco_cidade');
  set enderecoCidade(String? value) =>
      setField<String>('endereco_cidade', value);

  String? get userMaster => getField<String>('user_master');
  set userMaster(String? value) => setField<String>('user_master', value);

  String? get cepEndereco => getField<String>('cep_endereco');
  set cepEndereco(String? value) => setField<String>('cep_endereco', value);

  bool? get assuntoObrigatorio => getField<bool>('assunto_obrigatorio');
  set assuntoObrigatorio(bool? value) =>
      setField<bool>('assunto_obrigatorio', value);
}
