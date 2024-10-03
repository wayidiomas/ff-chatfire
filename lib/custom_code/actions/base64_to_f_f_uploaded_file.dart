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

import 'dart:convert';

Future<FFUploadedFile> base64ToFFUploadedFile(String base64String) async {
  // preciso de uma ação que transforme uma string de base64 em um FFuploaded File
  // Decodifica a string base64
  final bytes = base64Decode(base64String);

  // Cria um ffuploadedFile com os bytes decodificados
  final ffuploadedFile = FFUploadedFile(bytes: bytes);

  // Retorna o ffuploadedFile
  return ffuploadedFile;
}
