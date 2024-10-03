import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'teste_widget.dart' show TesteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TesteModel extends FlutterFlowModel<TesteWidget> {
  ///  Local state fields for this page.

  bool ver = false;

  bool listascroll = false;

  List<SetoresConexaoStruct> setorconexao = [];
  void addToSetorconexao(SetoresConexaoStruct item) => setorconexao.add(item);
  void removeFromSetorconexao(SetoresConexaoStruct item) =>
      setorconexao.remove(item);
  void removeAtIndexFromSetorconexao(int index) => setorconexao.removeAt(index);
  void insertAtIndexInSetorconexao(int index, SetoresConexaoStruct item) =>
      setorconexao.insert(index, item);
  void updateSetorconexaoAtIndex(
          int index, Function(SetoresConexaoStruct) updateFn) =>
      setorconexao[index] = updateFn(setorconexao[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
