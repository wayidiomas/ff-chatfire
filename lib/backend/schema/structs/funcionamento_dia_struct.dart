// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FuncionamentoDiaStruct extends BaseStruct {
  FuncionamentoDiaStruct({
    String? dia,
    String? inicio,
    String? fim,
    bool? ativo,
  })  : _dia = dia,
        _inicio = inicio,
        _fim = fim,
        _ativo = ativo;

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  set dia(String? val) => _dia = val;

  bool hasDia() => _dia != null;

  // "inicio" field.
  String? _inicio;
  String get inicio => _inicio ?? '';
  set inicio(String? val) => _inicio = val;

  bool hasInicio() => _inicio != null;

  // "fim" field.
  String? _fim;
  String get fim => _fim ?? '';
  set fim(String? val) => _fim = val;

  bool hasFim() => _fim != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  set ativo(bool? val) => _ativo = val;

  bool hasAtivo() => _ativo != null;

  static FuncionamentoDiaStruct fromMap(Map<String, dynamic> data) =>
      FuncionamentoDiaStruct(
        dia: data['dia'] as String?,
        inicio: data['inicio'] as String?,
        fim: data['fim'] as String?,
        ativo: data['ativo'] as bool?,
      );

  static FuncionamentoDiaStruct? maybeFromMap(dynamic data) => data is Map
      ? FuncionamentoDiaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dia': _dia,
        'inicio': _inicio,
        'fim': _fim,
        'ativo': _ativo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dia': serializeParam(
          _dia,
          ParamType.String,
        ),
        'inicio': serializeParam(
          _inicio,
          ParamType.String,
        ),
        'fim': serializeParam(
          _fim,
          ParamType.String,
        ),
        'ativo': serializeParam(
          _ativo,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FuncionamentoDiaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FuncionamentoDiaStruct(
        dia: deserializeParam(
          data['dia'],
          ParamType.String,
          false,
        ),
        inicio: deserializeParam(
          data['inicio'],
          ParamType.String,
          false,
        ),
        fim: deserializeParam(
          data['fim'],
          ParamType.String,
          false,
        ),
        ativo: deserializeParam(
          data['ativo'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FuncionamentoDiaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FuncionamentoDiaStruct &&
        dia == other.dia &&
        inicio == other.inicio &&
        fim == other.fim &&
        ativo == other.ativo;
  }

  @override
  int get hashCode => const ListEquality().hash([dia, inicio, fim, ativo]);
}

FuncionamentoDiaStruct createFuncionamentoDiaStruct({
  String? dia,
  String? inicio,
  String? fim,
  bool? ativo,
}) =>
    FuncionamentoDiaStruct(
      dia: dia,
      inicio: inicio,
      fim: fim,
      ativo: ativo,
    );
