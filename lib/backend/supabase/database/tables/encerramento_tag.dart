import '../database.dart';

class EncerramentoTagTable extends SupabaseTable<EncerramentoTagRow> {
  @override
  String get tableName => 'Encerramento_Tag';

  @override
  EncerramentoTagRow createRow(Map<String, dynamic> data) =>
      EncerramentoTagRow(data);
}

class EncerramentoTagRow extends SupabaseDataRow {
  EncerramentoTagRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EncerramentoTagTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tag => getField<String>('Tag');
  set tag(String? value) => setField<String>('Tag', value);

  int get refEmpresa => getField<int>('ref_empresa')!;
  set refEmpresa(int value) => setField<int>('ref_empresa', value);

  bool? get isdeletedTag => getField<bool>('isdeleted_tag');
  set isdeletedTag(bool? value) => setField<bool>('isdeleted_tag', value);
}
