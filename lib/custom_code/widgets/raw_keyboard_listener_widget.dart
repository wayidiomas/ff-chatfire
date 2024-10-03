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

import 'package:flutter/services.dart';

class RawKeyboardListenerWidget extends StatefulWidget {
  const RawKeyboardListenerWidget({
    Key? key,
    this.width,
    this.height,
    required this.onCtrlVPressed,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() onCtrlVPressed;

  @override
  _RawKeyboardListenerWidgetState createState() =>
      _RawKeyboardListenerWidgetState();
}

class _RawKeyboardListenerWidgetState extends State<RawKeyboardListenerWidget> {
  late FocusNode _focusNode;
  bool _isCtrlPressed = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyDown(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.isControlPressed) {
        _isCtrlPressed = true;
      } else if (_isCtrlPressed &&
          event.logicalKey == LogicalKeyboardKey.keyV) {
        widget.onCtrlVPressed();
      }
    } else if (event is RawKeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.controlLeft) {
      _isCtrlPressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white, // You can set your own color
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _handleKeyDown,
        child: const Center(
          child: Text(
            'Press Ctrl+V',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
