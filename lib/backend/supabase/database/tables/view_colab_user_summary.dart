import '../database.dart';

class ViewColabUserSummaryTable extends SupabaseTable<ViewColabUserSummaryRow> {
  @override
  String get tableName => 'view_colab_user_summary';

  @override
  ViewColabUserSummaryRow createRow(Map<String, dynamic> data) =>
      ViewColabUserSummaryRow(data);
}

class ViewColabUserSummaryRow extends SupabaseDataRow {
  ViewColabUserSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewColabUserSummaryTable();

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  int? get totalRegistros => getField<int>('total_registros');
  set totalRegistros(int? value) => setField<int>('total_registros', value);

  int? get totalOnline => getField<int>('total_online');
  set totalOnline(int? value) => setField<int>('total_online', value);

  int? get totalOffline => getField<int>('total_offline');
  set totalOffline(int? value) => setField<int>('total_offline', value);

  int? get totalAdministrador => getField<int>('total_administrador');
  set totalAdministrador(int? value) =>
      setField<int>('total_administrador', value);

  int? get totalOperadorOffline => getField<int>('total_operador_offline');
  set totalOperadorOffline(int? value) =>
      setField<int>('total_operador_offline', value);

  int? get totalOperadorOnline => getField<int>('total_operador_online');
  set totalOperadorOnline(int? value) =>
      setField<int>('total_operador_online', value);

  int? get totalOperador => getField<int>('total_operador');
  set totalOperador(int? value) => setField<int>('total_operador', value);

  int? get totalAtivo => getField<int>('total_ativo');
  set totalAtivo(int? value) => setField<int>('total_ativo', value);

  int? get totalInativo => getField<int>('total_inativo');
  set totalInativo(int? value) => setField<int>('total_inativo', value);
}
