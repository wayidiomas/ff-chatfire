import '../database.dart';

class SetoresUsersTable extends SupabaseTable<SetoresUsersRow> {
  @override
  String get tableName => 'setores_users';

  @override
  SetoresUsersRow createRow(Map<String, dynamic> data) => SetoresUsersRow(data);
}

class SetoresUsersRow extends SupabaseDataRow {
  SetoresUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetoresUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get setorId => getField<int>('setor_id');
  set setorId(int? value) => setField<int>('setor_id', value);

  String? get colabId => getField<String>('colab_id');
  set colabId(String? value) => setField<String>('colab_id', value);

  int? get idEmpresa => getField<int>('id_empresa');
  set idEmpresa(int? value) => setField<int>('id_empresa', value);

  String? get nomeColabUser => getField<String>('nome_colabUser');
  set nomeColabUser(String? value) => setField<String>('nome_colabUser', value);
}
