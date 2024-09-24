import 'package:flutter/material.dart';
import 'package:my_docs/features/docs/presentation/providers/add_document_provider.dart';
import 'package:provider/provider.dart';

class AddContentButton extends StatelessWidget {
  const AddContentButton({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final content = context.watch<AddDocumentProvider>().content;
    final type = context.watch<AddDocumentProvider>().type;
    print(context.watch<AddDocumentProvider>().componentsList.length);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          maximumSize: const Size(100, 50),
          backgroundColor: Colors.transparent,
          side: BorderSide(color: colors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
      onPressed: () {
        if (content.text.isEmpty) return;

        context.read<AddDocumentProvider>().addComponent(
              componentContent: content.text,
              componentType: type,
            );
        print(context.read<AddDocumentProvider>().componentsList.last.content);
        content.clear();
      },
      child: const Row(
        children: [
          Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
