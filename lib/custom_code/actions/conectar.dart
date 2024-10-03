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

Future conectar(
  String tabela,
  Future<dynamic> Function() acao,
) async {
  final supabase = SupaFlow.client;
  String table = tabela;
  final channelName = 'public:' + table;
  final channel = supabase.channel(channelName);

  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      acao();
      print('Reloaded.');
    },
  ).subscribe();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
