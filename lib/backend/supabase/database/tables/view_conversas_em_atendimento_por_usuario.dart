import '../database.dart';

class ViewConversasEmAtendimentoPorUsuarioTable
    extends SupabaseTable<ViewConversasEmAtendimentoPorUsuarioRow> {
  @override
  String get tableName => 'view_conversas_em_atendimento_por_usuario';

  @override
  ViewConversasEmAtendimentoPorUsuarioRow createRow(
          Map<String, dynamic> data) =>
      ViewConversasEmAtendimentoPorUsuarioRow(data);
}

class ViewConversasEmAtendimentoPorUsuarioRow extends SupabaseDataRow {
  ViewConversasEmAtendimentoPorUsuarioRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => ViewConversasEmAtendimentoPorUsuarioTable();

  int? get colabUserId => getField<int>('colab_user_id');
  set colabUserId(int? value) => setField<int>('colab_user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get authId => getField<String>('auth_id');
  set authId(String? value) => setField<String>('auth_id', value);

  int? get numeroDeConversasEmAtendimento =>
      getField<int>('numero_de_conversas_em_atendimento');
  set numeroDeConversasEmAtendimento(int? value) =>
      setField<int>('numero_de_conversas_em_atendimento', value);
}
