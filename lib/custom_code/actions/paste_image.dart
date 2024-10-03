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
import 'dart:typed_data';
import 'package:pasteboard/pasteboard.dart';

Future<String> pasteImage() async {
  final Uint8List? imageData = await Pasteboard.image;
  if (imageData == null) {
    return 'No image found on the clipboard';
  }

  final String base64Image = base64Encode(imageData);
  return base64Image;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
