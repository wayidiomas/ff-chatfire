// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConexoesStruct extends BaseStruct {
  ConexoesStruct({
    int? id,
    String? nome,
    String? instanceKey,
  })  : _id = id,
        _nome = nome,
        _instanceKey = instanceKey;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "instance_key" field.
  String? _instanceKey;
  String get instanceKey => _instanceKey ?? '';
  set instanceKey(String? val) => _instanceKey = val;

  bool hasInstanceKey() => _instanceKey != null;

  static ConexoesStruct fromMap(Map<String, dynamic> data) => ConexoesStruct(
        id: castToType<int>(data['id']),
        nome: data['Nome'] as String?,
        instanceKey: data['instance_key'] as String?,
      );

  static ConexoesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConexoesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'Nome': _nome,
        'instance_key': _instanceKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'instance_key': serializeParam(
          _instanceKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConexoesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConexoesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        instanceKey: deserializeParam(
          data['instance_key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConexoesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConexoesStruct &&
        id == other.id &&
        nome == other.nome &&
        instanceKey == other.instanceKey;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nome, instanceKey]);
}

ConexoesStruct createConexoesStruct({
  int? id,
  String? nome,
  String? instanceKey,
}) =>
    ConexoesStruct(
      id: id,
      nome: nome,
      instanceKey: instanceKey,
    );
