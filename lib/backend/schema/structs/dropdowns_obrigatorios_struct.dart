// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropdownsObrigatoriosStruct extends BaseStruct {
  DropdownsObrigatoriosStruct({
    bool? horariosSetorBot,
    bool? usuarioPerfil,
    bool? usuarioSetor,
    bool? usuarioGenero,
    bool? setorForaAtendimento,
    bool? setorResponsavel,
    bool? encerramentoTag,
    bool? encerramentoAssunto,
    bool? setoresColabEdit,
    bool? contatoConexaoRetorno,
  })  : _horariosSetorBot = horariosSetorBot,
        _usuarioPerfil = usuarioPerfil,
        _usuarioSetor = usuarioSetor,
        _usuarioGenero = usuarioGenero,
        _setorForaAtendimento = setorForaAtendimento,
        _setorResponsavel = setorResponsavel,
        _encerramentoTag = encerramentoTag,
        _encerramentoAssunto = encerramentoAssunto,
        _setoresColabEdit = setoresColabEdit,
        _contatoConexaoRetorno = contatoConexaoRetorno;

  // "horariosSetorBot" field.
  bool? _horariosSetorBot;
  bool get horariosSetorBot => _horariosSetorBot ?? false;
  set horariosSetorBot(bool? val) => _horariosSetorBot = val;

  bool hasHorariosSetorBot() => _horariosSetorBot != null;

  // "usuarioPerfil" field.
  bool? _usuarioPerfil;
  bool get usuarioPerfil => _usuarioPerfil ?? false;
  set usuarioPerfil(bool? val) => _usuarioPerfil = val;

  bool hasUsuarioPerfil() => _usuarioPerfil != null;

  // "usuarioSetor" field.
  bool? _usuarioSetor;
  bool get usuarioSetor => _usuarioSetor ?? false;
  set usuarioSetor(bool? val) => _usuarioSetor = val;

  bool hasUsuarioSetor() => _usuarioSetor != null;

  // "usuarioGenero" field.
  bool? _usuarioGenero;
  bool get usuarioGenero => _usuarioGenero ?? false;
  set usuarioGenero(bool? val) => _usuarioGenero = val;

  bool hasUsuarioGenero() => _usuarioGenero != null;

  // "setorForaAtendimento" field.
  bool? _setorForaAtendimento;
  bool get setorForaAtendimento => _setorForaAtendimento ?? false;
  set setorForaAtendimento(bool? val) => _setorForaAtendimento = val;

  bool hasSetorForaAtendimento() => _setorForaAtendimento != null;

  // "setorResponsavel" field.
  bool? _setorResponsavel;
  bool get setorResponsavel => _setorResponsavel ?? false;
  set setorResponsavel(bool? val) => _setorResponsavel = val;

  bool hasSetorResponsavel() => _setorResponsavel != null;

  // "Encerramento_tag" field.
  bool? _encerramentoTag;
  bool get encerramentoTag => _encerramentoTag ?? false;
  set encerramentoTag(bool? val) => _encerramentoTag = val;

  bool hasEncerramentoTag() => _encerramentoTag != null;

  // "Encerramento_assunto" field.
  bool? _encerramentoAssunto;
  bool get encerramentoAssunto => _encerramentoAssunto ?? false;
  set encerramentoAssunto(bool? val) => _encerramentoAssunto = val;

  bool hasEncerramentoAssunto() => _encerramentoAssunto != null;

  // "Setores_colabEdit" field.
  bool? _setoresColabEdit;
  bool get setoresColabEdit => _setoresColabEdit ?? false;
  set setoresColabEdit(bool? val) => _setoresColabEdit = val;

  bool hasSetoresColabEdit() => _setoresColabEdit != null;

  // "contato_conexao_retorno" field.
  bool? _contatoConexaoRetorno;
  bool get contatoConexaoRetorno => _contatoConexaoRetorno ?? false;
  set contatoConexaoRetorno(bool? val) => _contatoConexaoRetorno = val;

  bool hasContatoConexaoRetorno() => _contatoConexaoRetorno != null;

  static DropdownsObrigatoriosStruct fromMap(Map<String, dynamic> data) =>
      DropdownsObrigatoriosStruct(
        horariosSetorBot: data['horariosSetorBot'] as bool?,
        usuarioPerfil: data['usuarioPerfil'] as bool?,
        usuarioSetor: data['usuarioSetor'] as bool?,
        usuarioGenero: data['usuarioGenero'] as bool?,
        setorForaAtendimento: data['setorForaAtendimento'] as bool?,
        setorResponsavel: data['setorResponsavel'] as bool?,
        encerramentoTag: data['Encerramento_tag'] as bool?,
        encerramentoAssunto: data['Encerramento_assunto'] as bool?,
        setoresColabEdit: data['Setores_colabEdit'] as bool?,
        contatoConexaoRetorno: data['contato_conexao_retorno'] as bool?,
      );

  static DropdownsObrigatoriosStruct? maybeFromMap(dynamic data) => data is Map
      ? DropdownsObrigatoriosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'horariosSetorBot': _horariosSetorBot,
        'usuarioPerfil': _usuarioPerfil,
        'usuarioSetor': _usuarioSetor,
        'usuarioGenero': _usuarioGenero,
        'setorForaAtendimento': _setorForaAtendimento,
        'setorResponsavel': _setorResponsavel,
        'Encerramento_tag': _encerramentoTag,
        'Encerramento_assunto': _encerramentoAssunto,
        'Setores_colabEdit': _setoresColabEdit,
        'contato_conexao_retorno': _contatoConexaoRetorno,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'horariosSetorBot': serializeParam(
          _horariosSetorBot,
          ParamType.bool,
        ),
        'usuarioPerfil': serializeParam(
          _usuarioPerfil,
          ParamType.bool,
        ),
        'usuarioSetor': serializeParam(
          _usuarioSetor,
          ParamType.bool,
        ),
        'usuarioGenero': serializeParam(
          _usuarioGenero,
          ParamType.bool,
        ),
        'setorForaAtendimento': serializeParam(
          _setorForaAtendimento,
          ParamType.bool,
        ),
        'setorResponsavel': serializeParam(
          _setorResponsavel,
          ParamType.bool,
        ),
        'Encerramento_tag': serializeParam(
          _encerramentoTag,
          ParamType.bool,
        ),
        'Encerramento_assunto': serializeParam(
          _encerramentoAssunto,
          ParamType.bool,
        ),
        'Setores_colabEdit': serializeParam(
          _setoresColabEdit,
          ParamType.bool,
        ),
        'contato_conexao_retorno': serializeParam(
          _contatoConexaoRetorno,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DropdownsObrigatoriosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DropdownsObrigatoriosStruct(
        horariosSetorBot: deserializeParam(
          data['horariosSetorBot'],
          ParamType.bool,
          false,
        ),
        usuarioPerfil: deserializeParam(
          data['usuarioPerfil'],
          ParamType.bool,
          false,
        ),
        usuarioSetor: deserializeParam(
          data['usuarioSetor'],
          ParamType.bool,
          false,
        ),
        usuarioGenero: deserializeParam(
          data['usuarioGenero'],
          ParamType.bool,
          false,
        ),
        setorForaAtendimento: deserializeParam(
          data['setorForaAtendimento'],
          ParamType.bool,
          false,
        ),
        setorResponsavel: deserializeParam(
          data['setorResponsavel'],
          ParamType.bool,
          false,
        ),
        encerramentoTag: deserializeParam(
          data['Encerramento_tag'],
          ParamType.bool,
          false,
        ),
        encerramentoAssunto: deserializeParam(
          data['Encerramento_assunto'],
          ParamType.bool,
          false,
        ),
        setoresColabEdit: deserializeParam(
          data['Setores_colabEdit'],
          ParamType.bool,
          false,
        ),
        contatoConexaoRetorno: deserializeParam(
          data['contato_conexao_retorno'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DropdownsObrigatoriosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropdownsObrigatoriosStruct &&
        horariosSetorBot == other.horariosSetorBot &&
        usuarioPerfil == other.usuarioPerfil &&
        usuarioSetor == other.usuarioSetor &&
        usuarioGenero == other.usuarioGenero &&
        setorForaAtendimento == other.setorForaAtendimento &&
        setorResponsavel == other.setorResponsavel &&
        encerramentoTag == other.encerramentoTag &&
        encerramentoAssunto == other.encerramentoAssunto &&
        setoresColabEdit == other.setoresColabEdit &&
        contatoConexaoRetorno == other.contatoConexaoRetorno;
  }

  @override
  int get hashCode => const ListEquality().hash([
        horariosSetorBot,
        usuarioPerfil,
        usuarioSetor,
        usuarioGenero,
        setorForaAtendimento,
        setorResponsavel,
        encerramentoTag,
        encerramentoAssunto,
        setoresColabEdit,
        contatoConexaoRetorno
      ]);
}

DropdownsObrigatoriosStruct createDropdownsObrigatoriosStruct({
  bool? horariosSetorBot,
  bool? usuarioPerfil,
  bool? usuarioSetor,
  bool? usuarioGenero,
  bool? setorForaAtendimento,
  bool? setorResponsavel,
  bool? encerramentoTag,
  bool? encerramentoAssunto,
  bool? setoresColabEdit,
  bool? contatoConexaoRetorno,
}) =>
    DropdownsObrigatoriosStruct(
      horariosSetorBot: horariosSetorBot,
      usuarioPerfil: usuarioPerfil,
      usuarioSetor: usuarioSetor,
      usuarioGenero: usuarioGenero,
      setorForaAtendimento: setorForaAtendimento,
      setorResponsavel: setorResponsavel,
      encerramentoTag: encerramentoTag,
      encerramentoAssunto: encerramentoAssunto,
      setoresColabEdit: setoresColabEdit,
      contatoConexaoRetorno: contatoConexaoRetorno,
    );
