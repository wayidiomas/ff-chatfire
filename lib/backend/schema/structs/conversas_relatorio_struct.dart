// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversasRelatorioStruct extends BaseStruct {
  ConversasRelatorioStruct({
    int? id,
    int? refEmpresa,
    String? status,
    String? nomeContato,
    String? numeroContato,
    String? setorNomenclatura,
    String? conexaoNomenclatura,
    String? colabuserNome,
    DateTime? createdAt,
    DateTime? horaFinalizada,
    String? protocolo,
    bool? istransferida,
    String? fotoContato,
  })  : _id = id,
        _refEmpresa = refEmpresa,
        _status = status,
        _nomeContato = nomeContato,
        _numeroContato = numeroContato,
        _setorNomenclatura = setorNomenclatura,
        _conexaoNomenclatura = conexaoNomenclatura,
        _colabuserNome = colabuserNome,
        _createdAt = createdAt,
        _horaFinalizada = horaFinalizada,
        _protocolo = protocolo,
        _istransferida = istransferida,
        _fotoContato = fotoContato;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "ref_empresa" field.
  int? _refEmpresa;
  int get refEmpresa => _refEmpresa ?? 0;
  set refEmpresa(int? val) => _refEmpresa = val;

  void incrementRefEmpresa(int amount) => refEmpresa = refEmpresa + amount;

  bool hasRefEmpresa() => _refEmpresa != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "nome_contato" field.
  String? _nomeContato;
  String get nomeContato => _nomeContato ?? '';
  set nomeContato(String? val) => _nomeContato = val;

  bool hasNomeContato() => _nomeContato != null;

  // "numero_contato" field.
  String? _numeroContato;
  String get numeroContato => _numeroContato ?? '';
  set numeroContato(String? val) => _numeroContato = val;

  bool hasNumeroContato() => _numeroContato != null;

  // "Setor_nomenclatura" field.
  String? _setorNomenclatura;
  String get setorNomenclatura => _setorNomenclatura ?? '';
  set setorNomenclatura(String? val) => _setorNomenclatura = val;

  bool hasSetorNomenclatura() => _setorNomenclatura != null;

  // "conexao_nomenclatura" field.
  String? _conexaoNomenclatura;
  String get conexaoNomenclatura => _conexaoNomenclatura ?? '';
  set conexaoNomenclatura(String? val) => _conexaoNomenclatura = val;

  bool hasConexaoNomenclatura() => _conexaoNomenclatura != null;

  // "colabuser_nome" field.
  String? _colabuserNome;
  String get colabuserNome => _colabuserNome ?? '';
  set colabuserNome(String? val) => _colabuserNome = val;

  bool hasColabuserNome() => _colabuserNome != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "hora_finalizada" field.
  DateTime? _horaFinalizada;
  DateTime? get horaFinalizada => _horaFinalizada;
  set horaFinalizada(DateTime? val) => _horaFinalizada = val;

  bool hasHoraFinalizada() => _horaFinalizada != null;

  // "Protocolo" field.
  String? _protocolo;
  String get protocolo => _protocolo ?? '';
  set protocolo(String? val) => _protocolo = val;

  bool hasProtocolo() => _protocolo != null;

  // "istransferida" field.
  bool? _istransferida;
  bool get istransferida => _istransferida ?? false;
  set istransferida(bool? val) => _istransferida = val;

  bool hasIstransferida() => _istransferida != null;

  // "foto_contato" field.
  String? _fotoContato;
  String get fotoContato => _fotoContato ?? '';
  set fotoContato(String? val) => _fotoContato = val;

  bool hasFotoContato() => _fotoContato != null;

  static ConversasRelatorioStruct fromMap(Map<String, dynamic> data) =>
      ConversasRelatorioStruct(
        id: castToType<int>(data['id']),
        refEmpresa: castToType<int>(data['ref_empresa']),
        status: data['Status'] as String?,
        nomeContato: data['nome_contato'] as String?,
        numeroContato: data['numero_contato'] as String?,
        setorNomenclatura: data['Setor_nomenclatura'] as String?,
        conexaoNomenclatura: data['conexao_nomenclatura'] as String?,
        colabuserNome: data['colabuser_nome'] as String?,
        createdAt: data['created_at'] as DateTime?,
        horaFinalizada: data['hora_finalizada'] as DateTime?,
        protocolo: data['Protocolo'] as String?,
        istransferida: data['istransferida'] as bool?,
        fotoContato: data['foto_contato'] as String?,
      );

  static ConversasRelatorioStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversasRelatorioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'ref_empresa': _refEmpresa,
        'Status': _status,
        'nome_contato': _nomeContato,
        'numero_contato': _numeroContato,
        'Setor_nomenclatura': _setorNomenclatura,
        'conexao_nomenclatura': _conexaoNomenclatura,
        'colabuser_nome': _colabuserNome,
        'created_at': _createdAt,
        'hora_finalizada': _horaFinalizada,
        'Protocolo': _protocolo,
        'istransferida': _istransferida,
        'foto_contato': _fotoContato,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'ref_empresa': serializeParam(
          _refEmpresa,
          ParamType.int,
        ),
        'Status': serializeParam(
          _status,
          ParamType.String,
        ),
        'nome_contato': serializeParam(
          _nomeContato,
          ParamType.String,
        ),
        'numero_contato': serializeParam(
          _numeroContato,
          ParamType.String,
        ),
        'Setor_nomenclatura': serializeParam(
          _setorNomenclatura,
          ParamType.String,
        ),
        'conexao_nomenclatura': serializeParam(
          _conexaoNomenclatura,
          ParamType.String,
        ),
        'colabuser_nome': serializeParam(
          _colabuserNome,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'hora_finalizada': serializeParam(
          _horaFinalizada,
          ParamType.DateTime,
        ),
        'Protocolo': serializeParam(
          _protocolo,
          ParamType.String,
        ),
        'istransferida': serializeParam(
          _istransferida,
          ParamType.bool,
        ),
        'foto_contato': serializeParam(
          _fotoContato,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversasRelatorioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConversasRelatorioStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        refEmpresa: deserializeParam(
          data['ref_empresa'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['Status'],
          ParamType.String,
          false,
        ),
        nomeContato: deserializeParam(
          data['nome_contato'],
          ParamType.String,
          false,
        ),
        numeroContato: deserializeParam(
          data['numero_contato'],
          ParamType.String,
          false,
        ),
        setorNomenclatura: deserializeParam(
          data['Setor_nomenclatura'],
          ParamType.String,
          false,
        ),
        conexaoNomenclatura: deserializeParam(
          data['conexao_nomenclatura'],
          ParamType.String,
          false,
        ),
        colabuserNome: deserializeParam(
          data['colabuser_nome'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        horaFinalizada: deserializeParam(
          data['hora_finalizada'],
          ParamType.DateTime,
          false,
        ),
        protocolo: deserializeParam(
          data['Protocolo'],
          ParamType.String,
          false,
        ),
        istransferida: deserializeParam(
          data['istransferida'],
          ParamType.bool,
          false,
        ),
        fotoContato: deserializeParam(
          data['foto_contato'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversasRelatorioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversasRelatorioStruct &&
        id == other.id &&
        refEmpresa == other.refEmpresa &&
        status == other.status &&
        nomeContato == other.nomeContato &&
        numeroContato == other.numeroContato &&
        setorNomenclatura == other.setorNomenclatura &&
        conexaoNomenclatura == other.conexaoNomenclatura &&
        colabuserNome == other.colabuserNome &&
        createdAt == other.createdAt &&
        horaFinalizada == other.horaFinalizada &&
        protocolo == other.protocolo &&
        istransferida == other.istransferida &&
        fotoContato == other.fotoContato;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        refEmpresa,
        status,
        nomeContato,
        numeroContato,
        setorNomenclatura,
        conexaoNomenclatura,
        colabuserNome,
        createdAt,
        horaFinalizada,
        protocolo,
        istransferida,
        fotoContato
      ]);
}

ConversasRelatorioStruct createConversasRelatorioStruct({
  int? id,
  int? refEmpresa,
  String? status,
  String? nomeContato,
  String? numeroContato,
  String? setorNomenclatura,
  String? conexaoNomenclatura,
  String? colabuserNome,
  DateTime? createdAt,
  DateTime? horaFinalizada,
  String? protocolo,
  bool? istransferida,
  String? fotoContato,
}) =>
    ConversasRelatorioStruct(
      id: id,
      refEmpresa: refEmpresa,
      status: status,
      nomeContato: nomeContato,
      numeroContato: numeroContato,
      setorNomenclatura: setorNomenclatura,
      conexaoNomenclatura: conexaoNomenclatura,
      colabuserNome: colabuserNome,
      createdAt: createdAt,
      horaFinalizada: horaFinalizada,
      protocolo: protocolo,
      istransferida: istransferida,
      fotoContato: fotoContato,
    );
