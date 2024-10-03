import '../database.dart';

class TotalConexoesTable extends SupabaseTable<TotalConexoesRow> {
  @override
  String get tableName => 'total_conexoes';

  @override
  TotalConexoesRow createRow(Map<String, dynamic> data) =>
      TotalConexoesRow(data);
}

class TotalConexoesRow extends SupabaseDataRow {
  TotalConexoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TotalConexoesTable();

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);

  int? get totalAtivos => getField<int>('total_ativos');
  set totalAtivos(int? value) => setField<int>('total_ativos', value);
}
