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

// Importação condicional baseada na plataforma
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<FFUploadedFile> urlToFile(String? url) async {
  if (url == null || url.isEmpty) {
    throw Exception('A URL fornecida é nula ou vazia.');
  }

  final response = await http.get(Uri.parse(url));
  if (response.statusCode != 200) {
    throw Exception('Erro ao baixar o arquivo: ${response.statusCode}');
  }

  final base64String = base64Encode(response.bodyBytes);
  final fileName = Uri.parse(url).pathSegments.last;

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(fileName, base64String);

  final ffUploadedFile = FFUploadedFile(
    name: fileName,
    bytes: response.bodyBytes,
  );

  return ffUploadedFile;
}
