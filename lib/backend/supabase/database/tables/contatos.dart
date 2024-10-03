import '../database.dart';

class ContatosTable extends SupabaseTable<ContatosRow> {
  @override
  String get tableName => 'contatos';

  @override
  ContatosRow createRow(Map<String, dynamic> data) => ContatosRow(data);
}

class ContatosRow extends SupabaseDataRow {
  ContatosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContatosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get authid => getField<String>('authid');
  set authid(String? value) => setField<String>('authid', value);

  String? get instagram => getField<String>('instagram');
  set instagram(String? value) => setField<String>('instagram', value);

  String? get profissao => getField<String>('profissão');
  set profissao(String? value) => setField<String>('profissão', value);

  int? get refConversa => getField<int>('ref_conversa');
  set refConversa(int? value) => setField<int>('ref_conversa', value);

  bool? get conversaAtiva => getField<bool>('conversa_ativa');
  set conversaAtiva(bool? value) => setField<bool>('conversa_ativa', value);

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  String? get statusConversa => getField<String>('status_conversa');
  set statusConversa(String? value) =>
      setField<String>('status_conversa', value);

  bool? get isdeletedContatos => getField<bool>('isdeleted_contatos');
  set isdeletedContatos(bool? value) =>
      setField<bool>('isdeleted_contatos', value);

  String? get numeroRelatorios => getField<String>('numero_relatorios');
  set numeroRelatorios(String? value) =>
      setField<String>('numero_relatorios', value);

  bool? get isconexao => getField<bool>('isconexao');
  set isconexao(bool? value) => setField<bool>('isconexao', value);
}
