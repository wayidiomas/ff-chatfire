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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future callBot(
  String? idApi,
  int? refEmpresa,
  String? idConversa,
  String? msg,
) async {
  print('1: $idApi');
  print('2: $refEmpresa');
  print('3: $idConversa');
  print('4: $msg');
  var url = 'https://fntyzzstyetnbvrpqfre.supabase.co/functions/v1/bot';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk'
  };
  var body = {
    'idApi': idApi,
    'refEmpresa': refEmpresa,
    'idConversa': idConversa,
    'msg': msg
  };
  await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
}
