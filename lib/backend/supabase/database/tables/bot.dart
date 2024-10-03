import '../database.dart';

class BotTable extends SupabaseTable<BotRow> {
  @override
  String get tableName => 'Bot';

  @override
  BotRow createRow(Map<String, dynamic> data) => BotRow(data);
}

class BotRow extends SupabaseDataRow {
  BotRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BotTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get idEmpresa => getField<int>('id_empresa')!;
  set idEmpresa(int value) => setField<int>('id_empresa', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  String? get msgInicio => getField<String>('msg_inicio');
  set msgInicio(String? value) => setField<String>('msg_inicio', value);

  String? get msgFila => getField<String>('msg_fila');
  set msgFila(String? value) => setField<String>('msg_fila', value);

  String? get msgAssumir => getField<String>('msg_assumir');
  set msgAssumir(String? value) => setField<String>('msg_assumir', value);

  String? get msgFinalizar => getField<String>('msg_finalizar');
  set msgFinalizar(String? value) => setField<String>('msg_finalizar', value);

  int? get setorInatividade => getField<int>('setor_inatividade');
  set setorInatividade(int? value) => setField<int>('setor_inatividade', value);

  int? get setorHorarioFora => getField<int>('setor_horario_fora');
  set setorHorarioFora(int? value) =>
      setField<int>('setor_horario_fora', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  String? get msgBotFora => getField<String>('msg_botFora');
  set msgBotFora(String? value) => setField<String>('msg_botFora', value);

  int? get tempoTransferencia => getField<int>('tempo_transferencia');
  set tempoTransferencia(int? value) =>
      setField<int>('tempo_transferencia', value);

  String? get keyConexao => getField<String>('key_conexão');
  set keyConexao(String? value) => setField<String>('key_conexão', value);

  dynamic get funcionamento => getField<dynamic>('funcionamento')!;
  set funcionamento(dynamic value) => setField<dynamic>('funcionamento', value);

  List<dynamic> get setoresEscolhidos =>
      getListField<dynamic>('setoresEscolhidos');
  set setoresEscolhidos(List<dynamic>? value) =>
      setListField<dynamic>('setoresEscolhidos', value);

  int? get setorTransferidoAutomaticamente =>
      getField<int>('setor_transferido_automaticamente');
  set setorTransferidoAutomaticamente(int? value) =>
      setField<int>('setor_transferido_automaticamente', value);

  bool? get horariosCostumizados => getField<bool>('horarios_costumizados');
  set horariosCostumizados(bool? value) =>
      setField<bool>('horarios_costumizados', value);

  int? get tempoRetorno => getField<int>('tempo_retorno');
  set tempoRetorno(int? value) => setField<int>('tempo_retorno', value);
}
