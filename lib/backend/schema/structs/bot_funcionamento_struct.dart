// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotFuncionamentoStruct extends BaseStruct {
  BotFuncionamentoStruct({
    FuncionamentoDiaStruct? segunda,
    FuncionamentoDiaStruct? terca,
    FuncionamentoDiaStruct? quarta,
    FuncionamentoDiaStruct? quinta,
    FuncionamentoDiaStruct? sexta,
    FuncionamentoDiaStruct? sabado,
    FuncionamentoDiaStruct? domingo,
  })  : _segunda = segunda,
        _terca = terca,
        _quarta = quarta,
        _quinta = quinta,
        _sexta = sexta,
        _sabado = sabado,
        _domingo = domingo;

  // "segunda" field.
  FuncionamentoDiaStruct? _segunda;
  FuncionamentoDiaStruct get segunda => _segunda ?? FuncionamentoDiaStruct();
  set segunda(FuncionamentoDiaStruct? val) => _segunda = val;

  void updateSegunda(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_segunda ??= FuncionamentoDiaStruct());
  }

  bool hasSegunda() => _segunda != null;

  // "terca" field.
  FuncionamentoDiaStruct? _terca;
  FuncionamentoDiaStruct get terca => _terca ?? FuncionamentoDiaStruct();
  set terca(FuncionamentoDiaStruct? val) => _terca = val;

  void updateTerca(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_terca ??= FuncionamentoDiaStruct());
  }

  bool hasTerca() => _terca != null;

  // "quarta" field.
  FuncionamentoDiaStruct? _quarta;
  FuncionamentoDiaStruct get quarta => _quarta ?? FuncionamentoDiaStruct();
  set quarta(FuncionamentoDiaStruct? val) => _quarta = val;

  void updateQuarta(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_quarta ??= FuncionamentoDiaStruct());
  }

  bool hasQuarta() => _quarta != null;

  // "quinta" field.
  FuncionamentoDiaStruct? _quinta;
  FuncionamentoDiaStruct get quinta => _quinta ?? FuncionamentoDiaStruct();
  set quinta(FuncionamentoDiaStruct? val) => _quinta = val;

  void updateQuinta(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_quinta ??= FuncionamentoDiaStruct());
  }

  bool hasQuinta() => _quinta != null;

  // "sexta" field.
  FuncionamentoDiaStruct? _sexta;
  FuncionamentoDiaStruct get sexta => _sexta ?? FuncionamentoDiaStruct();
  set sexta(FuncionamentoDiaStruct? val) => _sexta = val;

  void updateSexta(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_sexta ??= FuncionamentoDiaStruct());
  }

  bool hasSexta() => _sexta != null;

  // "sabado" field.
  FuncionamentoDiaStruct? _sabado;
  FuncionamentoDiaStruct get sabado => _sabado ?? FuncionamentoDiaStruct();
  set sabado(FuncionamentoDiaStruct? val) => _sabado = val;

  void updateSabado(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_sabado ??= FuncionamentoDiaStruct());
  }

  bool hasSabado() => _sabado != null;

  // "domingo" field.
  FuncionamentoDiaStruct? _domingo;
  FuncionamentoDiaStruct get domingo => _domingo ?? FuncionamentoDiaStruct();
  set domingo(FuncionamentoDiaStruct? val) => _domingo = val;

  void updateDomingo(Function(FuncionamentoDiaStruct) updateFn) {
    updateFn(_domingo ??= FuncionamentoDiaStruct());
  }

  bool hasDomingo() => _domingo != null;

  static BotFuncionamentoStruct fromMap(Map<String, dynamic> data) =>
      BotFuncionamentoStruct(
        segunda: FuncionamentoDiaStruct.maybeFromMap(data['segunda']),
        terca: FuncionamentoDiaStruct.maybeFromMap(data['terca']),
        quarta: FuncionamentoDiaStruct.maybeFromMap(data['quarta']),
        quinta: FuncionamentoDiaStruct.maybeFromMap(data['quinta']),
        sexta: FuncionamentoDiaStruct.maybeFromMap(data['sexta']),
        sabado: FuncionamentoDiaStruct.maybeFromMap(data['sabado']),
        domingo: FuncionamentoDiaStruct.maybeFromMap(data['domingo']),
      );

  static BotFuncionamentoStruct? maybeFromMap(dynamic data) => data is Map
      ? BotFuncionamentoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'segunda': _segunda?.toMap(),
        'terca': _terca?.toMap(),
        'quarta': _quarta?.toMap(),
        'quinta': _quinta?.toMap(),
        'sexta': _sexta?.toMap(),
        'sabado': _sabado?.toMap(),
        'domingo': _domingo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'segunda': serializeParam(
          _segunda,
          ParamType.DataStruct,
        ),
        'terca': serializeParam(
          _terca,
          ParamType.DataStruct,
        ),
        'quarta': serializeParam(
          _quarta,
          ParamType.DataStruct,
        ),
        'quinta': serializeParam(
          _quinta,
          ParamType.DataStruct,
        ),
        'sexta': serializeParam(
          _sexta,
          ParamType.DataStruct,
        ),
        'sabado': serializeParam(
          _sabado,
          ParamType.DataStruct,
        ),
        'domingo': serializeParam(
          _domingo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static BotFuncionamentoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BotFuncionamentoStruct(
        segunda: deserializeStructParam(
          data['segunda'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        terca: deserializeStructParam(
          data['terca'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        quarta: deserializeStructParam(
          data['quarta'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        quinta: deserializeStructParam(
          data['quinta'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        sexta: deserializeStructParam(
          data['sexta'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        sabado: deserializeStructParam(
          data['sabado'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
        domingo: deserializeStructParam(
          data['domingo'],
          ParamType.DataStruct,
          false,
          structBuilder: FuncionamentoDiaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BotFuncionamentoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BotFuncionamentoStruct &&
        segunda == other.segunda &&
        terca == other.terca &&
        quarta == other.quarta &&
        quinta == other.quinta &&
        sexta == other.sexta &&
        sabado == other.sabado &&
        domingo == other.domingo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([segunda, terca, quarta, quinta, sexta, sabado, domingo]);
}

BotFuncionamentoStruct createBotFuncionamentoStruct({
  FuncionamentoDiaStruct? segunda,
  FuncionamentoDiaStruct? terca,
  FuncionamentoDiaStruct? quarta,
  FuncionamentoDiaStruct? quinta,
  FuncionamentoDiaStruct? sexta,
  FuncionamentoDiaStruct? sabado,
  FuncionamentoDiaStruct? domingo,
}) =>
    BotFuncionamentoStruct(
      segunda: segunda ?? FuncionamentoDiaStruct(),
      terca: terca ?? FuncionamentoDiaStruct(),
      quarta: quarta ?? FuncionamentoDiaStruct(),
      quinta: quinta ?? FuncionamentoDiaStruct(),
      sexta: sexta ?? FuncionamentoDiaStruct(),
      sabado: sabado ?? FuncionamentoDiaStruct(),
      domingo: domingo ?? FuncionamentoDiaStruct(),
    );
