import '../database.dart';

class EsperaStatusStatsTable extends SupabaseTable<EsperaStatusStatsRow> {
  @override
  String get tableName => 'espera_status_stats';

  @override
  EsperaStatusStatsRow createRow(Map<String, dynamic> data) =>
      EsperaStatusStatsRow(data);
}

class EsperaStatusStatsRow extends SupabaseDataRow {
  EsperaStatusStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EsperaStatusStatsTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get totalEsperaConversas => getField<int>('total_espera_conversas');
  set totalEsperaConversas(int? value) =>
      setField<int>('total_espera_conversas', value);

  double? get avgDurationMinutes => getField<double>('avg_duration_minutes');
  set avgDurationMinutes(double? value) =>
      setField<double>('avg_duration_minutes', value);
}
