// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotSetoresStruct extends BaseStruct {
  BotSetoresStruct({
    int? setor,
    int? ordem,
    bool? ativo,
    String? nome,
  })  : _setor = setor,
        _ordem = ordem,
        _ativo = ativo,
        _nome = nome;

  // "setor" field.
  int? _setor;
  int get setor => _setor ?? 0;
  set setor(int? val) => _setor = val;

  void incrementSetor(int amount) => setor = setor + amount;

  bool hasSetor() => _setor != null;

  // "ordem" field.
  int? _ordem;
  int get ordem => _ordem ?? 0;
  set ordem(int? val) => _ordem = val;

  void incrementOrdem(int amount) => ordem = ordem + amount;

  bool hasOrdem() => _ordem != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  set ativo(bool? val) => _ativo = val;

  bool hasAtivo() => _ativo != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  static BotSetoresStruct fromMap(Map<String, dynamic> data) =>
      BotSetoresStruct(
        setor: castToType<int>(data['setor']),
        ordem: castToType<int>(data['ordem']),
        ativo: data['ativo'] as bool?,
        nome: data['nome'] as String?,
      );

  static BotSetoresStruct? maybeFromMap(dynamic data) => data is Map
      ? BotSetoresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'setor': _setor,
        'ordem': _ordem,
        'ativo': _ativo,
        'nome': _nome,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'setor': serializeParam(
          _setor,
          ParamType.int,
        ),
        'ordem': serializeParam(
          _ordem,
          ParamType.int,
        ),
        'ativo': serializeParam(
          _ativo,
          ParamType.bool,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
      }.withoutNulls;

  static BotSetoresStruct fromSerializableMap(Map<String, dynamic> data) =>
      BotSetoresStruct(
        setor: deserializeParam(
          data['setor'],
          ParamType.int,
          false,
        ),
        ordem: deserializeParam(
          data['ordem'],
          ParamType.int,
          false,
        ),
        ativo: deserializeParam(
          data['ativo'],
          ParamType.bool,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BotSetoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BotSetoresStruct &&
        setor == other.setor &&
        ordem == other.ordem &&
        ativo == other.ativo &&
        nome == other.nome;
  }

  @override
  int get hashCode => const ListEquality().hash([setor, ordem, ativo, nome]);
}

BotSetoresStruct createBotSetoresStruct({
  int? setor,
  int? ordem,
  bool? ativo,
  String? nome,
}) =>
    BotSetoresStruct(
      setor: setor,
      ordem: ordem,
      ativo: ativo,
      nome: nome,
    );
