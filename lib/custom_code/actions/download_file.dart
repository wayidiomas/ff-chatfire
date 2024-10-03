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

import 'dart:html' as html;
import 'package:http/http.dart' as http;

// Mapa de extensões de arquivo para mimetypes
Map<String, String> mimeTypes = {
  'mp3': 'audio/mpeg',
  'jpeg': 'image/jpeg',
  'png': 'image/png',
  'pdf': 'application/pdf',
  'txt': 'text/plain',
  'html': 'text/html',
  'csv': 'text/csv',
  'mp4': 'video/mp4',
  'gif': 'image/gif',
  'docx':
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  // Adicione mais conforme necessário
};

// Função para extrair a extensão do arquivo do URL
String getFileExtension(String url) {
  RegExp regExp = RegExp(r'\.([0-9a-zA-Z]+)$');
  RegExpMatch? match = regExp.firstMatch(url);
  if (match != null && match.groupCount >= 1) {
    return match.group(1) ??
        ''; // Retorna a extensão do arquivo ou uma string vazia se não encontrada
  } else {
    return ''; // Retorna uma string vazia se a correspondência não for encontrada
  }
}

Future<void> downloadFile(String fileUrl, String fileName) async {
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudHl6enN0eWV0bmJ2cnBxZnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTExMTM0NzksImV4cCI6MjAwNjY4OTQ3OX0.eaod7DsHG3Pc1ZBFSmvr3r6by-MtNf0hzjgjXzdN3Jk';

  // Faz uma requisição HTTP GET para obter o arquivo, incluindo a chave de API nos cabeçalhos
  final response = await http.get(
    Uri.parse(fileUrl),
    headers: {'Authorization': 'Bearer $apiKey'},
  );

  // Verifica se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    // Extrai a extensão do arquivo
    String extension = getFileExtension(fileUrl);
    // Obtém o mimetype baseado na extensão
    String mimeType = mimeTypes[extension] ?? 'application/octet-stream';

    // Cria um Blob com os bytes do arquivo e o mimetype correto
    final blob = html.Blob([response.bodyBytes], mimeType);

    // Cria uma URL para o Blob
    final url = html.Url.createObjectUrlFromBlob(blob);
    // Cria um elemento de âncora para fazer o download do Blob
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
    // Libera a URL do Blob após o download
    html.Url.revokeObjectUrl(url);
  } else {
    // Lida com o erro, se necessário
    print('Erro ao baixar o arquivo: ${response.statusCode}');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
