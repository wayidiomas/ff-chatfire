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

import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';
import 'dart:typed_data';

class IconRecordAndStop extends StatefulWidget {
  const IconRecordAndStop({
    Key? key,
    this.width,
    this.height,
    required this.senderid,
    required this.refconversas,
    this.onRecordStart,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String senderid;
  final int refconversas;
  final Function()? onRecordStart;

  @override
  _IconRecordAndStopState createState() => _IconRecordAndStopState();
}

class _IconRecordAndStopState extends State<IconRecordAndStop> {
  final record = FlutterSoundRecorder();
  bool recording = false;
  final supabase = Supabase.instance.client;
  DateTime now = DateTime.now();

  Future<Uint8List?> getUint8ListFromBlobUrl(String? blobUrl) async {
    if (blobUrl == null) {
      return null;
    }

    try {
      final response = await http.get(Uri.parse(blobUrl));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to download the file');
      }
    } catch (e) {
      print('Error downloading file: $e');
      return null;
    }
  }

  Future<void> startRecording() async {
    try {
      await record.openRecorder();
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      String millisecondsString = millisecondsSinceEpoch.toString();
      await record.startRecorder(
          toFile: '$millisecondsString.opus', codec: Codec.opusWebM);

      widget.onRecordStart?.call();

      FFAppState().update(() {
        FFAppState().isRecording = true;
      });
      setState(() {
        recording = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopRecordingAndUpload() async {
    final path = await record.stopRecorder();
    Uint8List? bytes = await getUint8ListFromBlobUrl(path);
    if (bytes != null) {
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      String millisecondsString = millisecondsSinceEpoch.toString();
      final fileName = '$millisecondsString.opus';
      final storage = supabase.storage;
      await storage.from('audio').uploadBinary('private/$fileName', bytes);

      // Supondo que getPublicUrl retorna diretamente a URL como uma String.
      String publicUrl =
          await storage.from('audio').getPublicUrl('private/$fileName');

      // Atualize o FFAppState com a URL do áudio gravado
      FFAppState().update(() {
        FFAppState().URLaudio = publicUrl;
      });
    }
    FFAppState().update(() {
      FFAppState().isRecording = false;
    });
    setState(() {
      recording = false;
      now = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        recording ? Color(0xFFFD2940) : Color(0xFF1A2437); // Cores atualizadas
    return Container(
      decoration: BoxDecoration(
        color: buttonColor, // Cor de fundo do botão
        shape: BoxShape.circle, // Faz o botão ser completamente redondo
      ),
      child: IconButton(
        icon: Icon(Icons.mic, size: 28.0, color: Colors.white), // Cor do ícone
        onPressed: recording ? stopRecordingAndUpload : startRecording,
      ),
    );
  }
}
