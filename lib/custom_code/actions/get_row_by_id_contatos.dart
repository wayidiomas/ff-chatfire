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

Future<ContatosRow> getRowByIdContatos(
  String? idValue,
) async {
  // null check
  idValue ??= 'error';

  List<ContatosRow> contatos = await ContatosTable().queryRows(
      queryFn: (q) => q.eq(
            'id',
            idValue,
          ));

  return contatos[0];
}
