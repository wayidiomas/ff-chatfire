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

import 'package:qr_flutter/qr_flutter.dart';

class Qrcode extends StatefulWidget {
  final double? width;
  final double? height;
  final String data;

  const Qrcode({
    Key? key,
    this.width,
    this.height,
    required this.data,
  }) : super(key: key);

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        QrImageView(
          data: widget.data,
          version: QrVersions.auto,
          size: widget.width ?? 200.0,
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
