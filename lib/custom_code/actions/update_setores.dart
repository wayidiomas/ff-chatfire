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

Future updateSetores(List<BotSetoresStruct> setores) async {
  // Add your function code here!
  final supabase = Supabase.instance.client;

  int i = 0;
  for (var setor in setores) {
    i++;
    await supabase
        .from('Setores')
        .update({'ativo_bot': setor.ativo, 'ordem': i}).eq('id', setor.setor);
  }
}
