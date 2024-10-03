import '../database.dart';

class TotalSetoresTable extends SupabaseTable<TotalSetoresRow> {
  @override
  String get tableName => 'total_setores';

  @override
  TotalSetoresRow createRow(Map<String, dynamic> data) => TotalSetoresRow(data);
}

class TotalSetoresRow extends SupabaseDataRow {
  TotalSetoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TotalSetoresTable();

  int? get idEmpresas => getField<int>('id_empresas');
  set idEmpresas(int? value) => setField<int>('id_empresas', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
