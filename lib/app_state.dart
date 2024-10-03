import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ConversaNomeContato =
          prefs.getString('ff_ConversaNomeContato') ?? _ConversaNomeContato;
    });
    _safeInit(() {
      _instancekey = prefs.getString('ff_instancekey') ?? _instancekey;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_colabUser')) {
        try {
          final serializedData = prefs.getString('ff_colabUser') ?? '{}';
          _colabUser =
              ColabUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _conexoesEmpresa =
          prefs.getStringList('ff_conexoesEmpresa') ?? _conexoesEmpresa;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _ConversaNomeContato = '';
  String get ConversaNomeContato => _ConversaNomeContato;
  set ConversaNomeContato(String value) {
    _ConversaNomeContato = value;
    prefs.setString('ff_ConversaNomeContato', value);
  }

  bool _menulateral = false;
  bool get menulateral => _menulateral;
  set menulateral(bool value) {
    _menulateral = value;
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;
  }

  String _subMenus = '';
  String get subMenus => _subMenus;
  set subMenus(String value) {
    _subMenus = value;
  }

  String _URLimage = '';
  String get URLimage => _URLimage;
  set URLimage(String value) {
    _URLimage = value;
  }

  String _URLfile = '';
  String get URLfile => _URLfile;
  set URLfile(String value) {
    _URLfile = value;
  }

  String _URLaudio = '';
  String get URLaudio => _URLaudio;
  set URLaudio(String value) {
    _URLaudio = value;
  }

  String _Nomefile = '';
  String get Nomefile => _Nomefile;
  set Nomefile(String value) {
    _Nomefile = value;
  }

  bool _templateVisivel = false;
  bool get templateVisivel => _templateVisivel;
  set templateVisivel(bool value) {
    _templateVisivel = value;
  }

  String _instancekey = '';
  String get instancekey => _instancekey;
  set instancekey(String value) {
    _instancekey = value;
    prefs.setString('ff_instancekey', value);
  }

  String _emoji = '';
  String get emoji => _emoji;
  set emoji(String value) {
    _emoji = value;
  }

  String _DropImage = '';
  String get DropImage => _DropImage;
  set DropImage(String value) {
    _DropImage = value;
  }

  String _pagina = 'dashboard';
  String get pagina => _pagina;
  set pagina(String value) {
    _pagina = value;
  }

  bool _showMenu = false;
  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    _showMenu = value;
  }

  dynamic _setoresEscolhidos;
  dynamic get setoresEscolhidos => _setoresEscolhidos;
  set setoresEscolhidos(dynamic value) {
    _setoresEscolhidos = value;
  }

  List<BotSetoresStruct> _setoresDT = [];
  List<BotSetoresStruct> get setoresDT => _setoresDT;
  set setoresDT(List<BotSetoresStruct> value) {
    _setoresDT = value;
  }

  void addToSetoresDT(BotSetoresStruct value) {
    setoresDT.add(value);
  }

  void removeFromSetoresDT(BotSetoresStruct value) {
    setoresDT.remove(value);
  }

  void removeAtIndexFromSetoresDT(int index) {
    setoresDT.removeAt(index);
  }

  void updateSetoresDTAtIndex(
    int index,
    BotSetoresStruct Function(BotSetoresStruct) updateFn,
  ) {
    setoresDT[index] = updateFn(_setoresDT[index]);
  }

  void insertAtIndexInSetoresDT(int index, BotSetoresStruct value) {
    setoresDT.insert(index, value);
  }

  BotFuncionamentoStruct _disponibilidade =
      BotFuncionamentoStruct.fromSerializableMap(jsonDecode(
          '{\"segunda\":\"{\\\"dia\\\":\\\"2\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"terca\":\"{\\\"dia\\\":\\\"3\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"quarta\":\"{\\\"dia\\\":\\\"4\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"quinta\":\"{\\\"dia\\\":\\\"5\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"sexta\":\"{\\\"dia\\\":\\\"6\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"sabado\":\"{\\\"dia\\\":\\\"7\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\",\"domingo\":\"{\\\"dia\\\":\\\"1\\\",\\\"inicio\\\":\\\"00:00\\\",\\\"fim\\\":\\\"23:00\\\",\\\"ativo\\\":\\\"true\\\"}\"}'));
  BotFuncionamentoStruct get disponibilidade => _disponibilidade;
  set disponibilidade(BotFuncionamentoStruct value) {
    _disponibilidade = value;
  }

  void updateDisponibilidadeStruct(Function(BotFuncionamentoStruct) updateFn) {
    updateFn(_disponibilidade);
  }

  String _URLDoc = '';
  String get URLDoc => _URLDoc;
  set URLDoc(String value) {
    _URLDoc = value;
  }

  ColabUserStruct _colabUser = ColabUserStruct();
  ColabUserStruct get colabUser => _colabUser;
  set colabUser(ColabUserStruct value) {
    _colabUser = value;
    prefs.setString('ff_colabUser', value.serialize());
  }

  void updateColabUserStruct(Function(ColabUserStruct) updateFn) {
    updateFn(_colabUser);
    prefs.setString('ff_colabUser', _colabUser.serialize());
  }

  DropdownsObrigatoriosStruct _dropdownObrigatorios =
      DropdownsObrigatoriosStruct.fromSerializableMap(jsonDecode(
          '{\"horariosSetorBot\":\"false\",\"usuarioPerfil\":\"false\",\"usuarioSetor\":\"false\",\"usuarioGenero\":\"false\",\"setorForaAtendimento\":\"false\",\"setorResponsavel\":\"false\"}'));
  DropdownsObrigatoriosStruct get dropdownObrigatorios => _dropdownObrigatorios;
  set dropdownObrigatorios(DropdownsObrigatoriosStruct value) {
    _dropdownObrigatorios = value;
  }

  void updateDropdownObrigatoriosStruct(
      Function(DropdownsObrigatoriosStruct) updateFn) {
    updateFn(_dropdownObrigatorios);
  }

  dynamic _JsonHorariosPadrao = jsonDecode(
      '{\"dias\":{\"1\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"2\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"3\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"4\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"5\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"6\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"},\"7\":{\"fim\":\"23:00\",\"ativo\":true,\"inicio\":\"00:00\"}}}');
  dynamic get JsonHorariosPadrao => _JsonHorariosPadrao;
  set JsonHorariosPadrao(dynamic value) {
    _JsonHorariosPadrao = value;
  }

  bool _numeroValido = false;
  bool get numeroValido => _numeroValido;
  set numeroValido(bool value) {
    _numeroValido = value;
  }

  bool _fotoValida = false;
  bool get fotoValida => _fotoValida;
  set fotoValida(bool value) {
    _fotoValida = value;
  }

  bool _isConected = false;
  bool get isConected => _isConected;
  set isConected(bool value) {
    _isConected = value;
  }

  String _URLVideo = '';
  String get URLVideo => _URLVideo;
  set URLVideo(String value) {
    _URLVideo = value;
  }

  List<String> _setores = [];
  List<String> get setores => _setores;
  set setores(List<String> value) {
    _setores = value;
  }

  void addToSetores(String value) {
    setores.add(value);
  }

  void removeFromSetores(String value) {
    setores.remove(value);
  }

  void removeAtIndexFromSetores(int index) {
    setores.removeAt(index);
  }

  void updateSetoresAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    setores[index] = updateFn(_setores[index]);
  }

  void insertAtIndexInSetores(int index, String value) {
    setores.insert(index, value);
  }

  int _loopCount = 0;
  int get loopCount => _loopCount;
  set loopCount(int value) {
    _loopCount = value;
  }

  bool _contaValidada = false;
  bool get contaValidada => _contaValidada;
  set contaValidada(bool value) {
    _contaValidada = value;
  }

  bool _mudaChat = false;
  bool get mudaChat => _mudaChat;
  set mudaChat(bool value) {
    _mudaChat = value;
  }

  String _fotoPerfilContato =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/chat-fire-copia-hzu4nb/assets/mok3lck9a0qc/unavailable.jpg';
  String get fotoPerfilContato => _fotoPerfilContato;
  set fotoPerfilContato(String value) {
    _fotoPerfilContato = value;
  }

  int _contatoEncaminhar = 0;
  int get contatoEncaminhar => _contatoEncaminhar;
  set contatoEncaminhar(int value) {
    _contatoEncaminhar = value;
  }

  int _replyWebhook = 0;
  int get replyWebhook => _replyWebhook;
  set replyWebhook(int value) {
    _replyWebhook = value;
  }

  String _contatoEncaminharNome = '';
  String get contatoEncaminharNome => _contatoEncaminharNome;
  set contatoEncaminharNome(String value) {
    _contatoEncaminharNome = value;
  }

  String _contatoEncaminharNumero = '';
  String get contatoEncaminharNumero => _contatoEncaminharNumero;
  set contatoEncaminharNumero(String value) {
    _contatoEncaminharNumero = value;
  }

  dynamic _dataWebhook;
  dynamic get dataWebhook => _dataWebhook;
  set dataWebhook(dynamic value) {
    _dataWebhook = value;
  }

  String _testeConexo = '';
  String get testeConexo => _testeConexo;
  set testeConexo(String value) {
    _testeConexo = value;
  }

  List<SetoresConexaoStruct> _setorConexao = [];
  List<SetoresConexaoStruct> get setorConexao => _setorConexao;
  set setorConexao(List<SetoresConexaoStruct> value) {
    _setorConexao = value;
  }

  void addToSetorConexao(SetoresConexaoStruct value) {
    setorConexao.add(value);
  }

  void removeFromSetorConexao(SetoresConexaoStruct value) {
    setorConexao.remove(value);
  }

  void removeAtIndexFromSetorConexao(int index) {
    setorConexao.removeAt(index);
  }

  void updateSetorConexaoAtIndex(
    int index,
    SetoresConexaoStruct Function(SetoresConexaoStruct) updateFn,
  ) {
    setorConexao[index] = updateFn(_setorConexao[index]);
  }

  void insertAtIndexInSetorConexao(int index, SetoresConexaoStruct value) {
    setorConexao.insert(index, value);
  }

  String _textfieldPreenchido = '';
  String get textfieldPreenchido => _textfieldPreenchido;
  set textfieldPreenchido(String value) {
    _textfieldPreenchido = value;
  }

  String _textoTest = 'nao';
  String get textoTest => _textoTest;
  set textoTest(String value) {
    _textoTest = value;
  }

  List<String> _conexoesEmpresa = [];
  List<String> get conexoesEmpresa => _conexoesEmpresa;
  set conexoesEmpresa(List<String> value) {
    _conexoesEmpresa = value;
    prefs.setStringList('ff_conexoesEmpresa', value);
  }

  void addToConexoesEmpresa(String value) {
    conexoesEmpresa.add(value);
    prefs.setStringList('ff_conexoesEmpresa', _conexoesEmpresa);
  }

  void removeFromConexoesEmpresa(String value) {
    conexoesEmpresa.remove(value);
    prefs.setStringList('ff_conexoesEmpresa', _conexoesEmpresa);
  }

  void removeAtIndexFromConexoesEmpresa(int index) {
    conexoesEmpresa.removeAt(index);
    prefs.setStringList('ff_conexoesEmpresa', _conexoesEmpresa);
  }

  void updateConexoesEmpresaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    conexoesEmpresa[index] = updateFn(_conexoesEmpresa[index]);
    prefs.setStringList('ff_conexoesEmpresa', _conexoesEmpresa);
  }

  void insertAtIndexInConexoesEmpresa(int index, String value) {
    conexoesEmpresa.insert(index, value);
    prefs.setStringList('ff_conexoesEmpresa', _conexoesEmpresa);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
