import '../database.dart';

class DailyConversationsComparison1Table
    extends SupabaseTable<DailyConversationsComparison1Row> {
  @override
  String get tableName => 'daily_conversations_comparison1';

  @override
  DailyConversationsComparison1Row createRow(Map<String, dynamic> data) =>
      DailyConversationsComparison1Row(data);
}

class DailyConversationsComparison1Row extends SupabaseDataRow {
  DailyConversationsComparison1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyConversationsComparison1Table();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get todayCount => getField<int>('today_count');
  set todayCount(int? value) => setField<int>('today_count', value);

  int? get yesterdayCount => getField<int>('yesterday_count');
  set yesterdayCount(int? value) => setField<int>('yesterday_count', value);

  double? get percentageChange => getField<double>('percentage_change');
  set percentageChange(double? value) =>
      setField<double>('percentage_change', value);
}
