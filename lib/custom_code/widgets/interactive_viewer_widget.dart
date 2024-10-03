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

class InteractiveViewerWidget extends StatefulWidget {
  const InteractiveViewerWidget({
    Key? key,
    this.width,
    this.height,
    this.urlimage5,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? urlimage5;

  @override
  _InteractiveViewerWidgetState createState() =>
      _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: widget.urlimage5 != null
            ? InteractiveViewer(
                constrained: false,
                scaleEnabled: true,
                child: Image.network(widget.urlimage5!),
              )
            : Center(child: Text('Sem imagem fornecida')),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
