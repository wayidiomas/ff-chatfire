// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetoresStruct extends BaseStruct {
  SetoresStruct({
    int? setorId,
    String? nomeSetor,
    String? keyConexao,
    bool? ativoBot,
    String? colabId,
    String? nomeColabUser,
  })  : _setorId = setorId,
        _nomeSetor = nomeSetor,
        _keyConexao = keyConexao,
        _ativoBot = ativoBot,
        _colabId = colabId,
        _nomeColabUser = nomeColabUser;

  // "setor_id" field.
  int? _setorId;
  int get setorId => _setorId ?? 0;
  set setorId(int? val) => _setorId = val;

  void incrementSetorId(int amount) => setorId = setorId + amount;

  bool hasSetorId() => _setorId != null;

  // "nome_setor" field.
  String? _nomeSetor;
  String get nomeSetor => _nomeSetor ?? '';
  set nomeSetor(String? val) => _nomeSetor = val;

  bool hasNomeSetor() => _nomeSetor != null;

  // "key_conexao" field.
  String? _keyConexao;
  String get keyConexao => _keyConexao ?? '';
  set keyConexao(String? val) => _keyConexao = val;

  bool hasKeyConexao() => _keyConexao != null;

  // "ativo_bot" field.
  bool? _ativoBot;
  bool get ativoBot => _ativoBot ?? false;
  set ativoBot(bool? val) => _ativoBot = val;

  bool hasAtivoBot() => _ativoBot != null;

  // "colab_id" field.
  String? _colabId;
  String get colabId => _colabId ?? '';
  set colabId(String? val) => _colabId = val;

  bool hasColabId() => _colabId != null;

  // "nome_colabUser" field.
  String? _nomeColabUser;
  String get nomeColabUser => _nomeColabUser ?? '';
  set nomeColabUser(String? val) => _nomeColabUser = val;

  bool hasNomeColabUser() => _nomeColabUser != null;

  static SetoresStruct fromMap(Map<String, dynamic> data) => SetoresStruct(
        setorId: castToType<int>(data['setor_id']),
        nomeSetor: data['nome_setor'] as String?,
        keyConexao: data['key_conexao'] as String?,
        ativoBot: data['ativo_bot'] as bool?,
        colabId: data['colab_id'] as String?,
        nomeColabUser: data['nome_colabUser'] as String?,
      );

  static SetoresStruct? maybeFromMap(dynamic data) =>
      data is Map ? SetoresStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'setor_id': _setorId,
        'nome_setor': _nomeSetor,
        'key_conexao': _keyConexao,
        'ativo_bot': _ativoBot,
        'colab_id': _colabId,
        'nome_colabUser': _nomeColabUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'setor_id': serializeParam(
          _setorId,
          ParamType.int,
        ),
        'nome_setor': serializeParam(
          _nomeSetor,
          ParamType.String,
        ),
        'key_conexao': serializeParam(
          _keyConexao,
          ParamType.String,
        ),
        'ativo_bot': serializeParam(
          _ativoBot,
          ParamType.bool,
        ),
        'colab_id': serializeParam(
          _colabId,
          ParamType.String,
        ),
        'nome_colabUser': serializeParam(
          _nomeColabUser,
          ParamType.String,
        ),
      }.withoutNulls;

  static SetoresStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetoresStruct(
        setorId: deserializeParam(
          data['setor_id'],
          ParamType.int,
          false,
        ),
        nomeSetor: deserializeParam(
          data['nome_setor'],
          ParamType.String,
          false,
        ),
        keyConexao: deserializeParam(
          data['key_conexao'],
          ParamType.String,
          false,
        ),
        ativoBot: deserializeParam(
          data['ativo_bot'],
          ParamType.bool,
          false,
        ),
        colabId: deserializeParam(
          data['colab_id'],
          ParamType.String,
          false,
        ),
        nomeColabUser: deserializeParam(
          data['nome_colabUser'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SetoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SetoresStruct &&
        setorId == other.setorId &&
        nomeSetor == other.nomeSetor &&
        keyConexao == other.keyConexao &&
        ativoBot == other.ativoBot &&
        colabId == other.colabId &&
        nomeColabUser == other.nomeColabUser;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([setorId, nomeSetor, keyConexao, ativoBot, colabId, nomeColabUser]);
}

SetoresStruct createSetoresStruct({
  int? setorId,
  String? nomeSetor,
  String? keyConexao,
  bool? ativoBot,
  String? colabId,
  String? nomeColabUser,
}) =>
    SetoresStruct(
      setorId: setorId,
      nomeSetor: nomeSetor,
      keyConexao: keyConexao,
      ativoBot: ativoBot,
      colabId: colabId,
      nomeColabUser: nomeColabUser,
    );
