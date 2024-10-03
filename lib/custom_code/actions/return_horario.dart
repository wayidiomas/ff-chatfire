// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<BotFuncionamentoStruct> returnHorario(int refEmpresa) async {
  // Add your function code here!
  final supabase = Supabase.instance.client;

  final botJson =
      await supabase.from('Bot').select('*').eq('id_empresa', refEmpresa);
  final Map<String, dynamic> bot = botJson[0];
  print(bot);
  final BotFuncionamentoStruct struct = BotFuncionamentoStruct();
  Map<String, dynamic> days = bot['funcionamento']['dias'];

  FuncionamentoDiaStruct returnFuncionamento(String key) {
    return FuncionamentoDiaStruct(
        ativo: days[key]["ativo"],
        inicio: days[key]["inicio"],
        fim: days[key]["fim"]);
  }

  struct.domingo = returnFuncionamento('1');
  struct.segunda = returnFuncionamento('2');
  struct.terca = returnFuncionamento('3');
  struct.quarta = returnFuncionamento('4');
  struct.quinta = returnFuncionamento('5');
  struct.sexta = returnFuncionamento('6');
  struct.sabado = returnFuncionamento('7');

  print(struct);

  return struct;
}
