import '../database.dart';

class DailyConversationsComparisonTable
    extends SupabaseTable<DailyConversationsComparisonRow> {
  @override
  String get tableName => 'daily_conversations_comparison';

  @override
  DailyConversationsComparisonRow createRow(Map<String, dynamic> data) =>
      DailyConversationsComparisonRow(data);
}

class DailyConversationsComparisonRow extends SupabaseDataRow {
  DailyConversationsComparisonRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyConversationsComparisonTable();

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  String? get empresaNome => getField<String>('empresa_nome');
  set empresaNome(String? value) => setField<String>('empresa_nome', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  int? get conversasHoje => getField<int>('conversas_hoje');
  set conversasHoje(int? value) => setField<int>('conversas_hoje', value);

  int? get conversasOntem => getField<int>('conversas_ontem');
  set conversasOntem(int? value) => setField<int>('conversas_ontem', value);

  double? get percentualMudanca => getField<double>('percentual_mudanca');
  set percentualMudanca(double? value) =>
      setField<double>('percentual_mudanca', value);
}
