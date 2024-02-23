import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_docs/schemas/doc.dart';

class DocsList extends StatelessWidget {
  const DocsList({
    super.key,
    required this.data,
  });

  final List<Document> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final item = data[index];
            return Item(item: item);
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Document item;
  const Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final description = item.description.length > 30
        ? "${item.description.substring(0, 30)} ..."
        : item.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(12),
              ),
            ),
            onPressed: () {
              context.goNamed("document",
                  pathParameters: {"id": item.id.toString()});
            },
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Text(description)),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
