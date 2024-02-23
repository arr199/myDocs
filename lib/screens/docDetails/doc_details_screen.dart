import 'package:flutter/material.dart';

class DocumentDetailScreen extends StatelessWidget {
  final String id;

  const DocumentDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          'Arr Documentation asd',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Center(child: Text(id)),
    );
  }
}
