import '../database.dart';

class ContatosResumoTable extends SupabaseTable<ContatosResumoRow> {
  @override
  String get tableName => 'contatos_resumo';

  @override
  ContatosResumoRow createRow(Map<String, dynamic> data) =>
      ContatosResumoRow(data);
}

class ContatosResumoRow extends SupabaseDataRow {
  ContatosResumoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContatosResumoTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get totalRegistros => getField<int>('total_registros');
  set totalRegistros(int? value) => setField<int>('total_registros', value);

  int? get novosRegistrosMensais => getField<int>('novos_registros_mensais');
  set novosRegistrosMensais(int? value) =>
      setField<int>('novos_registros_mensais', value);
}
