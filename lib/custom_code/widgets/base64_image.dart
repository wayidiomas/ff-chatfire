// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class Base64Image extends StatefulWidget {
  final double? width;
  final double? height;
  final String? base64String;

  const Base64Image({
    Key? key,
    this.width,
    this.height,
    this.base64String,
  }) : super(key: key);

  @override
  _Base64ImageState createState() => _Base64ImageState();
}

class _Base64ImageState extends State<Base64Image> {
  @override
  Widget build(BuildContext context) {
    // Verifica se base64String é nulo ou vazio
    if (widget.base64String == null || widget.base64String!.isEmpty) {
      return Container(
        child: Center(
          child: Text("Nenhuma imagem fornecida."),
        ),
      );
    }

    // Tenta decodificar a string base64
    Uint8List? bytes;
    try {
      bytes = base64Decode(widget.base64String!);
    } catch (e) {
      print("Erro ao decodificar a string base64: $e");
      return Container(
        child: Center(
          child: Text("Erro ao carregar a imagem"),
        ),
      );
    }

    // Retorna o widget de imagem com as dimensões especificadas (se fornecidas)
    return Image.memory(
      bytes,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
