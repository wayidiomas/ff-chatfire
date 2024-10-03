import '../database.dart';

class ViewConversasFiltradasTable
    extends SupabaseTable<ViewConversasFiltradasRow> {
  @override
  String get tableName => 'view_conversas_filtradas';

  @override
  ViewConversasFiltradasRow createRow(Map<String, dynamic> data) =>
      ViewConversasFiltradasRow(data);
}

class ViewConversasFiltradasRow extends SupabaseDataRow {
  ViewConversasFiltradasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewConversasFiltradasTable();

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);
}
