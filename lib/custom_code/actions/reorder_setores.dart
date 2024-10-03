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

import 'package:supabase_flutter/supabase_flutter.dart';

Future reorderSetores(
  List<SetoresRow> setores,
  int oldIndex,
  int newIndex,
) async {
  // Add your function code here!
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  final item = setores.removeAt(oldIndex);

  setores.insert(newIndex, item);
  List<Map<String, dynamic>> map = [];

  for (int i = 0; i < setores.length; i++) {
    final setor = setores[i];
    map.add({'id': setor.id, 'ordem': i + 1});
  }

  await Supabase.instance.client.from('Setores').upsert(map);
}
