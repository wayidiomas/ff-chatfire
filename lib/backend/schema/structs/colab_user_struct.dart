// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColabUserStruct extends BaseStruct {
  ColabUserStruct({
    int? refEmpresa,
    String? nome,
    String? authId,
    int? idSetor,
    String? nomeEmpresa,
    String? email,
    String? tipo,
    String? keyColabUser,
    int? id,
    String? genero,
    String? foto,
    String? dataNascimento,
    String? contato,
    bool? ativo,
    bool? empresaAssunto,
    List<SetoresStruct>? setoresUsers,
    String? userMasterEmpresa,
    List<SetoresConexaoStruct>? setorConexao,
  })  : _refEmpresa = refEmpresa,
        _nome = nome,
        _authId = authId,
        _idSetor = idSetor,
        _nomeEmpresa = nomeEmpresa,
        _email = email,
        _tipo = tipo,
        _keyColabUser = keyColabUser,
        _id = id,
        _genero = genero,
        _foto = foto,
        _dataNascimento = dataNascimento,
        _contato = contato,
        _ativo = ativo,
        _empresaAssunto = empresaAssunto,
        _setoresUsers = setoresUsers,
        _userMasterEmpresa = userMasterEmpresa,
        _setorConexao = setorConexao;

  // "ref_empresa" field.
  int? _refEmpresa;
  int get refEmpresa => _refEmpresa ?? 0;
  set refEmpresa(int? val) => _refEmpresa = val;

  void incrementRefEmpresa(int amount) => refEmpresa = refEmpresa + amount;

  bool hasRefEmpresa() => _refEmpresa != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "auth_id" field.
  String? _authId;
  String get authId => _authId ?? '';
  set authId(String? val) => _authId = val;

  bool hasAuthId() => _authId != null;

  // "id_setor" field.
  int? _idSetor;
  int get idSetor => _idSetor ?? 0;
  set idSetor(int? val) => _idSetor = val;

  void incrementIdSetor(int amount) => idSetor = idSetor + amount;

  bool hasIdSetor() => _idSetor != null;

  // "nome_empresa" field.
  String? _nomeEmpresa;
  String get nomeEmpresa => _nomeEmpresa ?? '';
  set nomeEmpresa(String? val) => _nomeEmpresa = val;

  bool hasNomeEmpresa() => _nomeEmpresa != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  set tipo(String? val) => _tipo = val;

  bool hasTipo() => _tipo != null;

  // "keyColabUser" field.
  String? _keyColabUser;
  String get keyColabUser => _keyColabUser ?? '';
  set keyColabUser(String? val) => _keyColabUser = val;

  bool hasKeyColabUser() => _keyColabUser != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  set genero(String? val) => _genero = val;

  bool hasGenero() => _genero != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "data_nascimento" field.
  String? _dataNascimento;
  String get dataNascimento => _dataNascimento ?? '';
  set dataNascimento(String? val) => _dataNascimento = val;

  bool hasDataNascimento() => _dataNascimento != null;

  // "contato" field.
  String? _contato;
  String get contato => _contato ?? '';
  set contato(String? val) => _contato = val;

  bool hasContato() => _contato != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  set ativo(bool? val) => _ativo = val;

  bool hasAtivo() => _ativo != null;

  // "Empresa_assunto" field.
  bool? _empresaAssunto;
  bool get empresaAssunto => _empresaAssunto ?? false;
  set empresaAssunto(bool? val) => _empresaAssunto = val;

  bool hasEmpresaAssunto() => _empresaAssunto != null;

  // "setores_users" field.
  List<SetoresStruct>? _setoresUsers;
  List<SetoresStruct> get setoresUsers => _setoresUsers ?? const [];
  set setoresUsers(List<SetoresStruct>? val) => _setoresUsers = val;

  void updateSetoresUsers(Function(List<SetoresStruct>) updateFn) {
    updateFn(_setoresUsers ??= []);
  }

  bool hasSetoresUsers() => _setoresUsers != null;

  // "user_masterEmpresa" field.
  String? _userMasterEmpresa;
  String get userMasterEmpresa => _userMasterEmpresa ?? '';
  set userMasterEmpresa(String? val) => _userMasterEmpresa = val;

  bool hasUserMasterEmpresa() => _userMasterEmpresa != null;

  // "setorConexao" field.
  List<SetoresConexaoStruct>? _setorConexao;
  List<SetoresConexaoStruct> get setorConexao => _setorConexao ?? const [];
  set setorConexao(List<SetoresConexaoStruct>? val) => _setorConexao = val;

  void updateSetorConexao(Function(List<SetoresConexaoStruct>) updateFn) {
    updateFn(_setorConexao ??= []);
  }

  bool hasSetorConexao() => _setorConexao != null;

  static ColabUserStruct fromMap(Map<String, dynamic> data) => ColabUserStruct(
        refEmpresa: castToType<int>(data['ref_empresa']),
        nome: data['Nome'] as String?,
        authId: data['auth_id'] as String?,
        idSetor: castToType<int>(data['id_setor']),
        nomeEmpresa: data['nome_empresa'] as String?,
        email: data['email'] as String?,
        tipo: data['Tipo'] as String?,
        keyColabUser: data['keyColabUser'] as String?,
        id: castToType<int>(data['id']),
        genero: data['genero'] as String?,
        foto: data['foto'] as String?,
        dataNascimento: data['data_nascimento'] as String?,
        contato: data['contato'] as String?,
        ativo: data['ativo'] as bool?,
        empresaAssunto: data['Empresa_assunto'] as bool?,
        setoresUsers: getStructList(
          data['setores_users'],
          SetoresStruct.fromMap,
        ),
        userMasterEmpresa: data['user_masterEmpresa'] as String?,
        setorConexao: getStructList(
          data['setorConexao'],
          SetoresConexaoStruct.fromMap,
        ),
      );

  static ColabUserStruct? maybeFromMap(dynamic data) => data is Map
      ? ColabUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ref_empresa': _refEmpresa,
        'Nome': _nome,
        'auth_id': _authId,
        'id_setor': _idSetor,
        'nome_empresa': _nomeEmpresa,
        'email': _email,
        'Tipo': _tipo,
        'keyColabUser': _keyColabUser,
        'id': _id,
        'genero': _genero,
        'foto': _foto,
        'data_nascimento': _dataNascimento,
        'contato': _contato,
        'ativo': _ativo,
        'Empresa_assunto': _empresaAssunto,
        'setores_users': _setoresUsers?.map((e) => e.toMap()).toList(),
        'user_masterEmpresa': _userMasterEmpresa,
        'setorConexao': _setorConexao?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref_empresa': serializeParam(
          _refEmpresa,
          ParamType.int,
        ),
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'auth_id': serializeParam(
          _authId,
          ParamType.String,
        ),
        'id_setor': serializeParam(
          _idSetor,
          ParamType.int,
        ),
        'nome_empresa': serializeParam(
          _nomeEmpresa,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Tipo': serializeParam(
          _tipo,
          ParamType.String,
        ),
        'keyColabUser': serializeParam(
          _keyColabUser,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'genero': serializeParam(
          _genero,
          ParamType.String,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'data_nascimento': serializeParam(
          _dataNascimento,
          ParamType.String,
        ),
        'contato': serializeParam(
          _contato,
          ParamType.String,
        ),
        'ativo': serializeParam(
          _ativo,
          ParamType.bool,
        ),
        'Empresa_assunto': serializeParam(
          _empresaAssunto,
          ParamType.bool,
        ),
        'setores_users': serializeParam(
          _setoresUsers,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_masterEmpresa': serializeParam(
          _userMasterEmpresa,
          ParamType.String,
        ),
        'setorConexao': serializeParam(
          _setorConexao,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ColabUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColabUserStruct(
        refEmpresa: deserializeParam(
          data['ref_empresa'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        authId: deserializeParam(
          data['auth_id'],
          ParamType.String,
          false,
        ),
        idSetor: deserializeParam(
          data['id_setor'],
          ParamType.int,
          false,
        ),
        nomeEmpresa: deserializeParam(
          data['nome_empresa'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        tipo: deserializeParam(
          data['Tipo'],
          ParamType.String,
          false,
        ),
        keyColabUser: deserializeParam(
          data['keyColabUser'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        genero: deserializeParam(
          data['genero'],
          ParamType.String,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        dataNascimento: deserializeParam(
          data['data_nascimento'],
          ParamType.String,
          false,
        ),
        contato: deserializeParam(
          data['contato'],
          ParamType.String,
          false,
        ),
        ativo: deserializeParam(
          data['ativo'],
          ParamType.bool,
          false,
        ),
        empresaAssunto: deserializeParam(
          data['Empresa_assunto'],
          ParamType.bool,
          false,
        ),
        setoresUsers: deserializeStructParam<SetoresStruct>(
          data['setores_users'],
          ParamType.DataStruct,
          true,
          structBuilder: SetoresStruct.fromSerializableMap,
        ),
        userMasterEmpresa: deserializeParam(
          data['user_masterEmpresa'],
          ParamType.String,
          false,
        ),
        setorConexao: deserializeStructParam<SetoresConexaoStruct>(
          data['setorConexao'],
          ParamType.DataStruct,
          true,
          structBuilder: SetoresConexaoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ColabUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ColabUserStruct &&
        refEmpresa == other.refEmpresa &&
        nome == other.nome &&
        authId == other.authId &&
        idSetor == other.idSetor &&
        nomeEmpresa == other.nomeEmpresa &&
        email == other.email &&
        tipo == other.tipo &&
        keyColabUser == other.keyColabUser &&
        id == other.id &&
        genero == other.genero &&
        foto == other.foto &&
        dataNascimento == other.dataNascimento &&
        contato == other.contato &&
        ativo == other.ativo &&
        empresaAssunto == other.empresaAssunto &&
        listEquality.equals(setoresUsers, other.setoresUsers) &&
        userMasterEmpresa == other.userMasterEmpresa &&
        listEquality.equals(setorConexao, other.setorConexao);
  }

  @override
  int get hashCode => const ListEquality().hash([
        refEmpresa,
        nome,
        authId,
        idSetor,
        nomeEmpresa,
        email,
        tipo,
        keyColabUser,
        id,
        genero,
        foto,
        dataNascimento,
        contato,
        ativo,
        empresaAssunto,
        setoresUsers,
        userMasterEmpresa,
        setorConexao
      ]);
}

ColabUserStruct createColabUserStruct({
  int? refEmpresa,
  String? nome,
  String? authId,
  int? idSetor,
  String? nomeEmpresa,
  String? email,
  String? tipo,
  String? keyColabUser,
  int? id,
  String? genero,
  String? foto,
  String? dataNascimento,
  String? contato,
  bool? ativo,
  bool? empresaAssunto,
  String? userMasterEmpresa,
}) =>
    ColabUserStruct(
      refEmpresa: refEmpresa,
      nome: nome,
      authId: authId,
      idSetor: idSetor,
      nomeEmpresa: nomeEmpresa,
      email: email,
      tipo: tipo,
      keyColabUser: keyColabUser,
      id: id,
      genero: genero,
      foto: foto,
      dataNascimento: dataNascimento,
      contato: contato,
      ativo: ativo,
      empresaAssunto: empresaAssunto,
      userMasterEmpresa: userMasterEmpresa,
    );
