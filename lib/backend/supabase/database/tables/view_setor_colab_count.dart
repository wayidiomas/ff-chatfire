import '../database.dart';

class ViewSetorColabCountTable extends SupabaseTable<ViewSetorColabCountRow> {
  @override
  String get tableName => 'view_setor_colab_count';

  @override
  ViewSetorColabCountRow createRow(Map<String, dynamic> data) =>
      ViewSetorColabCountRow(data);
}

class ViewSetorColabCountRow extends SupabaseDataRow {
  ViewSetorColabCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewSetorColabCountTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  int? get numColabUsers => getField<int>('num_colab_users');
  set numColabUsers(int? value) => setField<int>('num_colab_users', value);
}
