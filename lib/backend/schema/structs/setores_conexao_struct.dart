// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetoresConexaoStruct extends BaseStruct {
  SetoresConexaoStruct({
    int? id,
    int? idSetor,
    int? idConexao,
    int? idEmpresa,
    String? keyConexao,
    String? nomeConexao,
    String? nomeSetor,
  })  : _id = id,
        _idSetor = idSetor,
        _idConexao = idConexao,
        _idEmpresa = idEmpresa,
        _keyConexao = keyConexao,
        _nomeConexao = nomeConexao,
        _nomeSetor = nomeSetor;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "id_setor" field.
  int? _idSetor;
  int get idSetor => _idSetor ?? 0;
  set idSetor(int? val) => _idSetor = val;

  void incrementIdSetor(int amount) => idSetor = idSetor + amount;

  bool hasIdSetor() => _idSetor != null;

  // "id_conexao" field.
  int? _idConexao;
  int get idConexao => _idConexao ?? 0;
  set idConexao(int? val) => _idConexao = val;

  void incrementIdConexao(int amount) => idConexao = idConexao + amount;

  bool hasIdConexao() => _idConexao != null;

  // "id_empresa" field.
  int? _idEmpresa;
  int get idEmpresa => _idEmpresa ?? 0;
  set idEmpresa(int? val) => _idEmpresa = val;

  void incrementIdEmpresa(int amount) => idEmpresa = idEmpresa + amount;

  bool hasIdEmpresa() => _idEmpresa != null;

  // "keyConexao" field.
  String? _keyConexao;
  String get keyConexao => _keyConexao ?? '';
  set keyConexao(String? val) => _keyConexao = val;

  bool hasKeyConexao() => _keyConexao != null;

  // "nome_conexao" field.
  String? _nomeConexao;
  String get nomeConexao => _nomeConexao ?? '';
  set nomeConexao(String? val) => _nomeConexao = val;

  bool hasNomeConexao() => _nomeConexao != null;

  // "nome_setor" field.
  String? _nomeSetor;
  String get nomeSetor => _nomeSetor ?? '';
  set nomeSetor(String? val) => _nomeSetor = val;

  bool hasNomeSetor() => _nomeSetor != null;

  static SetoresConexaoStruct fromMap(Map<String, dynamic> data) =>
      SetoresConexaoStruct(
        id: castToType<int>(data['id']),
        idSetor: castToType<int>(data['id_setor']),
        idConexao: castToType<int>(data['id_conexao']),
        idEmpresa: castToType<int>(data['id_empresa']),
        keyConexao: data['keyConexao'] as String?,
        nomeConexao: data['nome_conexao'] as String?,
        nomeSetor: data['nome_setor'] as String?,
      );

  static SetoresConexaoStruct? maybeFromMap(dynamic data) => data is Map
      ? SetoresConexaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'id_setor': _idSetor,
        'id_conexao': _idConexao,
        'id_empresa': _idEmpresa,
        'keyConexao': _keyConexao,
        'nome_conexao': _nomeConexao,
        'nome_setor': _nomeSetor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'id_setor': serializeParam(
          _idSetor,
          ParamType.int,
        ),
        'id_conexao': serializeParam(
          _idConexao,
          ParamType.int,
        ),
        'id_empresa': serializeParam(
          _idEmpresa,
          ParamType.int,
        ),
        'keyConexao': serializeParam(
          _keyConexao,
          ParamType.String,
        ),
        'nome_conexao': serializeParam(
          _nomeConexao,
          ParamType.String,
        ),
        'nome_setor': serializeParam(
          _nomeSetor,
          ParamType.String,
        ),
      }.withoutNulls;

  static SetoresConexaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetoresConexaoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        idSetor: deserializeParam(
          data['id_setor'],
          ParamType.int,
          false,
        ),
        idConexao: deserializeParam(
          data['id_conexao'],
          ParamType.int,
          false,
        ),
        idEmpresa: deserializeParam(
          data['id_empresa'],
          ParamType.int,
          false,
        ),
        keyConexao: deserializeParam(
          data['keyConexao'],
          ParamType.String,
          false,
        ),
        nomeConexao: deserializeParam(
          data['nome_conexao'],
          ParamType.String,
          false,
        ),
        nomeSetor: deserializeParam(
          data['nome_setor'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SetoresConexaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SetoresConexaoStruct &&
        id == other.id &&
        idSetor == other.idSetor &&
        idConexao == other.idConexao &&
        idEmpresa == other.idEmpresa &&
        keyConexao == other.keyConexao &&
        nomeConexao == other.nomeConexao &&
        nomeSetor == other.nomeSetor;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, idSetor, idConexao, idEmpresa, keyConexao, nomeConexao, nomeSetor]);
}

SetoresConexaoStruct createSetoresConexaoStruct({
  int? id,
  int? idSetor,
  int? idConexao,
  int? idEmpresa,
  String? keyConexao,
  String? nomeConexao,
  String? nomeSetor,
}) =>
    SetoresConexaoStruct(
      id: id,
      idSetor: idSetor,
      idConexao: idConexao,
      idEmpresa: idEmpresa,
      keyConexao: keyConexao,
      nomeConexao: nomeConexao,
      nomeSetor: nomeSetor,
    );
