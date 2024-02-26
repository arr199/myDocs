import 'package:flutter/material.dart';
import 'package:my_docs/data/data.dart';
import 'package:my_docs/schemas/doc.dart';

class SearchProvider extends ChangeNotifier {
  final searchInputController = TextEditingController();
  final searchInputFocusNode = FocusNode();
  List<Document> data =
      exampleData.map((e) => DocumentSchema.fromJson(e).toDocument()).toList();

  Future<void> filterSearch() async {
    final initialData = exampleData
        .map((e) => DocumentSchema.fromJson(e).toDocument())
        .toList();
    data = initialData.where((element) {
      final search = searchInputController.text.toLowerCase();
      final title = element.title.toLowerCase();
      final tags = element.tags.map((e) => e.toLowerCase()).toList();
      return title.contains(search) || tags.contains(search);
    }).toList();

    notifyListeners();
  }
}

// Path: lib/screens/search_screen.dart
