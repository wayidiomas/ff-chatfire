import '../database.dart';

class ViewConversasPorEmpresaTable
    extends SupabaseTable<ViewConversasPorEmpresaRow> {
  @override
  String get tableName => 'view_conversas_por_empresa';

  @override
  ViewConversasPorEmpresaRow createRow(Map<String, dynamic> data) =>
      ViewConversasPorEmpresaRow(data);
}

class ViewConversasPorEmpresaRow extends SupabaseDataRow {
  ViewConversasPorEmpresaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewConversasPorEmpresaTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get numeroDeConversas => getField<int>('numero_de_conversas');
  set numeroDeConversas(int? value) =>
      setField<int>('numero_de_conversas', value);
}
