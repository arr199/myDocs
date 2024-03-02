import 'package:flutter/material.dart';
import 'package:highlighting/languages/javascript.dart';
import 'package:flutter_highlighting/themes/github-dark-dimmed.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';

class CodeBlockComponent extends StatelessWidget {
  final String content;

  CodeBlockComponent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      // The original code to be highlighted
      content,

      // Specify language
      // It is recommended to give it a value for performance
      languageId: javascript.id,
      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: githubDarkDimmedTheme,
      // Specify padding
      padding: EdgeInsets.all(12),
      // Specify text style
      textStyle: TextStyle(
        fontSize: 16,
      ),
    );
  }
}
