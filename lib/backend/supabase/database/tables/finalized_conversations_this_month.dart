import '../database.dart';

class FinalizedConversationsThisMonthTable
    extends SupabaseTable<FinalizedConversationsThisMonthRow> {
  @override
  String get tableName => 'finalized_conversations_this_month';

  @override
  FinalizedConversationsThisMonthRow createRow(Map<String, dynamic> data) =>
      FinalizedConversationsThisMonthRow(data);
}

class FinalizedConversationsThisMonthRow extends SupabaseDataRow {
  FinalizedConversationsThisMonthRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FinalizedConversationsThisMonthTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  int? get currentMonthCount => getField<int>('current_month_count');
  set currentMonthCount(int? value) =>
      setField<int>('current_month_count', value);

  int? get previousMonthCount => getField<int>('previous_month_count');
  set previousMonthCount(int? value) =>
      setField<int>('previous_month_count', value);

  double? get percentageChange => getField<double>('percentage_change');
  set percentageChange(double? value) =>
      setField<double>('percentage_change', value);
}
