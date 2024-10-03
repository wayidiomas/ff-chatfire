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

import 'dart:convert'; // Importar para usar base64.encode
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileDropScreen extends StatefulWidget {
  const FileDropScreen({
    Key? key,
    this.width,
    this.height,
    this.ondrop,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? ondrop;

  @override
  _FileDropScreenState createState() => _FileDropScreenState();
}

class _FileDropScreenState extends State<FileDropScreen> {
  late DropzoneViewController controller;
  Uint8List? _imageBytes;
  ValueNotifier<bool> isHovered = ValueNotifier(false);

  Uint8List? get imageBytes => _imageBytes; // Getter público para _imageBytes

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          DropzoneView(
            operation: DragOperation.copy,
            onHover: () {
              isHovered.value = true;
            },
            onLeave: () {
              isHovered.value = false;
            },
            onCreated: (ctrl) => controller = ctrl,
            onLoaded: () => print('Zone loaded'),
            onError: (ev) => print('Zone error: $ev'),
            onDrop: (ev) async {
              isHovered.value = false;
              final data = await controller.getFileData(ev);
              if (data != null) {
                setState(() {
                  _imageBytes = data;
                });

                // 1. Codificar a imagem em base64
                final String base64Image = base64Encode(data);

                // 2. Salvar a imagem em base64 no estado global
                FFAppState().update(() {
                  FFAppState().DropImage = base64Image;
                });
                ;
              }
              // Chama a função ondrop assim que um arquivo é solto na Dropzone
              if (widget.ondrop != null) {
                await widget.ondrop!();
              }
            },
            onDropInvalid: (ev) => print('Zone invalid MIME: $ev'),
            onDropMultiple: (ev) async {
              print('Zone drop multiple: $ev');
            },
          ),
          Positioned.fill(
            child: ValueListenableBuilder<bool>(
              valueListenable: isHovered,
              builder: (context, isHovered, child) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  color: isHovered
                      ? Color.fromARGB(102, 40, 66, 115)
                      : Colors.transparent,
                  child: Center(
                    child: isHovered
                        ? Text(
                            'Pode soltar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          )
                        : Container(), // Container vazio, sem texto
                  ),
                );
              },
            ),
          ),
          if (_imageBytes != null) // Se houver imagem, exiba-a
            Positioned.fill(
              child: Image.memory(
                _imageBytes!,
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
