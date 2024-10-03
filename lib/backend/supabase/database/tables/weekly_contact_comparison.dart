import '../database.dart';

class WeeklyContactComparisonTable
    extends SupabaseTable<WeeklyContactComparisonRow> {
  @override
  String get tableName => 'weekly_contact_comparison';

  @override
  WeeklyContactComparisonRow createRow(Map<String, dynamic> data) =>
      WeeklyContactComparisonRow(data);
}

class WeeklyContactComparisonRow extends SupabaseDataRow {
  WeeklyContactComparisonRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WeeklyContactComparisonTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get currentWeekCount => getField<int>('current_week_count');
  set currentWeekCount(int? value) =>
      setField<int>('current_week_count', value);

  int? get previousWeekCount => getField<int>('previous_week_count');
  set previousWeekCount(int? value) =>
      setField<int>('previous_week_count', value);

  double? get percentageChange => getField<double>('percentage_change');
  set percentageChange(double? value) =>
      setField<double>('percentage_change', value);
}
