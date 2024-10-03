import '../database.dart';

class ViewConversasEsperaPorUsuarioTable
    extends SupabaseTable<ViewConversasEsperaPorUsuarioRow> {
  @override
  String get tableName => 'view_conversas_espera_por_usuario';

  @override
  ViewConversasEsperaPorUsuarioRow createRow(Map<String, dynamic> data) =>
      ViewConversasEsperaPorUsuarioRow(data);
}

class ViewConversasEsperaPorUsuarioRow extends SupabaseDataRow {
  ViewConversasEsperaPorUsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewConversasEsperaPorUsuarioTable();

  String? get usuarioAuthId => getField<String>('usuario_auth_id');
  set usuarioAuthId(String? value) =>
      setField<String>('usuario_auth_id', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  int? get numeroDeConversasEmEspera =>
      getField<int>('numero_de_conversas_em_espera');
  set numeroDeConversasEmEspera(int? value) =>
      setField<int>('numero_de_conversas_em_espera', value);
}
