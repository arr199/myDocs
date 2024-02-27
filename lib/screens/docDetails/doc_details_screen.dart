import 'package:flutter/material.dart';
import 'package:my_docs/shared/widgets/app_bar.dart';

class DocumentDetailScreen extends StatelessWidget {
  final String id;

  const DocumentDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(child: Text(id)),
    );
  }
}
