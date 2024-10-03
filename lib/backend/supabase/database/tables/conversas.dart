import '../database.dart';

class ConversasTable extends SupabaseTable<ConversasRow> {
  @override
  String get tableName => 'conversas';

  @override
  ConversasRow createRow(Map<String, dynamic> data) => ConversasRow(data);
}

class ConversasRow extends SupabaseDataRow {
  ConversasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get refContatos => getField<int>('ref_contatos');
  set refContatos(int? value) => setField<int>('ref_contatos', value);

  String? get authid => getField<String>('authid');
  set authid(String? value) => setField<String>('authid', value);

  bool? get atualizado => getField<bool>('atualizado');
  set atualizado(bool? value) => setField<bool>('atualizado', value);

  String? get nomeContato => getField<String>('nome_contato');
  set nomeContato(String? value) => setField<String>('nome_contato', value);

  String? get fotoContato => getField<String>('foto_contato');
  set fotoContato(String? value) => setField<String>('foto_contato', value);

  bool? get arquivada => getField<bool>('arquivada');
  set arquivada(bool? value) => setField<bool>('arquivada', value);

  String? get ultimaMensagem => getField<String>('ultima_mensagem');
  set ultimaMensagem(String? value) =>
      setField<String>('ultima_mensagem', value);

  DateTime? get horarioUltimaMensagem =>
      getField<DateTime>('horario_ultima_mensagem');
  set horarioUltimaMensagem(DateTime? value) =>
      setField<DateTime>('horario_ultima_mensagem', value);

  String? get protocolo => getField<String>('Protocolo');
  set protocolo(String? value) => setField<String>('Protocolo', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  String? get numeroContato => getField<String>('numero_contato');
  set numeroContato(String? value) => setField<String>('numero_contato', value);

  String? get setorNomenclatura => getField<String>('Setor_nomenclatura');
  set setorNomenclatura(String? value) =>
      setField<String>('Setor_nomenclatura', value);

  String? get colabuserNome => getField<String>('colabuser_nome');
  set colabuserNome(String? value) => setField<String>('colabuser_nome', value);

  DateTime? get horaFinalizada => getField<DateTime>('hora_finalizada');
  set horaFinalizada(DateTime? value) =>
      setField<DateTime>('hora_finalizada', value);

  int? get refEmpresa => getField<int>('ref_empresa');
  set refEmpresa(int? value) => setField<int>('ref_empresa', value);

  String? get empresaNome => getField<String>('empresa_nome');
  set empresaNome(String? value) => setField<String>('empresa_nome', value);

  String? get encerramentoAssunto => getField<String>('Encerramento_assunto');
  set encerramentoAssunto(String? value) =>
      setField<String>('Encerramento_assunto', value);

  String? get encerramentoTag => getField<String>('Encerramento_tag');
  set encerramentoTag(String? value) =>
      setField<String>('Encerramento_tag', value);

  String? get relatoConversa => getField<String>('Relato_conversa');
  set relatoConversa(String? value) =>
      setField<String>('Relato_conversa', value);

  String? get observacaoTransferencia =>
      getField<String>('observacao_transferencia');
  set observacaoTransferencia(String? value) =>
      setField<String>('observacao_transferencia', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get webhookIdUltima => getField<int>('webhook_id_ultima');
  set webhookIdUltima(int? value) => setField<int>('webhook_id_ultima', value);

  int? get idSetor => getField<int>('id_setor');
  set idSetor(int? value) => setField<int>('id_setor', value);

  String? get keyInstancia => getField<String>('key_instancia');
  set keyInstancia(String? value) => setField<String>('key_instancia', value);

  String? get idApi => getField<String>('id_api');
  set idApi(String? value) => setField<String>('id_api', value);

  int? get transferidaSetor => getField<int>('transferida_setor');
  set transferidaSetor(int? value) => setField<int>('transferida_setor', value);

  String? get transferidaUser => getField<String>('transferida_user');
  set transferidaUser(String? value) =>
      setField<String>('transferida_user', value);

  String? get fotoColabUser => getField<String>('foto_colabUser');
  set fotoColabUser(String? value) => setField<String>('foto_colabUser', value);

  String? get transferidaNomeUser => getField<String>('transferida_nome_user');
  set transferidaNomeUser(String? value) =>
      setField<String>('transferida_nome_user', value);

  String? get transferidaNomeSetor =>
      getField<String>('transferida_nome_setor');
  set transferidaNomeSetor(String? value) =>
      setField<String>('transferida_nome_setor', value);

  bool? get isdeletedConversas => getField<bool>('isdeleted_conversas');
  set isdeletedConversas(bool? value) =>
      setField<bool>('isdeleted_conversas', value);

  bool? get istransferida => getField<bool>('istransferida');
  set istransferida(bool? value) => setField<bool>('istransferida', value);

  bool? get isforahorario => getField<bool>('isforahorario');
  set isforahorario(bool? value) => setField<bool>('isforahorario', value);

  bool? get isespera => getField<bool>('isespera');
  set isespera(bool? value) => setField<bool>('isespera', value);

  bool? get fixa => getField<bool>('fixa');
  set fixa(bool? value) => setField<bool>('fixa', value);

  String? get conexaoNomenclatura => getField<String>('conexao_nomenclatura');
  set conexaoNomenclatura(String? value) =>
      setField<String>('conexao_nomenclatura', value);
}
