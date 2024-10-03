import '../database.dart';

class EncerramentoAssuntoTable extends SupabaseTable<EncerramentoAssuntoRow> {
  @override
  String get tableName => 'Encerramento_Assunto';

  @override
  EncerramentoAssuntoRow createRow(Map<String, dynamic> data) =>
      EncerramentoAssuntoRow(data);
}

class EncerramentoAssuntoRow extends SupabaseDataRow {
  EncerramentoAssuntoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EncerramentoAssuntoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get assunto => getField<String>('assunto');
  set assunto(String? value) => setField<String>('assunto', value);

  int get refEmpresa => getField<int>('ref_empresa')!;
  set refEmpresa(int value) => setField<int>('ref_empresa', value);

  bool? get isdeletedAssunto => getField<bool>('isdeleted_assunto');
  set isdeletedAssunto(bool? value) =>
      setField<bool>('isdeleted_assunto', value);
}
