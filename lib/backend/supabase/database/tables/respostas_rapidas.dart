import '../database.dart';

class RespostasRapidasTable extends SupabaseTable<RespostasRapidasRow> {
  @override
  String get tableName => 'Respostas_Rapidas';

  @override
  RespostasRapidasRow createRow(Map<String, dynamic> data) =>
      RespostasRapidasRow(data);
}

class RespostasRapidasRow extends SupabaseDataRow {
  RespostasRapidasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RespostasRapidasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get texto => getField<String>('Texto');
  set texto(String? value) => setField<String>('Texto', value);

  String? get atalho => getField<String>('Atalho');
  set atalho(String? value) => setField<String>('Atalho', value);

  String? get setor => getField<String>('Setor');
  set setor(String? value) => setField<String>('Setor', value);

  int get idEmpresa => getField<int>('id_empresa')!;
  set idEmpresa(int value) => setField<int>('id_empresa', value);

  int? get idSetor => getField<int>('id_setor');
  set idSetor(int? value) => setField<int>('id_setor', value);

  bool? get isdeletedResposta => getField<bool>('isdeleted_resposta');
  set isdeletedResposta(bool? value) =>
      setField<bool>('isdeleted_resposta', value);
}
