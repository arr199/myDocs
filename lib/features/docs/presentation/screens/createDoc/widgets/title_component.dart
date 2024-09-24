import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String content;

  const TitleComponent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      textColor: colors.primary,
      title: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
      ),
    );
  }
}
