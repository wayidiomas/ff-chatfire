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

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

Future<String?> selectEmoji(BuildContext context) async {
  String selectedEmoji = '';

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                selectedEmoji = emoji.emoji!;
                // Fechar o dialog ao selecionar um emoji
                Navigator.of(context).pop();
              },
              config: Config(
                columns: 10,
                emojiSizeMax: 28.0,
                verticalSpacing: 0,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                categoryIcons: CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
              ),
            ),
          ),
        );
      });

  return selectedEmoji;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
